import 'package:flutter/material.dart';
import 'package:webdirectories/Watif/watif_routes.dart';
import 'package:webdirectories/Watif/watif_home.dart';

class WatifApp extends StatelessWidget {
  const WatifApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Watif',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF011F33),
        scaffoldBackgroundColor: const Color(0xFF01070B),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      initialRoute: WatifRoutes.landing,
      onGenerateRoute: WatifRoutes.generateRoute,
      navigatorKey: GlobalKey<NavigatorState>(),
    );
  }
}
