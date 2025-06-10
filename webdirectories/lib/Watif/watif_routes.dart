import 'package:flutter/material.dart';
import 'package:webdirectories/Watif/watif_home.dart';
import 'package:webdirectories/Watif/watif_account.dart';
import 'package:webdirectories/Watif/watif_settings.dart';
import 'package:webdirectories/Watif/watif_help.dart';
import 'package:webdirectories/Watif/watif_contact.dart';
import 'package:webdirectories/Watif/watif_profile.dart';
import 'package:webdirectories/Watif/watif_personal_info.dart';
import 'package:webdirectories/Watif/watif_vehicle_info.dart';
import 'package:webdirectories/Watif/watif_add_vehicle.dart';
import 'package:webdirectories/Watif/watif_add_trailer.dart';
import 'package:webdirectories/Watif/watif_add_motorcycle.dart';
import 'package:webdirectories/Watif/watif_documents.dart';
import 'package:webdirectories/Watif/watif_landing.dart';
import 'package:webdirectories/Watif/watif_startup.dart';
import 'package:webdirectories/Watif/WatifLoginPages/watif_login.dart';
import 'package:webdirectories/Watif/WatifLoginPages/watif_forgot_password.dart';
import 'package:webdirectories/Watif/WatifLoginPages/watif_loading.dart';
import 'package:webdirectories/Watif/WatifRegisterPages/watif_register_email.dart';
import 'package:webdirectories/Watif/WatifRegisterPages/watif_register_profile.dart';
import 'package:webdirectories/Watif/WatifRegisterPages/watif_register_welcome.dart';
import 'package:webdirectories/Watif/WatifDirectories/fuel_directory.dart';
import 'package:webdirectories/Watif/WatifDirectories/towing_directory.dart';

class WatifRoutes {
  // Define route names
  static const String startup = '/watif/startup';
  static const String landing = '/watif/landing';
  static const String home = '/watif/home';
  static const String homeWithBiometric = '/watif/home/biometric';
  static const String homeNewRegistration = '/watif/home/new_registration';
  static const String login = '/watif/login';
  static const String forgotPassword = '/watif/forgot_password';
  static const String loading = '/watif/loading';
  static const String account = '/account';
  static const String settings = '/settings';
  static const String help = '/help';
  static const String contact = '/contact';
  static const String profile = '/watif/profile';
  static const String personalInfo = '/watif/personal_info';
  static const String vehicleInfo = '/watif/vehicle_info';
  static const String addVehicle = '/watif/add_vehicle';
  static const String addTrailer = '/watif/add_trailer';
  static const String addMotorcycle = '/watif/add_motorcycle';
  static const String documents = '/watif/documents';
  static const String register = '/watif/register';
  static const String registerProfile = '/watif/register_profile';
  static const String registerWelcome = '/watif/register_welcome';
  static const String fuelDirectory = '/watif/directories/fuel';
  static const String towingDirectory = '/watif/directories/towing';

  // Route generator
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    print("Generating route for: ${routeSettings.name}");

    switch (routeSettings.name) {
      case startup:
        return MaterialPageRoute(
          builder: (_) => const WatifStartup(),
          settings: routeSettings,
        );
      case register:
        print("Creating register route");
        return MaterialPageRoute(
          builder: (_) => const WatifRegisterEmail(),
          settings: routeSettings,
        );
      case landing:
        return MaterialPageRoute(
          builder: (_) => const WatifLanding(),
          settings: routeSettings,
        );
      case login:
        return MaterialPageRoute(
          builder: (_) => const WatifLogin(),
          settings: routeSettings,
        );
      case forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const WatifForgotPassword(),
          settings: routeSettings,
        );
      case loading:
        return MaterialPageRoute(
          builder: (_) => const WatifLoading(),
          settings: routeSettings,
        );
      case home:
        return MaterialPageRoute(
          builder: (_) => const WatifHome(),
          settings: routeSettings,
        );
      case homeWithBiometric:
        return MaterialPageRoute(
          builder: (_) => const WatifHome(showBiometricPrompt: true),
          settings: routeSettings,
        );
      case homeNewRegistration:
        return MaterialPageRoute(
          builder: (_) => const WatifHome(
            showBiometricPrompt: true,
            isNewRegistration: true,
          ),
          settings: routeSettings,
        );
      case account:
        return MaterialPageRoute(
          builder: (_) => const WatifAccount(),
          settings: routeSettings,
        );
      case settings:
        return MaterialPageRoute(
          builder: (_) => const WatifSettings(),
          settings: routeSettings,
        );
      case help:
        return MaterialPageRoute(
          builder: (_) => const WatifHelp(),
          settings: routeSettings,
        );
      case contact:
        return MaterialPageRoute(
          builder: (_) => const WatifContact(),
          settings: routeSettings,
        );
      case profile:
        print("Creating profile route");
        return MaterialPageRoute(
          builder: (_) => const WatifProfile(),
          settings: routeSettings,
        );
      case personalInfo:
        print("Creating personal info route");
        return MaterialPageRoute(
          builder: (_) => const WatifPersonalInfo(),
          settings: routeSettings,
        );
      case vehicleInfo:
        print("Creating vehicle info route");
        return MaterialPageRoute(
          builder: (_) => const WatifVehicleInfo(),
          settings: routeSettings,
        );
      case addVehicle:
        print("Creating add vehicle route");
        return MaterialPageRoute(
          builder: (_) => const WatifAddVehicle(),
          settings: routeSettings,
        );
      case addTrailer:
        print("Creating add trailer route");
        return MaterialPageRoute(
          builder: (_) => const WatifAddTrailer(),
          settings: routeSettings,
        );
      case addMotorcycle:
        print("Creating add motorcycle route");
        return MaterialPageRoute(
          builder: (_) => const WatifAddMotorcycle(),
          settings: routeSettings,
        );
      case documents:
        print("Creating documents route");
        return MaterialPageRoute(
          builder: (_) => const WatifDocuments(),
          settings: routeSettings,
        );
      case fuelDirectory:
        print("Creating fuel directory route");
        return MaterialPageRoute(
          builder: (_) => const FuelDirectory(),
          settings: routeSettings,
        );
      case towingDirectory:
        print("Creating towing directory route");
        return MaterialPageRoute(
          builder: (_) => const TowingDirectory(),
          settings: routeSettings,
        );
      case registerProfile:
        // For this type of route, we expect parameters
        final args = routeSettings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => WatifRegisterProfile(
            email: args?['email'] ?? '',
          ),
          settings: routeSettings,
        );
      case registerWelcome:
        final args = routeSettings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => WatifRegisterWelcome(
            displayName: args?['displayName'] ?? 'User',
          ),
          settings: routeSettings,
        );
      // Add other routes as they are implemented
      default:
        print("Route not found: ${routeSettings.name}, defaulting to home");
        return MaterialPageRoute(
          builder: (_) => const WatifHome(),
          settings: const RouteSettings(name: home),
        );
    }
  }
}
