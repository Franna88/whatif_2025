import 'package:flutter/material.dart';
import 'package:webdirectories/Watif/watif_navbar.dart';
import 'package:webdirectories/Watif/watif_routes.dart';
import 'package:webdirectories/Watif/watif_delete_vehicle_popup.dart';
import 'package:webdirectories/Watif/watif_add_vehicle.dart';
import 'package:webdirectories/Watif/watif_add_trailer.dart';
import 'package:webdirectories/Watif/watif_add_motorcycle.dart';

class WatifVehicleInfo extends StatefulWidget {
  const WatifVehicleInfo({Key? key}) : super(key: key);

  @override
  State<WatifVehicleInfo> createState() => _WatifVehicleInfoState();
}

class _WatifVehicleInfoState extends State<WatifVehicleInfo> {
  List<String> vehicles = ['Thys Volvo', 'Jakkals Trailer', 'Hettie Kia'];

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double horizontalPadding = screenSize.width * 0.05;
    final double titleFontSize = screenSize.width * 0.06;
    final double subtitleFontSize = screenSize.width * 0.035;
    final double buttonFontSize = screenSize.width * 0.04;

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenSize.height * 0.02),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                            "Easily manage and update your vehicle\ninformation, you may add multiple vehicles\nbelow. Tap x to delete.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: subtitleFontSize,
                            ),
                          ),
                          SizedBox(height: screenSize.height * 0.03),
                          Text(
                            "My fleet",
                            style: TextStyle(
                              color: Colors.lightBlue,
                              fontSize: titleFontSize * 0.85,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: screenSize.height * 0.02),
                          Expanded(
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  ...vehicles.map((vehicle) =>
                                      _buildVehicleItem(vehicle, screenSize)),
                                  SizedBox(height: screenSize.height * 0.02),
                                  _buildAddButton(
                                      "Add new Vehicle",
                                      buttonFontSize,
                                      screenSize, onTap: () async {
                                    final result = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const WatifAddVehicle(),
                                      ),
                                    );

                                    if (result != null && mounted) {
                                      setState(() {
                                        vehicles.add(result['name']);
                                      });
                                    }
                                  }),
                                  SizedBox(height: screenSize.height * 0.015),
                                  _buildAddButton(
                                      "Add new Motorcycle",
                                      buttonFontSize,
                                      screenSize, onTap: () async {
                                    final result = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const WatifAddMotorcycle(),
                                      ),
                                    );

                                    if (result != null && mounted) {
                                      setState(() {
                                        vehicles.add(result['name']);
                                      });
                                    }
                                  }),
                                  SizedBox(height: screenSize.height * 0.015),
                                  _buildAddButton(
                                      "Add new Trailer, Camper or Van",
                                      buttonFontSize,
                                      screenSize, onTap: () async {
                                    final result = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const WatifAddTrailer(),
                                      ),
                                    );

                                    if (result != null && mounted) {
                                      setState(() {
                                        vehicles.add(result['name']);
                                      });
                                    }
                                  }),
                                ],
                              ),
                            ),
                          ),
                        ],
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

  Widget _buildVehicleItem(String vehicleName, Size screenSize) {
    return Container(
      margin: EdgeInsets.only(bottom: screenSize.height * 0.015),
      width: double.infinity,
      height: screenSize.height * 0.075,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1E466A),
            Color(0xFF0D2C46),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Text(
                vehicleName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenSize.width * 0.05,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
              size: screenSize.width * 0.05,
            ),
            onPressed: () async {
              final shouldDelete = await showDeleteVehicleConfirmation(
                context,
                vehicleName,
              );

              if (shouldDelete && mounted) {
                setState(() {
                  vehicles.remove(vehicleName);
                });
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton(String text, double fontSize, Size screenSize,
      {required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: screenSize.height * 0.045,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF01070B),
              Color(0xFF011733),
            ],
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
