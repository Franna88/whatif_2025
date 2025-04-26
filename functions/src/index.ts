import { onRequest } from 'firebase-functions/v2/https';
import type { Request } from 'firebase-functions/v2/https';
import * as admin from 'firebase-admin';
import { Response } from 'express';

// Initialize Firebase Admin with a named app
try {
  admin.initializeApp({
    credential: admin.credential.applicationDefault()
  });
} catch (error) {
  // If app already exists, use it
  console.log('Firebase app already exists, using existing app');
}

// Enhanced version of generateStaticProfile that generates static HTML
export const generateStaticProfile = onRequest(async (req: Request, res: Response) => {
  try {
    console.log('Request details:', {
      fullPath: req.path,
      pathSegments: req.path.split('/'),
      rawBusinessId: req.path.split('/').pop(),
      headers: req.headers,
      userAgent: req.headers['user-agent']
    });

    // Fix the business ID extraction
    const pathParts = req.path.split('/').filter((part: string) => part.length > 0);
    const businessId = pathParts.length > 0 ? pathParts[pathParts.length - 2] : null;

    console.log('Extracted business ID:', businessId);

    if (!businessId) {
      res.status(400).send('Business ID is required');
      return;
    }

    // Improved bot detection logic
    const userAgent = (req.headers['user-agent'] || '').toLowerCase();
    console.log('User agent for bot detection:', userAgent);

    // Check if request is from a bot - more comprehensive check
    const botPatterns = ['bot', 'crawler', 'spider', 'googlebot', 'bingbot', 'slurp', 'duckduckbot', 'baiduspider', 'yandex'];
    const isBot = botPatterns.some(pattern => userAgent.includes(pattern));

    // For testing purposes, also treat curl requests with Googlebot in the user agent as bots
    const isCurlWithGooglebot = userAgent.includes('curl') && req.headers['user-agent']?.includes('Googlebot');

    // For testing, always serve static content on the prerendered site or if a test parameter is present
    const isPrerenderedSite = req.headers['x-forwarded-host']?.includes('prerendered') || false;
    const hasTestParam = req.query.test === 'static' || req.query.seo === 'true';

    console.log('Is bot?', isBot || isCurlWithGooglebot || isPrerenderedSite || hasTestParam);

    // Only redirect regular users on the main site, not on the prerendered site or if test param is present
    if (!isBot && !isCurlWithGooglebot && !isPrerenderedSite && !hasTestParam) {
      // Regular users get redirected to the dynamic app
      console.log('Redirecting regular user to dynamic app');
      res.redirect(`/panelbeaters-directory/${businessId}/profile`);
      return;
    }

    // Let's check if the business exists first
    const snapshot = await admin.firestore()
      .collection('listings')
      .where('listingsId', 'in', [businessId, parseInt(businessId || '0')])
      .limit(1)
      .get();

    if (snapshot.empty) {
      console.log('DEBUG: No matching documents');
      res.status(404).send('Profile not found');
      return;
    }

    const data = snapshot.docs[0].data();
    console.log('DEBUG: Found business data');

    // Generate static HTML
    // Sanitize data to prevent XSS
    const sanitize = (str: string | undefined) => str?.replace(/[<>]/g, '') || '';

    // Extract city from address if not directly available
    const extractCity = (address: string | undefined) => {
      if (!address) return '';
      const parts = address.split(',');
      return parts.length > 1 ? parts[parts.length - 3]?.trim() : '';
    };

    // Improve province extraction
    const extractProvince = (address: string | undefined) => {
      if (!address) return '';
      const parts = address.split(',');
      return parts.length > 2 ? parts[parts.length - 2]?.trim() : '';
    };

    // Get city either from data.city or extract from address
    const city = data.city || extractCity(data.streetaddress || '');
    const province = data.province || extractProvince(data.streetaddress || '');

    // Update getLocationText to use extracted city
    const getLocationText = (cityName: string | undefined) => {
      return cityName ? `in ${cityName}` : 'in South Africa';
    };

    // Construct the static HTML content
    const staticHtml = `
      <!DOCTYPE html>
      <html lang="en">
        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>${sanitize(data.title || data.businessname)} - Panel Beaters Directory</title>
          <meta name="description" content="${sanitize(data.description || `Professional panel beating services ${getLocationText(city)}`)}">
          <meta name="robots" content="index, follow">
          <link rel="canonical" href="https://webdirectories.co.za/panelbeaters-directory/${businessId}/profile">
          
          <script type="application/ld+json">
            {
              "@context": "https://schema.org",
              "@type": "AutoRepair",
              "name": "${sanitize(data.title || data.businessname)}",
              "description": "${sanitize(data.description || `Professional panel beating services ${getLocationText(city)}`)}",
              "address": {
                "@type": "PostalAddress",
                "streetAddress": "${sanitize(data.streetaddress || '')}",
                "addressLocality": "${sanitize(city)}",
                "addressRegion": "${sanitize(province)}",
                "addressCountry": "ZA"
              }${data.businessTelephone || data.contactnumber ? `,\n    "telephone": "${sanitize(data.businessTelephone || data.contactnumber)}"` : ''}
            }
          </script>
        </head>
        <body>
          <main>
            <h1>${sanitize(data.title || data.businessname)}</h1>
            <p>${sanitize(data.description || `Professional panel beating services ${getLocationText(city)}`)}</p>
            <p>Address: ${[data.streetaddress, data.city, data.province].filter(Boolean).join(', ')}</p>
            ${data.businessTelephone || data.contactnumber ? `<p>Phone: ${sanitize(data.businessTelephone || data.contactnumber)}</p>` : ''}
            ${data.businessHours ? `<p>Hours: ${sanitize(data.businessHours)}</p>` : ''}
            ${data.services ? `<p>Services: ${sanitize(data.services)}</p>` : ''}
          </main>
        </body>
      </html>
    `;

    // Set appropriate headers
    res.set('Cache-Control', 'public, max-age=300, s-maxage=600');
    res.set('Content-Type', 'text/html');
    res.send(staticHtml);
  } catch (error) {
    console.error('Error in generateStaticProfile:', error);
    res.status(500).send('Internal Server Error');
  }
});

