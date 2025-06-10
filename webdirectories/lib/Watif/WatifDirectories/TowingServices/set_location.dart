import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../models/tow_truck_model.dart';
import '../../services/tow_truck_service.dart';
import '../../utils/watif_storage.dart';
import 'dart:async';

class SetLocation extends StatefulWidget {
  const SetLocation({Key? key}) : super(key: key);

  @override
  State<SetLocation> createState() => _SetLocationState();
}

class _SetLocationState extends State<SetLocation> {
  GoogleMapController? _mapController;
  Position? _currentPosition;
  bool _isLoading = true;
  String _statusMessage = 'Getting your location...';
  Set<Marker> _markers = {};
  Set<Circle> _circles = {};

  // Driver state
  bool _isAvailable = false;
  bool _isOnline = false;
  double _serviceRadius = 15.0; // km
  String? _currentDriverId;
  TowTruck? _driverProfile;

  // Location tracking
  StreamSubscription<Position>? _locationSubscription;
  Timer? _locationUpdateTimer;

  // Stats
  int _todayRequests = 0;
  double _todayEarnings = 0.0;
  String _currentStatus = 'Offline';

  // Storage for driver preferences
  static const _storage = FlutterSecureStorage();

  // Map style for dark theme
  String _mapStyle = '''[
    {
      "elementType": "geometry",
      "stylers": [{"color": "#242f3e"}]
    },
    {
      "elementType": "labels.text.stroke", 
      "stylers": [{"color": "#242f3e"}]
    },
    {
      "elementType": "labels.text.fill",
      "stylers": [{"color": "#746855"}]
    },
    {
      "featureType": "road",
      "elementType": "geometry",
      "stylers": [{"color": "#38414e"}]
    },
    {
      "featureType": "road",
      "elementType": "geometry.stroke",
      "stylers": [{"color": "#212a37"}]
    },
    {
      "featureType": "road",
      "elementType": "labels.text.fill",
      "stylers": [{"color": "#9ca5b3"}]
    }
  ]''';

  @override
  void initState() {
    super.initState();
    _initializeDriver();
  }

  @override
  void dispose() {
    _locationSubscription?.cancel();
    _locationUpdateTimer?.cancel();
    super.dispose();
  }

  Future<void> _initializeDriver() async {
    try {
      // Get stored driver info (in a real app, this would be from user authentication)
      String? driverId = await _storage.read(key: 'driver_id');
      if (driverId == null) {
        // For demo purposes, create a demo driver
        driverId = 'demo_driver_${DateTime.now().millisecondsSinceEpoch}';
        await _storage.write(key: 'driver_id', value: driverId);
      }

      setState(() {
        _currentDriverId = driverId;
      });

      // Load driver profile
      await _loadDriverProfile();

      // Get current location
      await _getCurrentLocation();

      // Load saved preferences
      await _loadDriverPreferences();
    } catch (e) {
      print('Error initializing driver: $e');
      setState(() {
        _statusMessage = 'Failed to initialize driver dashboard';
        _isLoading = false;
      });
    }
  }

  Future<void> _loadDriverProfile() async {
    // In a real app, you would load this from Firebase based on authenticated user
    // For demo, we'll create a sample profile
    if (_currentDriverId != null) {
      setState(() {
        _driverProfile = TowTruck(
          id: _currentDriverId!,
          driverName: 'Demo Driver',
          company: 'Your Towing Service',
          phoneNumber: '+27812345678',
          latitude: 0.0,
          longitude: 0.0,
          isAvailable: false,
          rating: 4.5,
          reviewCount: 45,
          vehicleType: 'light',
          pricePerKm: 30.0,
          description: 'Reliable towing service',
          services: ['breakdown', 'accident', 'transport'],
          profileImage: '',
          lastUpdated: DateTime.now(),
          location: {},
          isVerified: true,
          licenseNumber: 'TOW12349',
        );
      });
    }
  }

  Future<void> _loadDriverPreferences() async {
    try {
      String? savedAvailability = await _storage.read(key: 'driver_available');
      String? savedRadius = await _storage.read(key: 'service_radius');

      setState(() {
        _isAvailable = savedAvailability == 'true';
        _serviceRadius =
            savedRadius != null ? double.tryParse(savedRadius) ?? 15.0 : 15.0;
        _isOnline = _isAvailable; // For demo, online = available
        _currentStatus = _isAvailable ? 'Available' : 'Offline';
      });
    } catch (e) {
      print('Error loading preferences: $e');
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      setState(() {
        _statusMessage = 'Checking location permissions...';
      });

      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() {
          _statusMessage =
              'Location services are disabled. Please enable them to set your location.';
          _isLoading = false;
        });
        return;
      }

