# Publishing Panel Beaters Directory to Google Play Store

This guide outlines the exact steps to publish your app to the Google Play Store.

## Prerequisites
- Your signed app bundle (we'll create this below)
- Google Play Developer account (requires $25 one-time fee)
- App screenshots (at least 2 for each supported device type)
- App description (short and full)
- Privacy policy URL
- High-resolution app icon (512x512 PNG)
- Feature graphic (1024x500 PNG)

## Step 1: Build the signed app bundle

```bash
# Make sure you're in the webdirectories directory
cd webdirectories

# Build the app bundle
flutter build appbundle
```

Your app bundle will be created at: `build/app/outputs/bundle/release/app-release.aab`

## Step 2: Create your Google Play Store listing

1. Log in to [Google Play Console](https://play.google.com/console)
2. Click "Create app"
   - Select App as the platform
   - Enter "Panel Beaters Directory" as the app name
   - Choose the default language (English)
   - Select Free or Paid (as appropriate)
   - Accept the developer program policies
   - Click "Create app"

## Step 3: Complete the Store Listing

### Store presence > Main store listing
- Add app description (short and full)
- Upload screenshots (at least 2 for phone)
- Upload high-res icon (512x512 PNG)
- Add feature graphic (1024x500 PNG)
- Add app category: "Maps & Navigation" or "Business"

### Store presence > Content rating
- Complete the content rating questionnaire
- Your app should receive a rating like "Everyone" or "Everyone 10+"

### Store presence > Pricing & distribution
- Select the countries where you want to distribute the app
- Confirm the app is compliant with US export laws
- Confirm the app is free or paid

### Privacy policy
- Add your privacy policy URL

## Step 4: Set up app release

1. Go to "Testing > Internal testing"
2. Click "Create new release"
3. Upload your app bundle (.aab file)
4. Add release notes
5. Save and review the release
6. Start rollout to internal testing

## Step 5: Add testers

1. Go to "Testing > Internal testing > Testers"
2. Create a new tester list or use an existing one
3. Add tester email addresses
4. Save changes

## Step 6: Submit for review

Once all the required information has been provided:
1. Go to "Testing > Internal testing"
2. Click "Review release"
3. Submit for review

The review process typically takes 1-3 days for new apps. Once approved, your internal testers will receive an email with instructions to download and test the app.

## Step 7: Move to production (when ready)

After testing is complete and you're confident in your app:
1. Go to "Production > Create new release"
2. Upload the same or updated app bundle
3. Add release notes
4. Save and review the release
5. Start rollout to production

## Important Notes

- Make sure to replace the placeholder Google Maps API key with a real production API key
- Ensure your app complies with all Google Play policies
- Set up in-app purchases (if applicable) before moving to production
- Check the app thoroughly on various devices before submitting for review 