"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.generateStaticProfile = void 0;
const functions = require("firebase-functions");
const admin = require("firebase-admin");
// Initialize Firebase Admin
admin.initializeApp();
exports.generateStaticProfile = functions.https.onRequest(async (req, res) => {
    try {
        const businessId = req.path.split('/').pop() || '';
        console.log('DEBUG: Requested business ID:', businessId);
        console.log('DEBUG: Business ID type:', typeof businessId);
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
        res.set('Cache-Control', 'public, max-age=300, s-maxage=600');
        res.send(html);
    }
    catch (error) {
        console.error('Error:', error);
        res.status(500).send('Internal Server Error');
    }
});
//# sourceMappingURL=index.js.map