import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/tow_truck_model.dart';
import '../../services/tow_truck_service.dart';
import 'dart:math' as math;

class FindTowTrucks extends StatefulWidget {
  const FindTowTrucks({Key? key}) : super(key: key);

  @override
  State<FindTowTrucks> createState() => _FindTowTrucksState();
}

class _FindTowTrucksState extends State<FindTowTrucks> {
  GoogleMapController? _mapController;
  Position? _userPosition;
  bool _isLoading = true;
  String _statusMessage = 'Getting your location...';
  Set<Marker> _markers = {};
  List<TowTruck> _nearbyTowTrucks = [];
  List<TowTruck> _filteredTowTrucks = [];
  double _searchRadius = 10.0; // km
  TowTruckFilter _currentFilter = TowTruckFilter();
  bool _showFilters = false;

  // Filter state variables
  double _maxPrice = 100.0;
  double _minRating = 1.0;
  List<String> _selectedVehicleTypes = [];
  List<String> _selectedServices = [];
  bool _verifiedOnly = false;

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
    _getCurrentLocation();
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
              'Location services are disabled. Please enable them.';
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
                'Location permissions are denied. We need location access to find nearby tow trucks.';
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
        _statusMessage = 'Getting your location...';
      });

      // Get the current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 10),
      );

      setState(() {
        _userPosition = position;
        _statusMessage = 'Location found! Searching for tow trucks...';
      });

      // Add user location marker
      _addUserLocationMarker();

      // Create sample data first (remove this in production)
      await TowTruckService.createSampleData(
          position.latitude, position.longitude);

      // Search for nearby tow trucks
      await _searchNearbyTowTrucks();
    } catch (e) {
      print('Error getting location: $e');
      setState(() {
        _statusMessage = 'Failed to get your location. Please try again.';
        _isLoading = false;
      });
    }
  }

  void _addUserLocationMarker() {
    if (_userPosition == null) return;

    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId('user_location'),
          position: LatLng(_userPosition!.latitude, _userPosition!.longitude),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          infoWindow: const InfoWindow(
            title: 'Your Location',
            snippet: 'You are here',
          ),
        ),
      );
    });
  }

  Future<void> _searchNearbyTowTrucks() async {
    if (_userPosition == null) return;

    try {
      setState(() {
        _statusMessage = 'Searching for available tow trucks...';
        _isLoading = true;
      });

      // Create filter with current settings
      TowTruckFilter filter = TowTruckFilter(
        maxPricePerKm: _maxPrice,
        minRating: _minRating,
        vehicleTypes:
            _selectedVehicleTypes.isEmpty ? null : _selectedVehicleTypes,
        requiredServices: _selectedServices.isEmpty ? null : _selectedServices,
        verifiedOnly: _verifiedOnly,
        maxDistanceKm: _searchRadius,
      );

      // Query Firebase for nearby tow trucks
      List<TowTruck> trucks = await TowTruckService.getNearbyTowTrucks(
        userLat: _userPosition!.latitude,
        userLng: _userPosition!.longitude,
        radiusKm: _searchRadius,
        filter: filter,
      );

      setState(() {
        _nearbyTowTrucks = trucks;
        _filteredTowTrucks = trucks;
        _isLoading = false;
        _statusMessage = 'Found ${trucks.length} tow trucks nearby';
      });

      // Add tow truck markers to the map
      _addTowTruckMarkers();
    } catch (e) {
      print('Error searching for tow trucks: $e');
      setState(() {
        _statusMessage = 'Error searching for tow trucks. Please try again.';
        _isLoading = false;
      });
    }
  }

  void _addTowTruckMarkers() {
    // Remove existing tow truck markers (keep user marker)
    _markers.removeWhere((marker) => marker.markerId.value != 'user_location');

    for (TowTruck truck in _filteredTowTrucks) {
      double distance = Geolocator.distanceBetween(
            _userPosition!.latitude,
            _userPosition!.longitude,
            truck.latitude,
            truck.longitude,
          ) /
          1000; // Convert to km

      setState(() {
        _markers.add(
          Marker(
            markerId: MarkerId(truck.id),
            position: LatLng(truck.latitude, truck.longitude),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              truck.isAvailable
                  ? BitmapDescriptor.hueOrange
                  : BitmapDescriptor.hueRed,
            ),
            infoWindow: InfoWindow(
              title: truck.company,
              snippet:
                  '${distance.toStringAsFixed(1)} km • ${truck.getEstimatedArrival(distance)} • ${truck.priceDisplay}',
            ),
            onTap: () => _showTowTruckDetails(truck, distance),
          ),
        );
      });
    }
  }

  void _showTowTruckDetails(TowTruck truck, double distance) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => _buildTowTruckDetailsSheet(truck, distance),
    );
  }

  Widget _buildTowTruckDetailsSheet(TowTruck truck, double distance) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: const BoxDecoration(
        color: Color(0xFF01070B),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),

          // Tow truck info header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: truck.isAvailable
                      ? const Color(0xFFFF8728).withOpacity(0.2)
                      : Colors.red.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  _getVehicleIcon(truck.vehicleType),
                  color:
                      truck.isAvailable ? const Color(0xFFFF8728) : Colors.red,
                  size: 30,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            truck.company,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        if (truck.isVerified)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.green, width: 1),
                            ),
                            child: const Text(
                              'VERIFIED',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                    Text(
                      'Driver: ${truck.driverName}',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          children: List.generate(
                              5,
                              (index) => Icon(
                                    Icons.star,
                                    color: index < truck.rating.floor()
                                        ? Colors.amber
                                        : Colors.grey,
                                    size: 14,
                                  )),
                        ),
                        Text(
                          ' ${truck.rating} (${truck.reviewCount} reviews)',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Details cards
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Distance and Price info
                  _buildInfoCard('Distance & Pricing', [
                    _buildInfoRow(Icons.location_on,
                        '${distance.toStringAsFixed(1)} km away', null),
                    _buildInfoRow(Icons.schedule,
                        'ETA: ${truck.getEstimatedArrival(distance)}', null),
                    _buildInfoRow(Icons.attach_money, truck.priceDisplay, null),
                    _buildInfoRow(
                        Icons.local_shipping, truck.vehicleTypeDisplay, null),
                  ]),

                  const SizedBox(height: 16),

                  // Services offered
                  _buildInfoCard(
                      'Services Offered',
                      truck.services
                          .map((service) => _buildInfoRow(
                              _getServiceIcon(service),
                              _getServiceName(service),
                              null))
                          .toList()),

                  const SizedBox(height: 16),

                  // Status
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: truck.isAvailable
                          ? Colors.green.withOpacity(0.1)
                          : Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: truck.isAvailable ? Colors.green : Colors.red,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          truck.isAvailable ? Icons.check_circle : Icons.cancel,
                          color: truck.isAvailable ? Colors.green : Colors.red,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            truck.isAvailable
                                ? 'Available Now'
                                : 'Currently Busy',
                            style: TextStyle(
                              color:
                                  truck.isAvailable ? Colors.green : Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Action buttons
          if (truck.isAvailable) ...[
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      _callTowTruck(truck);
                    },
                    icon: const Icon(Icons.phone, color: Colors.white),
                    label: const Text('Call Now',
                        style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6ECDF8),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      _requestTowTruck(truck);
                    },
                    icon: const Icon(Icons.send, color: Colors.white),
                    label: const Text('Request',
                        style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF8728),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
              ],
            ),
          ] else ...[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Currently Unavailable',
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF6ECDF8), size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style:
                  TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14),
            ),
          ),
          if (value != null)
            Text(
              value,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }

  Future<void> _callTowTruck(TowTruck truck) async {
    try {
      final Uri phoneUri = Uri(scheme: 'tel', path: truck.phoneNumber);
      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Could not launch phone app. Number: ${truck.phoneNumber}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error making call: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _requestTowTruck(TowTruck truck) {
    // TODO: Implement request functionality with Firebase
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Request sent to ${truck.company}!'),
        backgroundColor: const Color(0xFFFF8728),
        action: SnackBarAction(
          label: 'VIEW',
          onPressed: () {
            // TODO: Navigate to request tracking screen
          },
        ),
      ),
    );
  }

  Widget _buildFilterSheet() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: Color(0xFF01070B),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Handle bar
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),

          // Title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Filter Tow Trucks',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: _resetFilters,
                child: const Text(
                  'Reset',
                  style: TextStyle(color: Color(0xFF6ECDF8)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Price filter
                  _buildFilterSection('Max Price per KM', [
                    Text(
                      'R${_maxPrice.toStringAsFixed(0)} per km',
                      style: const TextStyle(
                          color: Color(0xFF6ECDF8),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Slider(
                      value: _maxPrice,
                      min: 10.0,
                      max: 100.0,
                      divisions: 18,
                      activeColor: const Color(0xFF6ECDF8),
                      inactiveColor: Colors.white.withOpacity(0.3),
                      onChanged: (value) => setState(() => _maxPrice = value),
                    ),
                  ]),

                  // Rating filter
                  _buildFilterSection('Minimum Rating', [
                    Text(
                      '${_minRating.toStringAsFixed(1)} stars and above',
                      style: const TextStyle(
                          color: Color(0xFF6ECDF8),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Slider(
                      value: _minRating,
                      min: 1.0,
                      max: 5.0,
                      divisions: 8,
                      activeColor: const Color(0xFF6ECDF8),
                      inactiveColor: Colors.white.withOpacity(0.3),
                      onChanged: (value) => setState(() => _minRating = value),
                    ),
                  ]),

                  // Vehicle type filter
                  _buildFilterSection('Vehicle Types', [
                    ...TowTruckService.getAvailableVehicleTypes().map(
                      (type) => CheckboxListTile(
                        title: Text(_getVehicleTypeName(type),
                            style: const TextStyle(color: Colors.white)),
                        value: _selectedVehicleTypes.contains(type),
                        activeColor: const Color(0xFF6ECDF8),
                        onChanged: (bool? value) {
                          setState(() {
                            if (value == true) {
                              _selectedVehicleTypes.add(type);
                            } else {
                              _selectedVehicleTypes.remove(type);
                            }
                          });
                        },
                      ),
                    ),
                  ]),

                  // Services filter
                  _buildFilterSection('Required Services', [
                    ...TowTruckService.getAvailableServices().map(
                      (service) => CheckboxListTile(
                        title: Text(_getServiceName(service),
                            style: const TextStyle(color: Colors.white)),
                        value: _selectedServices.contains(service),
                        activeColor: const Color(0xFF6ECDF8),
                        onChanged: (bool? value) {
                          setState(() {
                            if (value == true) {
                              _selectedServices.add(service);
                            } else {
                              _selectedServices.remove(service);
                            }
                          });
                        },
                      ),
                    ),
                  ]),

                  // Verified only
                  _buildFilterSection('Verification', [
                    SwitchListTile(
                      title: const Text('Verified drivers only',
                          style: TextStyle(color: Colors.white)),
                      value: _verifiedOnly,
                      activeColor: const Color(0xFF6ECDF8),
                      onChanged: (bool value) =>
                          setState(() => _verifiedOnly = value),
                    ),
                  ]),
                ],
              ),
            ),
          ),

          // Apply filters button
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _applyFilters();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6ECDF8),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text(
                'Apply Filters',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection(String title, List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ...children,
        ],
      ),
    );
  }

  void _resetFilters() {
    setState(() {
      _maxPrice = 100.0;
      _minRating = 1.0;
      _selectedVehicleTypes.clear();
      _selectedServices.clear();
      _verifiedOnly = false;
    });
  }

  void _applyFilters() {
    _searchNearbyTowTrucks();
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _mapController?.setMapStyle(_mapStyle);

    if (_userPosition != null) {
      _mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(_userPosition!.latitude, _userPosition!.longitude),
            zoom: 14.0,
          ),
        ),
      );
    }
  }

  IconData _getVehicleIcon(String vehicleType) {
    switch (vehicleType) {
      case 'heavy':
        return Icons.fire_truck;
      case 'motorcycle':
        return Icons.motorcycle;
      case 'flatbed':
        return Icons.local_shipping;
      default:
        return Icons.directions_car;
    }
  }

  String _getVehicleTypeName(String type) {
    switch (type) {
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

  IconData _getServiceIcon(String service) {
    switch (service) {
      case 'breakdown':
        return Icons.build;
      case 'accident':
        return Icons.warning;
      case 'transport':
        return Icons.local_shipping;
      case 'winch':
        return Icons.construction;
      default:
        return Icons.handyman;
    }
  }

  String _getServiceName(String service) {
    switch (service) {
      case 'breakdown':
        return 'Breakdown Recovery';
      case 'accident':
        return 'Accident Recovery';
      case 'transport':
        return 'Vehicle Transport';
      case 'winch':
        return 'Winch Service';
      default:
        return service;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

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
          'Find Tow Trucks',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Stack(
              children: [
                const Icon(Icons.filter_list, color: Colors.white),
                if (_hasActiveFilters())
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFF8728),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
            onPressed: () => showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              builder: (context) => _buildFilterSheet(),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: _getCurrentLocation,
          ),
        ],
      ),
      body: Column(
        children: [
          // Status bar
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: const Color(0xFF6ECDF8).withOpacity(0.1),
            child: Row(
              children: [
                if (_isLoading)
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xFF6ECDF8)),
                    ),
                  )
                else
                  Icon(
                    _filteredTowTrucks.isNotEmpty
                        ? Icons.check_circle
                        : Icons.location_on,
                    color: const Color(0xFF6ECDF8),
                    size: 20,
                  ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    _statusMessage,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),

          // Map
          Expanded(
            child: _userPosition == null
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
                            size: screenSize.width * 0.2,
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
                      target: LatLng(
                          _userPosition!.latitude, _userPosition!.longitude),
                      zoom: 14.0,
                    ),
                    markers: _markers,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    zoomControlsEnabled: false,
                    mapToolbarEnabled: false,
                  ),
          ),

          // Bottom controls
          if (_userPosition != null)
            Container(
              padding: const EdgeInsets.all(16),
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
                        'Search Radius:',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '${_searchRadius.toStringAsFixed(0)} km',
                        style: const TextStyle(
                            color: Color(0xFF6ECDF8),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Slider(
                    value: _searchRadius,
                    min: 5.0,
                    max: 50.0,
                    divisions: 9,
                    activeColor: const Color(0xFF6ECDF8),
                    inactiveColor: Colors.white.withOpacity(0.3),
                    onChanged: (value) => setState(() => _searchRadius = value),
                    onChangeEnd: (value) => _searchNearbyTowTrucks(),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  bool _hasActiveFilters() {
    return _maxPrice < 100.0 ||
        _minRating > 1.0 ||
        _selectedVehicleTypes.isNotEmpty ||
        _selectedServices.isNotEmpty ||
        _verifiedOnly;
  }
}
