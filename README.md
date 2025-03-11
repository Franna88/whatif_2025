# Web Directories

South Africa's Premier Business Directory.

## Project Architecture

This project uses a dual-site architecture for optimal SEO and user experience:

1. **Flutter Web App** - Interactive user experience
2. **Pre-rendered Static Site** - SEO-optimized content for search engines

### Why Two Sites?

- **SEO Requirements**: Search engines primarily index HTML content. While Google has improved JavaScript rendering, many search engines still struggle with it. Pre-rendered pages ensure your content is indexed properly.

- **User Experience**: We want both the SEO benefits of static HTML and the rich interactive experience of Flutter.

- **Best of Both Worlds**: Pre-rendered site serves static HTML to search engines and first-time visitors, while the Flutter app provides the full interactive experience once loaded.

### Important Considerations

- **Content Consistency**: The content in pre-rendered pages must match what users see in the Flutter app to avoid SEO penalties for "cloaking".

- **URL Structure**: Both sites must maintain the same URL structure to prevent navigation issues.

- **Deployment Coordination**: Changes to content structure require updates to both the pre-rendering system and the Flutter app.

## Project Structure

- `/functions` - Firebase Cloud Functions for server-side operations and pre-rendering
- `/webdirectories` - Flutter web application

## Features

- Business directory listings
- Search functionality
- Business profiles
- SEO optimization with pre-rendered pages

## Development

### Prerequisites

- Node.js 18 or later
- Firebase CLI
- Flutter SDK

### Setup

1. Clone the repository
2. Install dependencies:
```bash
cd functions && npm install
cd ../webdirectories && flutter pub get
```

3. Set up Firebase credentials (see [functions/README.md](functions/README.md))

### Running Locally

To run the Flutter web app:
```bash
cd webdirectories && flutter run -d chrome
```

To run the Firebase Functions emulator:
```bash
cd functions && npm run serve
```

To generate pre-rendered content locally:
```bash
cd functions && npm run prerender
```

## Deployment Process

**IMPORTANT**: When deploying changes, you must update both the Flutter app and the pre-rendered content to maintain consistency.

### 1. Deploy Functions Only

If you've only made changes to the Firebase Functions:

```bash
cd functions && npm run deploy
```

### 2. Deploy Flutter App Only

If you've only made changes to the Flutter app:

```bash
cd webdirectories && flutter build web
firebase deploy --only hosting:app
```

### 3. Deploy Pre-rendered Content Only

If you need to update the pre-rendered content:

```bash
cd functions && npm run deploy:prerendered
```

### 4. Full Deployment (Recommended)

For most changes, you should deploy everything to ensure consistency:

```bash
# Build and deploy functions
cd functions && npm run deploy

# Build Flutter app
cd ../webdirectories && flutter build web

# Deploy Flutter app
firebase deploy --only hosting:app

# Generate and deploy pre-rendered content
cd ../functions && npm run deploy:prerendered
```

## Hosting URLs

- **Flutter App**: https://webdirectories.co.za
- **Pre-rendered Site**: https://web-directories-prerendered.web.app

## SEO Optimization

This project uses a pre-rendering system to generate static HTML files for improved SEO. See the [functions/README.md](functions/README.md) for details on how the pre-rendering system works.

## Troubleshooting

### Content Inconsistency

If you notice differences between the pre-rendered site and the Flutter app:

1. Check that both sites are using the same data source
2. Ensure the pre-rendering script is generating up-to-date content
3. Re-deploy both sites to ensure consistency

### SEO Issues

If search engines are not properly indexing your content:

1. Verify that the pre-rendered site has proper meta tags and structured data
2. Check that the sitemap.xml is being generated correctly
3. Ensure that search engine bots are being served the pre-rendered content

## License

Proprietary - All rights reserved. 