import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webdirectories/MyHome.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/services.dart';
import 'package:webdirectories/PanelBeatersDirectory/panelBeatersHome.dart';

GoRouter goRouter() {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
          path: '/', name: 'home', builder: (context, state) => const MyHome()),
      GoRoute(
        path: '/panelbeaters-directory',
        name: 'panelbeaters-directory',
        builder: (BuildContext context, GoRouterState state) =>
            const PanelBeatersHome(),
      ),
      GoRoute(
          path: '/panelbeaters-directory/:id',
          name: 'panelbeaters-directory-listing',
          builder: (BuildContext context, GoRouterState state) {
            return Services(listingId: '2473');
          }),
    ],
  );
}
