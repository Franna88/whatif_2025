import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:math' as math;
import '../models/tow_truck_model.dart';

class TowTruckService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const String _collectionName = 'tow_trucks';

  // Get nearby tow trucks within specified radius
  static Future<List<TowTruck>> getNearbyTowTrucks({
    required double userLat,
    required double userLng,
    required double radiusKm,
    TowTruckFilter? filter,
  }) async {
    try {
      // Calculate bounding box for initial query optimization
      Map<String, double> bounds =
          _calculateBoundingBox(userLat, userLng, radiusKm);

      // Query Firestore with bounding box to reduce data transfer
      QuerySnapshot snapshot = await _firestore
          .collection(_collectionName)
          .where('latitude', isGreaterThanOrEqualTo: bounds['latMin'])
          .where('latitude', isLessThanOrEqualTo: bounds['latMax'])
          .where('isAvailable', isEqualTo: true) // Only get available trucks
          .where('lastUpdated',
              isGreaterThan: DateTime.now()
                  .subtract(Duration(hours: 2))
                  .millisecondsSinceEpoch) // Only recent updates
          .get();

      List<TowTruck> nearbyTrucks = [];

      for (var doc in snapshot.docs) {
        TowTruck truck = TowTruck.fromFirestore(
          doc.data() as Map<String, dynamic>,
          doc.id,
        );

        // Calculate exact distance
        double distance = Geolocator.distanceBetween(
              userLat,
              userLng,
              truck.latitude,
              truck.longitude,
            ) /
            1000; // Convert to km

        // Check if within radius and longitude bounds
        if (distance <= radiusKm &&
            truck.longitude >= bounds['lngMin']! &&
            truck.longitude <= bounds['lngMax']!) {
          // Apply additional filters if provided
          if (filter == null || filter.matches(truck, distance)) {
            nearbyTrucks.add(truck);
          }
        }
      }

      // Sort by distance (closest first)
      nearbyTrucks.sort((a, b) {
        double distanceA = Geolocator.distanceBetween(
            userLat, userLng, a.latitude, a.longitude);
        double distanceB = Geolocator.distanceBetween(
            userLat, userLng, b.latitude, b.longitude);
        return distanceA.compareTo(distanceB);
      });

      return nearbyTrucks;
    } catch (e) {
      print('Error fetching nearby tow trucks: $e');
      throw Exception('Failed to fetch nearby tow trucks: $e');
    }
  }

  // Create sample data for demonstration (call this once to populate Firestore)
  static Future<void> createSampleData(double userLat, double userLng) async {
    try {
      // Only create if collection is empty
      QuerySnapshot existing =
          await _firestore.collection(_collectionName).limit(1).get();
      if (existing.docs.isNotEmpty) {
        print('Sample data already exists');
        return;
      }

      List<Map<String, dynamic>> sampleTrucks = [
        {
          'driverName': 'John Smith',
          'company': 'QuickTow Services',
          'phoneNumber': '+27812345671',
          'latitude': userLat + 0.005,
          'longitude': userLng + 0.005,
          'isAvailable': true,
          'rating': 4.8,
          'reviewCount': 156,
          'vehicleType': 'light',
          'pricePerKm': 25.0,
          'description':
              'Fast and reliable towing service for cars and light vehicles.',
          'services': ['breakdown', 'accident', 'transport'],
          'profileImage': '',
          'lastUpdated': DateTime.now().millisecondsSinceEpoch,
          'location': {'address': 'Main Street, City Center'},
          'isVerified': true,
          'licenseNumber': 'TOW12345'
        },
        {
          'driverName': 'Mike Johnson',
          'company': 'Reliable Towing',
          'phoneNumber': '+27812345672',
          'latitude': userLat - 0.008,
          'longitude': userLng + 0.003,
          'isAvailable': true,
          'rating': 4.5,
          'reviewCount': 89,
          'vehicleType': 'heavy',
          'pricePerKm': 45.0,
          'description': 'Heavy duty towing for trucks and large vehicles.',
          'services': ['breakdown', 'accident', 'transport', 'winch'],
          'profileImage': '',
          'lastUpdated': DateTime.now().millisecondsSinceEpoch,
          'location': {'address': 'Industrial Area, Highway'},
          'isVerified': true,
          'licenseNumber': 'TOW12346'
        },
        {
          'driverName': 'Sarah Williams',
          'company': 'FastResponse Tow',
          'phoneNumber': '+27812345673',
          'latitude': userLat + 0.012,
          'longitude': userLng - 0.007,
          'isAvailable': false,
          'rating': 4.9,
          'reviewCount': 203,
          'vehicleType': 'flatbed',
          'pricePerKm': 35.0,
          'description':
              'Specialized flatbed towing for luxury and classic cars.',
          'services': ['breakdown', 'accident', 'transport'],
          'profileImage': '',
          'lastUpdated': DateTime.now().millisecondsSinceEpoch,
          'location': {'address': 'North District, Business Area'},
          'isVerified': true,
          'licenseNumber': 'TOW12347'
        },
        {
          'driverName': 'David Brown',
          'company': '24/7 Towing',
          'phoneNumber': '+27812345674',
          'latitude': userLat - 0.003,
          'longitude': userLng - 0.009,
          'isAvailable': true,
          'rating': 4.2,
          'reviewCount': 67,
          'vehicleType': 'motorcycle',
          'pricePerKm': 20.0,
          'description': 'Motorcycle and scooter towing specialist.',
          'services': ['breakdown', 'transport'],
          'profileImage': '',
          'lastUpdated': DateTime.now().millisecondsSinceEpoch,
          'location': {'address': 'West Side, Residential'},
          'isVerified': false,
          'licenseNumber': 'TOW12348'
        },
      ];

      // Add each sample truck to Firestore
      for (var truckData in sampleTrucks) {
        await _firestore.collection(_collectionName).add(truckData);
      }

      print('Sample tow truck data created successfully');
    } catch (e) {
      print('Error creating sample data: $e');
      throw Exception('Failed to create sample data: $e');
    }
  }

  // Update tow truck availability
  static Future<void> updateAvailability(
      String truckId, bool isAvailable) async {
    try {
      await _firestore.collection(_collectionName).doc(truckId).update({
        'isAvailable': isAvailable,
        'lastUpdated': DateTime.now().millisecondsSinceEpoch,
      });
    } catch (e) {
      print('Error updating availability: $e');
      throw Exception('Failed to update availability: $e');
    }
  }

  // Update tow truck location (for drivers)
  static Future<void> updateLocation(
      String truckId, double lat, double lng) async {
    try {
      await _firestore.collection(_collectionName).doc(truckId).update({
        'latitude': lat,
        'longitude': lng,
        'lastUpdated': DateTime.now().millisecondsSinceEpoch,
      });
    } catch (e) {
      print('Error updating location: $e');
      throw Exception('Failed to update location: $e');
    }
  }

  // Get real-time updates for a specific tow truck
  static Stream<TowTruck> getTowTruckStream(String truckId) {
    return _firestore
        .collection(_collectionName)
        .doc(truckId)
        .snapshots()
        .map((doc) => TowTruck.fromFirestore(
              doc.data() as Map<String, dynamic>,
              doc.id,
            ));
  }

  // Calculate bounding box for geographic query optimization
  static Map<String, double> _calculateBoundingBox(
      double userLat, double userLng, double radiusKm) {
    const double earthRadius = 6371.0; // Earth's radius in kilometers

    // Latitude offset
    double latOffset = radiusKm / earthRadius;
    double latMin = userLat - latOffset * (180 / math.pi);
    double latMax = userLat + latOffset * (180 / math.pi);

    // Longitude offset depends on latitude
    double lngOffset =
        radiusKm / (earthRadius * math.cos(userLat * math.pi / 180));
    double lngMin = userLng - lngOffset * (180 / math.pi);
    double lngMax = userLng + lngOffset * (180 / math.pi);

    return {
      "latMin": latMin,
      "latMax": latMax,
      "lngMin": lngMin,
      "lngMax": lngMax,
    };
  }

  // Get available vehicle types
  static List<String> getAvailableVehicleTypes() {
    return ['light', 'heavy', 'motorcycle', 'flatbed'];
  }

  // Get available services
  static List<String> getAvailableServices() {
    return ['breakdown', 'accident', 'transport', 'winch'];
  }
}
