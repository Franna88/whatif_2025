import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminLightStoneKai/LightStoneComp/AdminLightEco.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/DashProfileView.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/LightStone/LightStone/LightStoneEcho/LightStoneEcho.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/LightStone/LightStone/WhoIsLightStone/WhoIsLightStone.dart';
import 'package:webdirectories/myutility.dart';

import 'LightStoneComp/AdminWhoIsLight.dart';

class AdminLightStone extends StatefulWidget {
  final dynamic data;

  const AdminLightStone({
    super.key,
    this.data, // Made data optional to allow null values
  });

  @override
  State<AdminLightStone> createState() => _AdminLightStoneState();
}

class _AdminLightStoneState extends State<AdminLightStone> {
  @override
  Widget build(BuildContext context) {
    // Cast or convert the data to Map<String, dynamic>
    final data = widget.data is Map
        ? Map<String, dynamic>.from(widget.data)
        : <String, dynamic>{}; // Fallback to empty map if casting fails

    return Scaffold(
      body: Container(
        width: MyUtility(context).width,
        height: MyUtility(context).height,
        decoration: const BoxDecoration(color: Color(0xFF171616)),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Column(
            children: [
              const DashProfileView(),
              Container(
                width: MyUtility(context).width,
                height: MyUtility(context).height * 0.82,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(0.57, -0.82),
                    end: const Alignment(-0.57, 0.82),
                    colors: [
                      const Color(0x19777777),
                      Colors.white.withOpacity(0.4),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0xBF000000),
                      blurRadius: 24,
                      offset: Offset(0, 4),
                      spreadRadius: -1,
                    )
                  ],
                ),
                child: Center(
                  child: Container(
                    width: MyUtility(context).width * 0.75,
                    height: MyUtility(context).height * 0.75,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF181B1D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AdminLightEco(
                                percentage: data.containsKey('lightstoneScore')
                                    ? data['lightstoneScore'].toString()
                                    : '0', // Default value if key is missing or data is null
                              ),
                              AdminWhoisLight(
                                data: data,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
