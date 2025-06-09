# Google Play Store Deployment Guide

This document provides instructions on how to prepare and deploy the Panel Beaters Directory app to the Google Play Store for testing.

## Prerequisites

1. A Google Play Developer account ($25 one-time fee)
2. App signing key (generated as described below)
3. Flutter SDK installed and configured

## Generating a Signing Key

To create a signing key for your app:

```bash
keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

This will prompt you for passwords and certificate information. Keep this key secure! You'll need it for all future updates to your app.

## Configuring the App for Signing

1. Update the `android/key.properties` file with your keystore details:

```
storePassword=<password from above>
keyPassword=<password from above>
keyAlias=upload
storeFile=<path to the keystore file, e.g. /Users/yourname/upload-keystore.jks>
```

## Building the App Bundle

To build an Android App Bundle (preferred format for Google Play):

```bash
cd webdirectories
flutter build appbundle
```

This will create an app bundle at `build/app/outputs/bundle/release/app.aab`

## Testing the App Bundle

### Testing on Physical Devices

1. Connect your Android device via USB
2. Enable USB debugging
3. Run:

```bash
flutter install --release
```

### Testing via Google Play Internal Testing

1. Log in to your Google Play Console
2. Create a new app
3. Navigate to "Testing > Internal testing"
4. Create a new release
5. Upload the app bundle (.aab file)
6. Add testers via email addresses
7. Complete the release form and roll out to internal testing

## Troubleshooting

If you encounter issues with building or deploying:

1. Check the signing configuration
2. Verify the applicationId is unique in `android/app/build.gradle`
3. Ensure all required permissions are declared in AndroidManifest.xml
4. Update compileSdkVersion and targetSdkVersion to appropriate values

## App Store Listing Requirements

For Google Play Store listing, prepare:

1. App icon (512x512 PNG)
2. Feature graphic (1024x500 PNG)
3. Screenshots (minimum 2)
4. Short description (80 characters max)
5. Full description (4000 characters max)
6. Privacy policy URL 