# Web Directories Dual-Site Architecture

## Overview

Web Directories uses a dual-site architecture to optimize for both SEO and user experience:

```
┌─────────────────────┐     ┌─────────────────────┐
│                     │     │                     │
│   Pre-rendered      │     │   Flutter Web App   │
│   Static Site       │     │                     │
│                     │     │                     │
└─────────┬───────────┘     └─────────┬───────────┘
          │                           │
          │                           │
┌─────────▼───────────────────────────▼───────────┐
│                                                 │
│              Firebase Functions                 │
│                                                 │
└─────────────────────┬───────────────────────────┘
                      │
                      │
          ┌───────────▼───────────┐
          │                       │
          │  Firestore Database   │
          │                       │
          └───────────────────────┘
```

## Components

### 1. Pre-rendered Static Site
- **Purpose**: SEO optimization, fast initial load
- **Technology**: Static HTML generated from Firebase Functions
- **URL**: https://web-directories-prerendered.web.app
- **Target Audience**: Search engines, first-time visitors

### 2. Flutter Web App
- **Purpose**: Rich interactive experience
- **Technology**: Flutter Web
- **URL**: https://webdirectories.co.za
- **Target Audience**: Regular users, returning visitors

### 3. Firebase Functions
- **Purpose**: Server-side logic, pre-rendering, API endpoints
- **Key Functions**:
  - `generateStaticProfile`: Creates static HTML for business profiles
  - `renderPage`: Generates static HTML for regular pages
  - `generateSitemap`: Creates XML sitemap for search engines
  - `Rlistings`: Returns JSON data of businesses

### 4. Firestore Database
- **Purpose**: Single source of truth for both sites
- **Key Collections**:
  - `listings`: Business listing data
  - Other collections as needed

## Request Flow

### Search Engine Bot Request
1. Bot requests a URL (e.g., `/panelbeaters-directory/123/profile`)
2. Firebase Hosting routes the request to the appropriate function
3. Function detects bot user agent
4. Function generates and returns static HTML
5. Bot receives SEO-optimized content

### Regular User Request
1. User requests a URL
2. Firebase Hosting serves the Flutter app shell
3. Flutter app initializes
4. App fetches data from Firestore
5. App renders interactive UI

## Deployment Considerations

### When to Update Both Sites
- Content structure changes
- New pages or sections
- URL structure changes
- SEO metadata updates

### When to Update Only Flutter App
- UI improvements
- Interactive features
- Client-side logic changes
- Performance optimizations

### When to Update Only Functions/Pre-rendered Site
- SEO optimizations
- Server-side logic changes
- Pre-rendering process improvements

## Common Pitfalls

1. **Content Drift**: Pre-rendered content becomes out of sync with Flutter app
   - Solution: Always update both when content changes

2. **SEO Penalties**: Search engines detect different content for bots vs. users
   - Solution: Ensure content consistency between sites

3. **Broken Links**: URL structure changes in one site but not the other
   - Solution: Coordinate URL structure changes across both sites

4. **Performance Issues**: Pre-rendered site becomes slow or unresponsive
   - Solution: Optimize pre-rendering process, use caching

## Best Practices

1. Use the deployment checklist for all updates
2. Test both sites after deployment
3. Monitor search engine indexing
4. Keep documentation updated
5. Maintain consistent URL structures
6. Use canonical URLs to prevent duplicate content issues 