"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.app = exports.Rlistings = exports.generateSitemap = exports.renderPage = exports.generateStaticProfile = void 0;
const functions = require("firebase-functions");
const admin = require("firebase-admin");
const puppeteer = require("puppeteer");
// Initialize Firebase Admin
admin.initializeApp();
// Cache for rendered pages to improve performance
const pageCache = {};
const CACHE_DURATION = 3600000; // 1 hour in milliseconds
/**
 * Pre-renders a page using Puppeteer
 * @param url The URL to pre-render
 * @returns The pre-rendered HTML
 */
async function prerenderPage(url) {
    // Check cache first
    const now = Date.now();
    const cachedPage = pageCache[url];
    if (cachedPage && (now - cachedPage.timestamp) < CACHE_DURATION) {
        console.log(`Serving cached version of ${url}`);
        return cachedPage.html;
    }
    console.log(`Pre-rendering page: ${url}`);
    // Launch headless browser
    const browser = await puppeteer.launch({
        headless: true,
        args: ['--no-sandbox', '--disable-setuid-sandbox']
    });
    try {
        const page = await browser.newPage();
        // Set viewport for consistent rendering
        await page.setViewport({
            width: 1200,
            height: 800
        });
        // Set user agent to identify as our renderer
        await page.setUserAgent('WebDirectories-Renderer/1.0');
        // Navigate to the URL and wait until network is idle
        await page.goto(url, {
            waitUntil: 'networkidle0',
            timeout: 30000 // 30 seconds timeout
        });
        // Wait for Flutter to initialize and render content
        await page.waitForFunction('window.flutterReady === true', { timeout: 20000 }).catch(() => {
            console.log('Flutter ready flag not found, continuing anyway');
        });
        // Wait for the main content to be available
        await page.waitForSelector('main', { timeout: 10000 }).catch(() => {
            console.log('Main content selector not found, continuing anyway');
        });
        // Get the fully rendered HTML
        const html = await page.content();
        // Cache the result
        pageCache[url] = { html, timestamp: now };
        return html;
    }
    finally {
        await browser.close();
    }
}
// Enhanced version of generateStaticProfile that uses Puppeteer for complex pages
exports.generateStaticProfile = functions.https.onRequest(async (req, res) => {
    var _a;
    try {
        console.log('Request details:', {
            fullPath: req.path,
            pathSegments: req.path.split('/'),
            rawBusinessId: req.path.split('/').pop(),
            headers: req.headers,
            userAgent: req.headers['user-agent']
        });
        // Extract business ID from URL
        const businessId = req.path.split('/').pop();
        console.log('Extracted business ID:', businessId);
        if (!businessId) {
            res.status(400).send('Business ID is required');
            return;
        }
        // Check if request is from a bot
        const userAgent = ((_a = req.headers['user-agent']) === null || _a === void 0 ? void 0 : _a.toLowerCase()) || '';
        const isBot = userAgent.includes('bot') ||
            userAgent.includes('crawler') ||
            userAgent.includes('spider');
        console.log('Is bot request:', isBot);
        if (!isBot) {
            // Regular users get redirected to the dynamic app
            res.redirect(`/panelbeaters-directory/${businessId}/profile`);
            return;
        }
        // For bots, we have two options:
        // 1. Use the existing static HTML generation (faster but less complete)
        // 2. Use Puppeteer to pre-render the actual page (slower but more complete)
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
        // Option 1: Use Puppeteer to pre-render the actual page
        try {
            // The URL to pre-render (your actual web app URL)
            const urlToRender = `https://webdirectories.co.za/panelbeaters-directory/${businessId}/profile`;
            // Pre-render the page
            const renderedHtml = await prerenderPage(urlToRender);
            // Set appropriate headers
            res.set('Cache-Control', 'public, max-age=300, s-maxage=600');
            res.set('Content-Type', 'text/html');
            res.send(renderedHtml);
            return;
        }
        catch (prerenderError) {
            console.error('Error pre-rendering with Puppeteer:', prerenderError);
            console.log('Falling back to static HTML generation');
            // Fall back to Option 2 (static HTML generation)
        }
        // Option 2: Generate static HTML (fallback if pre-rendering fails)
        // Sanitize data to prevent XSS
        const sanitize = (str) => (str === null || str === void 0 ? void 0 : str.replace(/[<>]/g, '')) || '';
        // Extract city from address if not directly available
        const extractCity = (address) => {
            var _a;
            if (!address)
                return '';
            const parts = address.split(',');
            return parts.length > 1 ? (_a = parts[parts.length - 3]) === null || _a === void 0 ? void 0 : _a.trim() : '';
        };
        // Improve province extraction
        const extractProvince = (address) => {
            var _a;
            if (!address)
                return '';
            const parts = address.split(',');
            return parts.length > 2 ? (_a = parts[parts.length - 2]) === null || _a === void 0 ? void 0 : _a.trim() : '';
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
            ${data.businessHours ? `<p>Hours: ${sanitize(data.businessHours)}</p>` : ''}
            ${data.services ? `<p>Services: ${sanitize(data.services)}</p>` : ''}
          </main>
        </body>
      </html>
    `.trim();
        res.set('Cache-Control', 'public, max-age=300, s-maxage=600');
        res.set('Content-Type', 'text/html');
        res.send(html);
    }
    catch (error) {
        console.error('Error generating static profile:', error);
        res.status(500).send('Server error');
    }
});
// Pre-render any page in the app for SEO
exports.renderPage = functions.https.onRequest(async (req, res) => {
    try {
        // Get the path to render from the request
        const path = req.path || '/';
        const fullUrl = `https://webdirectories.co.za${path}`;
        console.log(`Rendering page: ${fullUrl}`);
        // Pre-render the page
        const html = await prerenderPage(fullUrl);
        // Set appropriate headers
        res.set('Cache-Control', 'public, max-age=300, s-maxage=600');
        res.set('Content-Type', 'text/html');
        res.send(html);
    }
    catch (error) {
        console.error('Error rendering page:', error);
        res.status(500).send('Error rendering page');
    }
});
// Keep the existing sitemap generator
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
// Keep the existing Rlistings function
exports.Rlistings = functions.https.onRequest(async (req, res) => {
    try {
        const snapshot = await admin.firestore()
            .collection('listings')
            .get();
        const listings = snapshot.docs.map(doc => (Object.assign({ id: doc.id }, doc.data())));
        res.json(listings);
    }
    catch (error) {
        console.error('Error fetching listings:', error);
        res.status(500).send('Error fetching listings');
    }
});
// Keep the existing app function
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