# Web Directories Deployment Checklist

Use this checklist to ensure that both the Flutter app and pre-rendered site remain in sync during deployments.

## Pre-Deployment Checks

- [ ] All code changes have been committed to version control
- [ ] Firebase CLI is installed and logged in (`firebase login`)
- [ ] Correct Firebase project is selected (`firebase use web-directories`)
- [ ] Service account key is available in functions directory (`serviceAccountKey.json`)
- [ ] All dependencies are installed (`npm install` in functions directory)
- [ ] Flutter dependencies are up to date (`flutter pub get` in webdirectories directory)

## Deployment Steps

### 1. Build and Deploy Functions

- [ ] Navigate to functions directory: `cd functions`
- [ ] Build TypeScript files: `npm run build`
- [ ] Deploy functions: `npm run deploy`
- [ ] Verify functions are working: Test each function endpoint

### 2. Build Flutter App

- [ ] Navigate to Flutter app directory: `cd webdirectories`
- [ ] Build web app: `flutter build web`
- [ ] Verify build output in `build/web` directory

### 3. Deploy Flutter App

- [ ] Deploy to Firebase Hosting: `firebase deploy --only hosting:app`
- [ ] Verify app is working at https://webdirectories.co.za

### 4. Generate and Deploy Pre-rendered Content

- [ ] Navigate to functions directory: `cd functions`
- [ ] Run pre-rendering: `npm run prerender`
- [ ] Verify pre-rendered files in `src/www.webdirectories.co.za` directory
- [ ] Deploy pre-rendered content: `npm run deploy:prerendered`
- [ ] Verify pre-rendered site is working at https://web-directories-prerendered.web.app

## Post-Deployment Verification

### Content Consistency

- [ ] Check that both sites display the same business listings
- [ ] Verify that business profiles show the same information on both sites
- [ ] Ensure navigation paths work consistently across both sites

### SEO Elements

- [ ] Verify meta tags are present in pre-rendered HTML
- [ ] Check that canonical URLs are correctly set
- [ ] Ensure structured data is properly formatted
- [ ] Verify sitemap.xml is accessible and contains all expected URLs

### Performance

- [ ] Test page load times on both sites
- [ ] Verify mobile responsiveness
- [ ] Check for any console errors

## Rollback Plan (If Needed)

If issues are detected after deployment:

1. Identify which component has issues (functions, Flutter app, or pre-rendered content)
2. Revert to the previous version in version control
3. Follow the deployment steps above to deploy the previous working version
4. Document the issue for future reference

## Notes

- Always deploy both sites when making content structure changes
- Keep Firebase Functions, Flutter app, and pre-rendered content in sync
- Test with both regular browsers and search engine bot user agents
- Monitor search engine indexing after significant changes 