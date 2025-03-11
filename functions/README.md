# Web Directories Pre-rendering System

This system generates static HTML files for improved SEO and performance as part of the project's dual-site architecture.

## Understanding the Dual-Site Architecture

Web Directories uses two complementary sites:

1. **Flutter Web App** - The main interactive application
2. **Pre-rendered Static Site** - SEO-optimized static HTML

The pre-rendering system is the bridge between these two sites, ensuring that search engines can properly index your content while users enjoy the full Flutter experience.

## How Pre-rendering Works

1. **Static HTML Generation**: The system creates HTML files that contain all the content search engines need to index your site.

2. **Bot Detection**: When a request comes in, our Firebase Functions check if it's from a search engine bot:
   - If it's a bot, it receives the pre-rendered static HTML
   - If it's a regular user, they're redirected to the interactive Flutter app

3. **Content Consistency**: Both sites pull data from the same Firestore database, ensuring content remains consistent.

## Setup

1. Install dependencies:
```bash
npm install
```

2. Set up Firebase credentials:
   - Go to the Firebase Console: https://console.firebase.google.com/
   - Select your project "web-directories"
   - Go to Project Settings > Service accounts
   - Click "Generate new private key"
   - Save the JSON file as `serviceAccountKey.json` in the functions directory

## Pre-rendering

To generate static HTML files:

```bash
npm run prerender
```

This will create static HTML files in the `src/www.webdirectories.co.za` directory.

## Deployment

To deploy the pre-rendered files to Firebase Hosting:

```bash
npm run deploy:prerendered
```

This will:
1. Build the TypeScript files
2. Run the pre-rendering process
3. Copy the pre-rendered files to the build/web directory
4. Deploy to Firebase Hosting

## Pre-rendered Pages

The following pages are pre-rendered:

- Home page (/)
- Panel beaters directory (/panelbeaters)
- About page (/about)
- Contact page (/contact)
- Individual business profiles (/panelbeaters-directory/{id}/profile)

## Adding New Pages to Pre-rendering

To add new pages to the pre-rendering process:

1. Open `functions/src/prerender.ts`
2. Find the `prerenderStaticPages` function
3. Add your new page to the `pages` array:

```typescript
const pages = [
  { path: '/', outputFile: 'index.html' },
  { path: '/panelbeaters', outputFile: 'panelbeaters/index.html' },
  { path: '/about', outputFile: 'about/index.html' },
  { path: '/contact', outputFile: 'contact/index.html' },
  // Add your new page here
  { path: '/your-new-page', outputFile: 'your-new-page/index.html' },
];
```

4. Run the pre-rendering process and deploy

## Maintaining SEO Best Practices

When modifying the pre-rendering system, ensure:

1. **Proper Metadata**: All pre-rendered pages should include:
   - Title tags
   - Meta descriptions
   - Canonical URLs
   - Structured data (when applicable)

2. **Content Completeness**: Pre-rendered pages should contain all important content, not just a shell.

3. **Mobile Friendliness**: Pre-rendered pages should be responsive and mobile-friendly.

4. **Performance**: Pre-rendered pages should load quickly and efficiently.

## Deployment Workflow

For the best results, follow this workflow when making changes:

1. Update the Firebase Functions if needed
2. Update the pre-rendering system if needed
3. Deploy the functions: `npm run deploy`
4. Generate and deploy pre-rendered content: `npm run deploy:prerendered`
5. Update and deploy the Flutter app if needed

## Troubleshooting

If you encounter issues with Firebase credentials:

1. Make sure you have the `serviceAccountKey.json` file in the functions directory
2. Ensure you're logged in to Firebase CLI: `firebase login`
3. Check that you're using the correct project: `firebase use web-directories`

If pre-rendered content is not updating:

1. Check the console output for errors during pre-rendering
2. Verify that the Firebase Functions are deployed and working correctly
3. Ensure the Firestore database is accessible and contains the expected data

## Technical Details

The pre-rendering system uses:

- Firebase Admin SDK to access Firestore data
- Firebase Functions to generate HTML content
- Mock request/response objects to simulate HTTP requests
- File system operations to write generated HTML to disk

The key components are:

- `prerender.js` - The main script that orchestrates the pre-rendering process
- `index.ts` - Contains the Firebase Functions that generate the HTML content
- Firebase Hosting configuration that routes requests appropriately 