// Pre-render any page in the app for SEO
export const renderPage = onRequest(async (req: Request, res: Response) => {
  try {
    // Get the path to render from the request
    const path = req.path || '/';

    // Create a simple HTML response
    const html = `
      <!DOCTYPE html>
      <html>
        <head>
          <title>Web Directories - South Africa's Premier Business Directory</title>
          <meta name="description" content="Find trusted businesses in South Africa with Web Directories, the comprehensive online business directory.">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <meta name="robots" content="index, follow">
          <link rel="canonical" href="https://webdirectories.co.za${path}">
        </head>
        <body>
          <h1>Web Directories</h1>
          <p>South Africa's Premier Business Directory</p>
          <p>This is a static version of the page for search engines.</p>
          <p>For the full interactive experience, please visit <a href="https://webdirectories.co.za${path}">Web Directories</a>.</p>
        </body>
      </html>
    `;

    // Set appropriate headers
    res.set('Cache-Control', 'public, max-age=300, s-maxage=600');
    res.set('Content-Type', 'text/html');
    res.send(html);
  } catch (error) {
    console.error('Error rendering page:', error);
    res.status(500).send('Error rendering page');
  }
});

// Generate sitemap for search engines
export const generateSitemap = onRequest(async (req: Request, res: Response) => {
  try {
    console.log('Sitemap function called');

    const snapshot = await admin.firestore()
      .collection('listings')
      .get();

    console.log(`Found ${snapshot.size} listings in Firestore`);

    let sitemap = `<?xml version="1.0" encoding="UTF-8"?>
    <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
      <!-- Static Routes -->
      <url>
        <loc>https://webdirectories.co.za/</loc>
        <changefreq>daily</changefreq>
        <priority>1.0</priority>
      </url>
      <url>
        <loc>https://webdirectories.co.za/panelbeaters</loc>
        <changefreq>weekly</changefreq>
        <priority>0.9</priority>
      </url>

      <!-- Dynamic Listings -->`;

    snapshot.docs.forEach(doc => {
      const data = doc.data();
      sitemap += `
      <url>
        <loc>https://webdirectories.co.za/panelbeaters-directory/${data.listingsId}/profile</loc>
        <changefreq>weekly</changefreq>
        <priority>0.8</priority>
      </url>`;
    });

    sitemap += `\n</urlset>`;

    res.set('Content-Type', 'application/xml');
    res.send(sitemap);
  } catch (error) {
    console.error('Error generating sitemap:', error);
    res.status(500).send('Error generating sitemap');
  }
});

// API to get all listings
export const Rlistings = onRequest(async (req: Request, res: Response) => {
  try {
    const snapshot = await admin.firestore()
      .collection('listings')
      .get();

    const listings = snapshot.docs.map(doc => ({
      id: doc.id,
      ...doc.data()
    }));

    res.json(listings);
  } catch (error) {
    console.error('Error fetching listings:', error);
    res.status(500).send('Error fetching listings');
  }
});

// General app function
export const app = onRequest(async (req: Request, res: Response) => {
  try {
    // Add the original functionality of your app function here
    res.send('App function restored');
  } catch (error) {
    console.error('Error in app function:', error);
    res.status(500).send('Error in app function');
  }
});