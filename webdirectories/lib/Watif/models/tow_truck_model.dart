class TowTruck {
  final String id;
  final String driverName;
  final String company;
  final String phoneNumber;
  final double latitude;
  final double longitude;
  final bool isAvailable;
  final double rating;
  final int reviewCount;
  final String vehicleType; // 'light', 'heavy', 'motorcycle', 'flatbed'
  final double pricePerKm;
  final String description;
  final List<String>
      services; // ['breakdown', 'accident', 'transport', 'winch']
  final String profileImage;
  final DateTime lastUpdated;
  final Map<String, dynamic> location; // For real-time updates
  final bool isVerified;
  final String licenseNumber;

  TowTruck({
    required this.id,
    required this.driverName,
    required this.company,
    required this.phoneNumber,
    required this.latitude,
    required this.longitude,
    required this.isAvailable,
    required this.rating,
    required this.reviewCount,
    required this.vehicleType,
    required this.pricePerKm,
    required this.description,
    required this.services,
    required this.profileImage,
    required this.lastUpdated,
    required this.location,
    required this.isVerified,
    required this.licenseNumber,
  });

  // Create from Firestore document
  factory TowTruck.fromFirestore(Map<String, dynamic> data, String documentId) {
    return TowTruck(
      id: documentId,
      driverName: data['driverName'] ?? '',
      company: data['company'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      latitude: (data['latitude'] ?? 0.0).toDouble(),
      longitude: (data['longitude'] ?? 0.0).toDouble(),
      isAvailable: data['isAvailable'] ?? false,
      rating: (data['rating'] ?? 0.0).toDouble(),
      reviewCount: data['reviewCount'] ?? 0,
      vehicleType: data['vehicleType'] ?? 'light',
      pricePerKm: (data['pricePerKm'] ?? 0.0).toDouble(),
      description: data['description'] ?? '',
      services: List<String>.from(data['services'] ?? []),
      profileImage: data['profileImage'] ?? '',
      lastUpdated: DateTime.fromMillisecondsSinceEpoch(
        data['lastUpdated'] ?? DateTime.now().millisecondsSinceEpoch,
      ),
      location: data['location'] ?? {},
      isVerified: data['isVerified'] ?? false,
      licenseNumber: data['licenseNumber'] ?? '',
    );
  }

  // Convert to Firestore document
  Map<String, dynamic> toFirestore() {
    return {
      'driverName': driverName,
      'company': company,
      'phoneNumber': phoneNumber,
      'latitude': latitude,
      'longitude': longitude,
      'isAvailable': isAvailable,
      'rating': rating,
      'reviewCount': reviewCount,
      'vehicleType': vehicleType,
      'pricePerKm': pricePerKm,
      'description': description,
      'services': services,
      'profileImage': profileImage,
      'lastUpdated': lastUpdated.millisecondsSinceEpoch,
      'location': location,
      'isVerified': isVerified,
      'licenseNumber': licenseNumber,
    };
  }

  // Calculate estimated arrival time based on distance
  String getEstimatedArrival(double distanceKm) {
    // Assume average speed of 60 km/h in city, 80 km/h on highway
    double avgSpeed = distanceKm > 20 ? 80 : 60;
    double timeHours = distanceKm / avgSpeed;
    int timeMinutes = (timeHours * 60).round();

    int minTime = timeMinutes - 5;
    int maxTime = timeMinutes + 10;

    if (minTime < 10) minTime = 10;

    return '$minTime-$maxTime min';
  }

  // Get vehicle type display name
  String get vehicleTypeDisplay {
    switch (vehicleType) {
      case 'light':
        return 'Light Vehicle';
      case 'heavy':
        return 'Heavy Duty';
      case 'motorcycle':
        return 'Motorcycle';
      case 'flatbed':
        return 'Flatbed';
      default:
        return 'Standard';
    }
  }

  // Get price range display
  String get priceDisplay {
    return 'R${pricePerKm.toStringAsFixed(0)}/km';
  }

  // Check if truck offers specific service
  bool offersService(String service) {
    return services.contains(service);
  }
}

// Filter options for searching tow trucks
class TowTruckFilter {
  final double? maxPricePerKm;
  final double? minRating;
  final List<String>? vehicleTypes;
  final List<String>? requiredServices;
  final bool? verifiedOnly;
  final double? maxDistanceKm;

  TowTruckFilter({
    this.maxPricePerKm,
    this.minRating,
    this.vehicleTypes,
    this.requiredServices,
    this.verifiedOnly,
    this.maxDistanceKm,
  });

  // Check if a tow truck matches this filter
  bool matches(TowTruck truck, double distanceKm) {
    if (maxPricePerKm != null && truck.pricePerKm > maxPricePerKm!) {
      return false;
    }

    if (minRating != null && truck.rating < minRating!) {
      return false;
    }

    if (vehicleTypes != null && vehicleTypes!.isNotEmpty) {
      if (!vehicleTypes!.contains(truck.vehicleType)) {
        return false;
      }
    }

    if (requiredServices != null && requiredServices!.isNotEmpty) {
      for (String service in requiredServices!) {
        if (!truck.offersService(service)) {
          return false;
        }
      }
    }

    if (verifiedOnly == true && !truck.isVerified) {
      return false;
    }

    if (maxDistanceKm != null && distanceKm > maxDistanceKm!) {
      return false;
    }

    return true;
  }
}
