"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.app = exports.Rlistings = exports.generateSitemap = exports.generateStaticProfile = void 0;
const https_1 = require("firebase-functions/v2/https");
const admin = require("firebase-admin");
const puppeteer_renderer_1 = require("./puppeteer-renderer");
// Initialize Firebase Admin
admin.initializeApp();
const runtimeOpts = {
    timeoutSeconds: 120,
    memory: '2GiB'
};
exports.generateStaticProfile = (0, https_1.onRequest)(runtimeOpts, async (req, res) => {
    try {
        const businessId = req.path.split('/').pop();
        console.log('Processing business ID:', businessId);
        if (!businessId) {
            res.status(400).send('Business ID not provided');
            return;
        }
        const userAgent = req.headers['user-agent']?.toLowerCase() || '';
        const isBot = userAgent.includes('bot') ||
            userAgent.includes('crawler') ||
            userAgent.includes('spider');
        if (!isBot) {
            res.redirect(`/panelbeaters-directory/${businessId}/profile`);
            return;
        }
        const renderedHtml = await puppeteer_renderer_1.PuppeteerRenderer.renderPage(`https://webdirectories.co.za/panelbeaters-directory/${businessId}/profile`);
        res.set('Cache-Control', 'public, max-age=300, s-maxage=600');
        res.set('Content-Type', 'text/html');
        res.send(renderedHtml);
    }
    catch (error) {
        console.error('Error:', error);
        res.status(500).send('Error generating static page');
    }
});
exports.generateSitemap = (0, https_1.onRequest)(async (req, res) => {
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
exports.Rlistings = (0, https_1.onRequest)(async (req, res) => {
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
exports.app = (0, https_1.onRequest)(async (req, res) => {
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