      // Check for location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() {
            _statusMessage =
                'Location permissions are denied. We need location access to set your service location.';
            _isLoading = false;
          });
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() {
          _statusMessage =
              'Location permissions are permanently denied. Please enable them in settings.';
          _isLoading = false;
        });
        return;
      }

      setState(() {
        _statusMessage = 'Getting your current location...';
      });

      // Get the current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 10),
      );

      setState(() {
        _currentPosition = position;
        _statusMessage = 'Location set successfully!';
        _isLoading = false;
      });

      // Update driver profile location
      if (_driverProfile != null) {
        _driverProfile = TowTruck(
          id: _driverProfile!.id,
          driverName: _driverProfile!.driverName,
          company: _driverProfile!.company,
          phoneNumber: _driverProfile!.phoneNumber,
          latitude: position.latitude,
          longitude: position.longitude,
          isAvailable: _driverProfile!.isAvailable,
          rating: _driverProfile!.rating,
          reviewCount: _driverProfile!.reviewCount,
          vehicleType: _driverProfile!.vehicleType,
          pricePerKm: _driverProfile!.pricePerKm,
          description: _driverProfile!.description,
          services: _driverProfile!.services,
          profileImage: _driverProfile!.profileImage,
          lastUpdated: DateTime.now(),
          location: _driverProfile!.location,
          isVerified: _driverProfile!.isVerified,
          licenseNumber: _driverProfile!.licenseNumber,
        );
      }

      // Add markers and service area
      _addLocationMarker();
      _addServiceAreaCircle();

      // Start location tracking if driver is online
      if (_isOnline) {
        _startLocationTracking();
      }
    } catch (e) {
      print('Error getting location: $e');
      setState(() {
        _statusMessage = 'Failed to get your location. Please try again.';
        _isLoading = false;
      });
    }
  }

  void _addLocationMarker() {
    if (_currentPosition == null) return;

    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: const MarkerId('driver_location'),
          position:
              LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            _isAvailable ? BitmapDescriptor.hueGreen : BitmapDescriptor.hueRed,
          ),
          infoWindow: InfoWindow(
            title: 'Your Location',
            snippet:
                _isAvailable ? 'Available for service' : 'Currently offline',
          ),
        ),
      );
    });
  }

  void _addServiceAreaCircle() {
    if (_currentPosition == null) return;

    setState(() {
      _circles.clear();
      _circles.add(
        Circle(
          circleId: const CircleId('service_area'),
          center:
              LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
          radius: _serviceRadius * 1000, // Convert km to meters
          fillColor:
              (_isAvailable ? Colors.green : Colors.red).withOpacity(0.1),
          strokeColor: _isAvailable ? Colors.green : Colors.red,
          strokeWidth: 2,
        ),
      );
    });
  }

  void _startLocationTracking() {
    // Update location every 30 seconds when online
    _locationUpdateTimer = Timer.periodic(const Duration(seconds: 30), (timer) {
      if (_isOnline) {
        _updateLocationInBackground();
      } else {
        timer.cancel();
      }
    });
  }

  Future<void> _updateLocationInBackground() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium,
      );

      setState(() {
        _currentPosition = position;
      });

      // Update in Firebase (in a real app)
      if (_currentDriverId != null && _isOnline) {
        await TowTruckService.updateLocation(
          _currentDriverId!,
          position.latitude,
          position.longitude,
        );
      }

      // Update markers and circles
      _addLocationMarker();
      _addServiceAreaCircle();
    } catch (e) {
      print('Error updating location: $e');
    }
  }

  Future<void> _toggleAvailability() async {
    setState(() {
      _isAvailable = !_isAvailable;
      _isOnline = _isAvailable;
      _currentStatus = _isAvailable ? 'Available' : 'Offline';
    });

    // Save preference
    await _storage.write(
        key: 'driver_available', value: _isAvailable.toString());

    // Update in Firebase
    if (_currentDriverId != null) {
      await TowTruckService.updateAvailability(_currentDriverId!, _isAvailable);
    }

    // Update visual elements
    _addLocationMarker();
    _addServiceAreaCircle();

    // Start or stop location tracking
    if (_isOnline) {
      _startLocationTracking();
    } else {
      _locationUpdateTimer?.cancel();
    }

    // Show feedback
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isAvailable
              ? 'You are now available for service!'
              : 'You are now offline',
        ),
        backgroundColor: _isAvailable ? Colors.green : Colors.red,
      ),
    );
  }

  void _updateServiceRadius(double newRadius) {
    setState(() {
      _serviceRadius = newRadius;
    });

    // Save preference
    _storage.write(key: 'service_radius', value: newRadius.toString());

    // Update service area circle
    _addServiceAreaCircle();
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _mapController?.setMapStyle(_mapStyle);

    if (_currentPosition != null) {
      _mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target:
                LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
            zoom: 14.0,
          ),
        ),
      );
    }
  }

  Widget _buildStatusCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF01070B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: _isAvailable ? Colors.green : Colors.red,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Driver Status',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: _isAvailable ? Colors.green : Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _currentStatus,
                        style: TextStyle(
                          color: _isAvailable ? Colors.green : Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Switch(
                value: _isAvailable,
                onChanged: (value) => _toggleAvailability(),
                activeColor: Colors.green,
                inactiveThumbColor: Colors.red,
              ),
            ],
          ),
          if (_isAvailable) ...[
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildStatItem('Today\'s Requests', '$_todayRequests'),
                ),
                Container(
                  width: 1,
                  height: 40,
                  color: Colors.white.withOpacity(0.2),
                ),
                Expanded(
                  child: _buildStatItem(
                      'Earnings', 'R${_todayEarnings.toStringAsFixed(0)}'),
                ),
                Container(
                  width: 1,
                  height: 40,
                  color: Colors.white.withOpacity(0.2),
                ),
                Expanded(
                  child: _buildStatItem('Service Area',
                      '${_serviceRadius.toStringAsFixed(0)} km'),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Color(0xFF6ECDF8),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildQuickActions() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Quick Actions',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildActionButton(
                  'Update Profile',
                  Icons.person_outline,
                  const Color(0xFF6ECDF8),
                  () => _showProfileDialog(),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildActionButton(
                  'View Requests',
                  Icons.assignment_outlined,
                  const Color(0xFFFF8728),
                  () => _showRequestsDialog(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
      String title, IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3), width: 1),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                color: color,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _showProfileDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF01070B),
        title:
            const Text('Update Profile', style: TextStyle(color: Colors.white)),
        content: const Text(
          'Profile update functionality would be implemented here. This would include updating driver info, vehicle details, pricing, and services offered.',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child:
                const Text('Close', style: TextStyle(color: Color(0xFF6ECDF8))),
          ),
        ],
      ),
    );
  }

  void _showRequestsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF01070B),
        title: const Text('Service Requests',
            style: TextStyle(color: Colors.white)),
        content: const Text(
          'No pending requests at the moment. When customers request your services, they will appear here with details like location, urgency, and estimated payment.',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child:
                const Text('Close', style: TextStyle(color: Color(0xFF6ECDF8))),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF01070B),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Set Location',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: _getCurrentLocation,
          ),
        ],
      ),
      body: Column(
        children: [
          // Status card
          _buildStatusCard(),

          // Map
          Expanded(
            child: _currentPosition == null
                ? Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF01070B),
                          Color.fromARGB(255, 1, 37, 61)
                        ],
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_searching,
                            size: MediaQuery.of(context).size.width * 0.2,
                            color: const Color(0xFF6ECDF8),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            _statusMessage,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                          if (!_isLoading) ...[
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: _getCurrentLocation,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF6ECDF8),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 12),
                              ),
                              child: const Text('Try Again',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ],
                      ),
                    ),
                  )
                : GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(_currentPosition!.latitude,
                          _currentPosition!.longitude),
                      zoom: 14.0,
                    ),
                    markers: _markers,
                    circles: _circles,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    zoomControlsEnabled: false,
                    mapToolbarEnabled: false,
                  ),
          ),

          // Service radius control
          if (_currentPosition != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF01070B),
                border: Border(
                    top: BorderSide(
                        color: Colors.white.withOpacity(0.1), width: 1)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Service Radius:',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '${_serviceRadius.toStringAsFixed(0)} km',
                        style: const TextStyle(
                            color: Color(0xFF6ECDF8),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Slider(
                    value: _serviceRadius,
                    min: 5.0,
                    max: 50.0,
                    divisions: 9,
                    activeColor: const Color(0xFF6ECDF8),
                    inactiveColor: Colors.white.withOpacity(0.3),
                    onChanged: _updateServiceRadius,
                  ),
                ],
              ),
            ),

          // Quick actions
          const SizedBox(height: 16),
          _buildQuickActions(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
