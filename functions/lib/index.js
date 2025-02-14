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
        const html = `
      <!DOCTYPE html>
      <html lang="en">
        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>${sanitize(data.title)} - Panel Beaters Directory</title>
          <meta name="description" content="${sanitize(data.description)}">
          <meta name="robots" content="index, follow">
          <link rel="canonical" href="https://webdirectories.co.za/panelbeaters-directory/${businessId}/profile">
          
          <script type="application/ld+json">
            {
              "@context": "https://schema.org",
              "@type": "AutoRepair",
              "name": "${sanitize(data.title)}",
              "description": "${sanitize(data.description)}",
              "address": {
                "@type": "PostalAddress",
                "streetAddress": "${sanitize(data.streetaddress)}",
                "addressLocality": "${sanitize(data.city)}",
                "addressRegion": "${sanitize(data.province)}",
                "addressCountry": "ZA"
              }
              ${data.businessTelephone ? `,"telephone": "${sanitize(data.businessTelephone)}"` : ''}
            }
          </script>
        </head>
        <body>
          <main>
            <h1>${sanitize(data.title)}</h1>
            <p>${sanitize(data.description)}</p>
            ${data.streetaddress ? `<p>Address: ${sanitize(data.streetaddress)}, ${sanitize(data.city)}, ${sanitize(data.province)}</p>` : ''}
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