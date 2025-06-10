# Google Maps API Setup Guide

## 🗺️ Setting Up Google Maps for Watif Towing Directory

### Step 1: Get Google Maps API Key

1. **Go to Google Cloud Console:**
   - Visit: https://console.cloud.google.com/
   - Sign in with your Google account

2. **Create/Select Project:**
   - Create a new project or select existing one
   - Name it something like "Watif-Towing-App"

3. **Enable Required APIs:**
   Navigate to "APIs & Services" > "Library" and enable:
   - ✅ **Maps SDK for Android**
   - ✅ **Maps SDK for iOS** (if using iOS)
   - ✅ **Places API** (optional - for place search)
   - ✅ **Geocoding API** (optional - for address lookup)

4. **Create API Key:**
   - Go to "APIs & Services" > "Credentials"
   - Click "Create Credentials" > "API Key"
   - Copy the generated API key

### Step 2: Configure Android

1. **Edit AndroidManifest.xml:**
   - File: `android/app/src/main/AndroidManifest.xml`
   - Replace `YOUR_GOOGLE_MAPS_API_KEY_HERE` with your actual API key:

```xml
<meta-data android:name="com.google.android.geo.API_KEY"
           android:value="AIzaSyBdVl-cTICSwYKrZ95SuvNw7dbMuDt1KG0"/>
```

### Step 3: Configure iOS (Optional)

1. **Edit iOS Configuration:**
   - Add the API key to your iOS app configuration
   - File: `ios/Runner/AppDelegate.swift`

### Step 4: Security (Important!)

1. **Restrict API Key:**
   - In Google Cloud Console > Credentials
   - Click on your API key
   - Under "Application restrictions":
     - For Android: Select "Android apps" and add your package name
     - For iOS: Select "iOS apps" and add your bundle identifier

2. **API Restrictions:**
   - Under "API restrictions"
   - Select "Restrict key"
   - Choose only the APIs you enabled

### Step 5: Test the Setup

1. **Run the app:**
   ```bash
   flutter run
   ```

2. **Test location features:**
   - Go to "Find Tow Trucks Near Me"
   - Allow location permissions when prompted
   - You should see your location on the map

### Troubleshooting

**Location Permission Denied:**
- Make sure you granted location permissions in device settings
- Check that the permission request messages appear

**Map Not Loading:**
- Verify API key is correct
- Check that Maps SDK for Android/iOS is enabled
- Ensure API key restrictions allow your app

**"For development purposes only" watermark:**
- This appears when using unrestricted API keys
- Set up proper API key restrictions to remove it

### Cost Considerations

- Google Maps API has free tier: 28,500 map loads per month
- Monitor usage in Google Cloud Console
- Set up billing alerts to avoid unexpected charges

### Security Best Practices

1. **Never commit API keys to public repositories**
2. **Use environment variables for production**
3. **Set up proper API key restrictions**
4. **Monitor API usage regularly**

---

## 🚀 Quick Start Commands

After getting your API key:

```bash
# 1. Replace the API key in AndroidManifest.xml
# 2. Run the app
flutter clean
flutter pub get
flutter run

# 3. Test towing features:
# - Navigate to "Find Tow Trucks Near Me"
# - Allow location permissions
# - Your location should appear on the map
```

## 📞 Need Help?

If you encounter issues:
1. Check the Flutter console for error messages
2. Verify all APIs are enabled in Google Cloud Console
3. Ensure location permissions are granted on your device
4. Try running on a physical device (location works better than simulator) 