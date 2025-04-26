import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileView.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/mobileLandingPage.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ServicesMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/mainPageItems/ownersLoginMain.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/searchListings/mobileServicesNearMe/mobileServicesNearMe.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/searchListings/mobileServicesByAddress/mobileServicesByAddress.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage1/MobilePage1.dart';
import 'package:webdirectories/routes/routerNames.dart';

// Add missing router names to routerNames.dart if they don't exist there
extension RouterNamesExtension on Routernames {
  static String get panelbeatersServicesAccreditations =>
      'panelbeatersServicesAccreditations';
  static String get panelbeatersServicesAbout => 'panelbeatersServicesAbout';
}

class CustomMobileRouteObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route.settings.name == Routernames.panelbeatersServicesProfile) {
      final id =
          (route.settings.arguments as Map<String, dynamic>?)?['id'] as String?;
      // Add any specific mobile route handling here if needed
    }
  }
}

class MobileRouterconfig {
  static GoRouter returnRouter() {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: Routernames.home,
          builder: (context, state) => const MobilePage1(),
          routes: [
            GoRoute(
              path: 'panelbeaters-directory',
              name: Routernames.panelbeatersHome,
              builder: (BuildContext context, GoRouterState state) =>
                  const MobileView(),
              routes: [
                GoRoute(
                  path: ':id/profile',
                  name: Routernames.panelbeatersServicesProfile,
                  builder: (BuildContext context, GoRouterState state) {
                    return ServicesMobile(
                      listingId: state.pathParameters['id']!,
                    );
                  },
                ),
                GoRoute(
                  path: ':id/contact',
                  name: Routernames.panelbeatersServicesContact,
                  builder: (BuildContext context, GoRouterState state) =>
                      ServicesMobile(
                    listingId: state.pathParameters['id']!,
                  ),
                ),
                GoRoute(
                  path: ':id/maps',
                  name: Routernames.panelbeatersServicesMaps,
                  builder: (BuildContext context, GoRouterState state) =>
                      ServicesMobile(
                    listingId: state.pathParameters['id']!,
                  ),
                ),
                GoRoute(
                  path: ':id/accreditations',
                  name: RouterNamesExtension.panelbeatersServicesAccreditations,
                  builder: (BuildContext context, GoRouterState state) =>
                      ServicesMobile(
                    listingId: state.pathParameters['id']!,
                  ),
                ),
                GoRoute(
                  path: ':id/about',
                  name: RouterNamesExtension.panelbeatersServicesAbout,
                  builder: (BuildContext context, GoRouterState state) =>
                      ServicesMobile(
                    listingId: state.pathParameters['id']!,
                  ),
                ),
                GoRoute(
                  path: ':id/documents',
                  name: Routernames.panelbeatersServicesDocuments,
                  builder: (BuildContext context, GoRouterState state) =>
                      ServicesMobile(
                    listingId: state.pathParameters['id']!,
                  ),
                ),
                GoRoute(
                  path: ':id/reviews',
                  name: Routernames.panelbeatersServicesReviews,
                  builder: (BuildContext context, GoRouterState state) =>
                      ServicesMobile(
                    listingId: state.pathParameters['id']!,
                  ),
                ),
                GoRoute(
                  path: ':id/finance',
                  name: Routernames.panelbeatersServicesFinance,
                  builder: (BuildContext context, GoRouterState state) =>
                      ServicesMobile(
                    listingId: state.pathParameters['id']!,
                  ),
                ),
                GoRoute(
                  path: 'listings-near-me',
                  name: Routernames.panelbeatersNearMe,
                  builder: (BuildContext context, GoRouterState state) =>
                      const MobileServicesNearMe(),
                ),
                GoRoute(
                  path: 'listings-by-address',
                  name: Routernames.panelbeatersServicesByAddress,
                  builder: (BuildContext context, GoRouterState state) {
                    final params = state.extra as Map<String, dynamic>;
                    return MobileServicesByAddress(
                      addressData: params,
                    );
                  },
                ),
                GoRoute(
                  path: 'login',
                  name: Routernames.panelbeatersOPLogin,
                  builder: (BuildContext context, GoRouterState state) =>
                      const OwnersloginMain(),
                ),
              ],
            ),
          ],
        ),
      ],
      observers: [CustomMobileRouteObserver()],
    );
  }
}
