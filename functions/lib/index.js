"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.app = exports.Rlistings = exports.generateSitemap = exports.generateStaticProfile = void 0;
const functions = require("firebase-functions");
const admin = require("firebase-admin");
// Initialize Firebase Admin
admin.initializeApp();
exports.generateStaticProfile = functions.https.onRequest(async (req, res) => {
    try {
        console.log('Request details:', {
            fullPath: req.path,
            pathSegments: req.path.split('/'),
            headers: req.headers,
            userAgent: req.headers['user-agent']
        });
        console.log('Function triggered with full details:', {
            url: req.url,
            originalUrl: req.originalUrl,
            path: req.path,
            params: req.params,
            query: req.query,
            headers: req.headers,
            method: req.method
        });
        // Extract ID using the :id parameter
        const businessId = req.params.id || req.path.split('/').find(part => !isNaN(Number(part))) || '';
        console.log('Business ID:', businessId);
        // Add validation
        if (!businessId) {
            console.log('Invalid business ID in path:', req.path);
            res.status(400).send('Invalid business ID');
            return;
        }
        console.log('Path analysis:', {
            originalPath: req.path,
            pathParts: req.path.split('/'),
            extractedId: businessId
        });
        // Try both string and number queries
        const snapshot = await admin.firestore()
            .collection('listings')
            .where('listingsId', 'in', [businessId, parseInt(businessId)])
            .limit(1)
            .get();
        console.log('DEBUG: Query results:', snapshot.size);
        console.log('DEBUG: Empty?:', snapshot.empty);
        if (snapshot.empty) {
            console.log('DEBUG: No matching documents');
            res.status(404).send('Profile not found');
            return;
        }
        const data = snapshot.docs[0].data();
        console.log('DEBUG: Found data:', data);
        // Check if request is from a bot
        const userAgent = req.headers['user-agent']?.toLowerCase() || '';
        const isBot = userAgent.includes('bot') ||
            userAgent.includes('crawler') ||
            userAgent.includes('spider');
        console.log('Is bot request:', isBot);
        if (!isBot) {
            // Regular users get the dynamic app
            res.redirect(`/panelbeaters-directory/${businessId}/profile`);
            return;
        }
        // Sanitize data to prevent XSS
        const sanitize = (str) => str?.replace(/[<>]/g, '') || '';
        // Add debug logging for city data
        console.log('DEBUG: City data:', data.city);
        // Extract city from address if not directly available
        const extractCity = (address) => {
            const parts = address.split(',');
            return parts.length > 1 ? parts[parts.length - 3]?.trim() : '';
        };
        // Improve province extraction
        const extractProvince = (address) => {
            const parts = address.split(',');
            return parts.length > 2 ? parts[parts.length - 2]?.trim() : '';
        };
        // Get city either from data.city or extract from address
        const city = data.city || extractCity(data.streetaddress || '');
        const province = data.province || extractProvince(data.streetaddress || '');
        // Update getLocationText to use extracted city
        const getLocationText = (cityName) => {
            return cityName ? `in ${cityName}` : 'in South Africa';
        };
        const html = `
      <!DOCTYPE html>
      <html lang="en">
        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>${sanitize(data.title)} - Panel Beaters Directory</title>
          <meta name="description" content="${sanitize(data.description || `Professional panel beating services ${getLocationText(data.city)}`)}">
          <meta name="robots" content="index, follow">
          <link rel="canonical" href="https://webdirectories.co.za/panelbeaters-directory/${businessId}/profile">
          
          <script type="application/ld+json">
            {
              "@context": "https://schema.org",
              "@type": "AutoRepair",
              "name": "${sanitize(data.title)}",
              "description": "${sanitize(data.description || `Professional panel beating services ${getLocationText(data.city)}`)}",
              "address": {
                "@type": "PostalAddress",
                "streetAddress": "${sanitize(data.streetaddress || '')}",
                "addressLocality": "${sanitize(city)}",
                "addressRegion": "${sanitize(province)}",
                "addressCountry": "ZA"
              }${data.businessTelephone ? `,\n    "telephone": "${sanitize(data.businessTelephone)}"` : ''}
            }
          </script>
        </head>
        <body>
          <main>
            <h1>${sanitize(data.title)}</h1>
            <p>${sanitize(data.description || `Professional panel beating services ${getLocationText(data.city)}`)}</p>
            <p>Address: ${[data.streetaddress, data.city, data.province].filter(Boolean).join(', ')}</p>
            ${data.businessTelephone ? `<p>Phone: ${sanitize(data.businessTelephone)}</p>` : ''}
          </main>
        </body>
      </html>
    `.trim();
        // For bot requests
        if (isBot) {
            res.set('Cache-Control', 'public, max-age=300, s-maxage=600');
        }
        else {
            res.set('Cache-Control', 'no-cache');
        }
        res.set('Access-Control-Allow-Origin', 'https://webdirectories.co.za');
        res.set('Access-Control-Allow-Methods', 'GET');
        res.send(html);
    }
    catch (error) {
        console.error('Firestore query error:', error);
        res.status(500).send('Database error');
    }
});
exports.generateSitemap = functions.https.onRequest(async (req, res) => {
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
    }
    catch (error) {
        console.error('Error generating sitemap:', error);
        res.status(500).send('Error generating sitemap');
    }
});
// Add back the R-listings function
exports.Rlistings = functions.https.onRequest(async (req, res) => {
    try {
        const snapshot = await admin.firestore()
            .collection('listings')
            .get();
        const listings = snapshot.docs.map(doc => ({
            id: doc.id,
            ...doc.data()
        }));
        res.json(listings);
    }
    catch (error) {
        console.error('Error fetching listings:', error);
        res.status(500).send('Error fetching listings');
    }
});
// Add back the app function
exports.app = functions.https.onRequest(async (req, res) => {
    try {
        // Add the original functionality of your app function here
        res.send('App function restored');
    }
    catch (error) {
        console.error('Error in app function:', error);
        res.status(500).send('Error in app function');
    }
});
//# sourceMappingURL=index.js.map