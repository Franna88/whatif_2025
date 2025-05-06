import 'package:flutter/material.dart';
import 'package:webdirectories/Watif/watif_navbar.dart';
import 'package:webdirectories/Watif/watif_routes.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class WatifAddVehicle extends StatefulWidget {
  const WatifAddVehicle({Key? key}) : super(key: key);

  @override
  State<WatifAddVehicle> createState() => _WatifAddVehicleState();
}

class _WatifAddVehicleState extends State<WatifAddVehicle> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _makeController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();

  String _selectedTransmission = 'Triptronic';
  String _selectedFuelType = 'Diesel';

  final ImagePicker _picker = ImagePicker();
  List<File> _selectedImages = [];
  int _currentImageIndex = 0;

  @override
  void dispose() {
    _nameController.dispose();
    _makeController.dispose();
    _modelController.dispose();
    _yearController.dispose();
    _colorController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        imageQuality: 80,
      );

      if (pickedFile != null) {
        setState(() {
          _selectedImages.add(File(pickedFile.path));
          _currentImageIndex = _selectedImages.length - 1;
        });
      }
    } catch (e) {
      // Handle any errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error picking image: $e'),
        ),
      );
    }
  }

  void _showImageSourceActionSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _saveVehicle() {
    // Logic to save vehicle
    // For now, just go back to the previous page
    Navigator.pop(context, {
      'name': _nameController.text,
      'make': _makeController.text,
      'model': _modelController.text,
      'year': _yearController.text,
      'color': _colorController.text,
      'transmission': _selectedTransmission,
      'fuelType': _selectedFuelType,
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double horizontalPadding = screenSize.width * 0.05;
    final double titleFontSize = screenSize.width * 0.06;
    final double subtitleFontSize = screenSize.width * 0.035;
    final double labelFontSize = screenSize.width * 0.04;

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: screenSize.width * 0.06,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'images/watif_logo.png',
                height: screenSize.height * 0.04,
                fit: BoxFit.contain,
                alignment: Alignment.centerLeft,
              ),
              Text(
                'Drive Smarter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: subtitleFontSize,
                ),
              ),
            ],
          ),
        ),
        titleSpacing: 16,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
                size: screenSize.width * 0.08,
              ),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
      drawer: null,
      endDrawer: const WatifNavbar(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF01070B),
              Color.fromARGB(255, 1, 37, 61),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenSize.height * 0.01),
                // Main container with white border
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.white, width: 0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: screenSize.height * 0.025,
                        horizontal: screenSize.width * 0.04,
                      ),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Vehicle Information",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: titleFontSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Register and keep track of your vehicles for easier access to services like repairs, towing, fuel tracking, and insurance claims. Add your details below.",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: subtitleFontSize,
                              ),
                            ),

                            // Save button
                            Center(
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: screenSize.height * 0.02),
                                width: screenSize.width * 0.25,
                                height: screenSize.height * 0.04,
                                child: ElevatedButton(
                                  onPressed: _saveVehicle,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1E466A),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    "Save",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: subtitleFontSize,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // Gallery section
                            Text(
                              "My Gallery",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: labelFontSize,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: screenSize.height * 0.01),

                            // Image carousel
                            Container(
                              height: screenSize.height * 0.15,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Stack(
                                children: [
                                  // Image or placeholder
                                  _selectedImages.isNotEmpty
                                      ? Center(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.file(
                                              _selectedImages[
                                                  _currentImageIndex],
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                              height: double.infinity,
                                            ),
                                          ),
                                        )
                                      : Center(
                                          child: GestureDetector(
                                            onTap: _showImageSourceActionSheet,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.add_a_photo,
                                                  color: Colors.black54,
                                                  size: screenSize.width * 0.08,
                                                ),
                                                SizedBox(
                                                    height: screenSize.height *
                                                        0.01),
                                                Text(
                                                  "Tap to add photos",
                                                  style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: labelFontSize,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                  // Add buttons only if there are images
                                  if (_selectedImages.isNotEmpty) ...[
                                    // Previous button
                                    Positioned(
                                      left: 5,
                                      top: 0,
                                      bottom: 0,
                                      child: GestureDetector(
                                        onTap: () {
                                          if (_selectedImages.isNotEmpty) {
                                            setState(() {
                                              _currentImageIndex =
                                                  (_currentImageIndex - 1) %
                                                      _selectedImages.length;
                                            });
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black26,
                                            shape: BoxShape.circle,
                                          ),
                                          padding: EdgeInsets.all(8),
                                          child: Icon(
                                            Icons.chevron_left,
                                            color: Colors.white,
                                            size: screenSize.width * 0.06,
                                          ),
                                        ),
                                      ),
                                    ),

                                    // Next button
                                    Positioned(
                                      right: 5,
                                      top: 0,
                                      bottom: 0,
                                      child: GestureDetector(
                                        onTap: () {
                                          if (_selectedImages.isNotEmpty) {
                                            setState(() {
                                              _currentImageIndex =
                                                  (_currentImageIndex + 1) %
                                                      _selectedImages.length;
                                            });
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black26,
                                            shape: BoxShape.circle,
                                          ),
                                          padding: EdgeInsets.all(8),
                                          child: Icon(
                                            Icons.chevron_right,
                                            color: Colors.white,
                                            size: screenSize.width * 0.06,
                                          ),
                                        ),
                                      ),
                                    ),

                                    // Clear button
                                    Positioned(
                                      right: 5,
                                      top: 5,
                                      child: GestureDetector(
                                        onTap: () {
                                          // Logic to remove the current image
                                          if (_selectedImages.isNotEmpty) {
                                            setState(() {
                                              _selectedImages
                                                  .removeAt(_currentImageIndex);
                                              if (_selectedImages.isEmpty) {
                                                _currentImageIndex = 0;
                                              } else if (_currentImageIndex >=
                                                  _selectedImages.length) {
                                                _currentImageIndex =
                                                    _selectedImages.length - 1;
                                              }
                                            });
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          padding: EdgeInsets.all(4),
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.black,
                                            size: screenSize.width * 0.03,
                                          ),
                                        ),
                                      ),
                                    ),

                                    // Add new image button
                                    Positioned(
                                      bottom: 8,
                                      left: 0,
                                      right: 0,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: _showImageSourceActionSheet,
                                            child: Container(
                                              padding: EdgeInsets.all(6),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 8),
                                              decoration: BoxDecoration(
                                                color: Colors.black45,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.add_a_photo,
                                                color: Colors.white,
                                                size: screenSize.width * 0.05,
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              // Logic to delete the image
                                              if (_selectedImages.isNotEmpty) {
                                                setState(() {
                                                  _selectedImages.removeAt(
                                                      _currentImageIndex);
                                                  if (_selectedImages.isEmpty) {
                                                    _currentImageIndex = 0;
                                                  } else if (_currentImageIndex >=
                                                      _selectedImages.length) {
                                                    _currentImageIndex =
                                                        _selectedImages.length -
                                                            1;
                                                  }
                                                });
                                              }
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(6),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 8),
                                              decoration: BoxDecoration(
                                                color: Colors.black45,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.delete,
                                                color: Colors.white,
                                                size: screenSize.width * 0.05,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),

                            SizedBox(height: screenSize.height * 0.02),

                            // Form fields
                            _buildFormField("Name Nickname*", _nameController,
                                "Thys Volvo", screenSize),
                            _buildFormField(
                                "Make*", _makeController, "Volvo", screenSize),
                            _buildFormField(
                                "Model*", _modelController, "XC90", screenSize),
                            _buildFormField(
                                "Year*", _yearController, "2016", screenSize),
                            _buildFormField("Color*", _colorController,
                                "Silver", screenSize),

                            // Dropdown fields
                            _buildDropdownField(
                                "Transmission Type",
                                _selectedTransmission,
                                ["Triptronic", "Automatic", "Manual"], (value) {
                              setState(() {
                                _selectedTransmission = value ?? "Triptronic";
                              });
                            }, screenSize),

                            _buildDropdownField("Fuel Type", _selectedFuelType,
                                ["Diesel", "Petrol", "Electric", "Hybrid"],
                                (value) {
                              setState(() {
                                _selectedFuelType = value ?? "Diesel";
                              });
                            }, screenSize),

                            // Save button at bottom
                            Center(
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: screenSize.height * 0.03),
                                width: screenSize.width * 0.25,
                                height: screenSize.height * 0.04,
                                child: ElevatedButton(
                                  onPressed: _saveVehicle,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1E466A),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    "Save",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: subtitleFontSize,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(String label, TextEditingController controller,
      String placeholder, Size screenSize) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenSize.height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenSize.width * 0.04,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: screenSize.height * 0.005),
          TextField(
            controller: controller,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: TextStyle(color: Colors.grey[500]),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField(String label, String value, List<String> options,
      Function(String?) onChanged, Size screenSize) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenSize.height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenSize.width * 0.04,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: screenSize.height * 0.005),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: DropdownButtonFormField<String>(
              value: value,
              onChanged: onChanged,
              items: options.map((option) {
                return DropdownMenuItem(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
