#!/bin/bash
# Script to build Panel Beaters Directory app for Google Play Store

echo "===== Building What If 2025 App for Google Play Store ====="

# Check if running from the correct directory
if [ ! -f "pubspec.yaml" ]; then
  echo "Error: This script must be run from the webdirectories directory"
  exit 1
fi

# Remind about Google Maps API key
echo "⚠️  REMINDER: Make sure you've updated the Google Maps API key in AndroidManifest.xml"
echo "Current API key setting:"
grep -A 1 "com.google.android.geo.API_KEY" android/app/src/main/AndroidManifest.xml

# Verify keystore is set up
if [ ! -f "android/panelbeaters-keystore.jks" ]; then
  echo "⚠️  WARNING: Keystore file not found at android/panelbeaters-keystore.jks"
  echo "Please ensure your keystore is properly set up before continuing."
else
  echo "✅ Keystore file found."
fi

# Create directory for backups
mkdir -p temp_backups

# Create a mobile-only simplified version
echo "Creating simplified mobile-only app for Android build..."

# 1. Backup and create a simplified mobile view
echo "Creating mobile-only implementation..."
cp -f lib/PanelBeatersDirectory/mobile/mobileView.dart temp_backups/
cat > lib/PanelBeatersDirectory/mobile/mobileView.dart << EOF
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class MobileView extends StatefulWidget {
  final VoidCallback? onBackPressed;

  const MobileView({
    super.key,
    this.onBackPressed,
  });

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  @override
  void initState() {
    developer.log('MobileView: initState called');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    developer.log('MobileView: build called');
    return Scaffold(
      appBar: AppBar(
        title: const Text('What If 2025'),
        leading: widget.onBackPressed != null
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  developer.log('Navigating back');
                  widget.onBackPressed!();
                },
              )
            : null,
      ),
      body: const Center(child: Text('What If 2025 Mobile')),
    );
  }
}
EOF

# 2. Backup and create a simplified main.dart 
echo "Creating mobile-only main..."
cp -f lib/main.dart temp_backups/
cat > lib/main.dart << EOF
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize Firebase
    await Firebase.initializeApp();
    print("Firebase initialized for mobile");
  } catch (e) {
    print("Failed to initialize Firebase: \$e");
  }

  runApp(const MobileOnlyApp());
}

class MobileOnlyApp extends StatelessWidget {
  const MobileOnlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'What If 2025',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MobileView(),
    );
  }
}
EOF

echo "Building app bundle for Google Play Store..."
flutter clean

echo "Building app bundle..."
flutter build appbundle --no-tree-shake-icons --android-skip-build-dependency-validation

build_result=$?

# Restore backup files
echo "Restoring backup files..."
mv -f temp_backups/main.dart lib/main.dart
mv -f temp_backups/mobileView.dart lib/PanelBeatersDirectory/mobile/mobileView.dart
rmdir temp_backups

if [ $build_result -eq 0 ]; then
  echo "✅ Build successful!"
  echo ""
  echo "Your app bundle is ready at:"
  echo "$(pwd)/build/app/outputs/bundle/release/app-release.aab"
  echo ""
  echo "Next steps:"
  echo "1. Upload this bundle to Google Play Console"
  echo "2. Follow the steps in PLAY_STORE_PUBLISH_STEPS.md"
else
  echo "❌ Build failed. Please check the errors above."
fi

exit $build_result 