import { onRequest } from 'firebase-functions/v2/https';
import type { HttpsOptions } from 'firebase-functions/v2/https';
import * as admin from 'firebase-admin';
import { PuppeteerRenderer } from './puppeteer-renderer';

// Initialize Firebase Admin
admin.initializeApp();

const runtimeOpts: HttpsOptions = {
  timeoutSeconds: 120,
  memory: '2GiB'
};

export const generateStaticProfile = onRequest(runtimeOpts, async (req, res) => {
  try {
    const pathParts = req.path.split('/').filter(Boolean);
    const listingsId = pathParts[pathParts.length - 2]; // Assuming the ID is the second last part

    console.log('Extracted listings ID:', listingsId);

    if (!listingsId || isNaN(Number(listingsId))) {
      res.status(400).send('Invalid listings ID');
      return;
    }

    // Example Firestore query using listingsId
    const snapshot = await admin.firestore()
      .collection('listings')
      .where('listingsId', '==', listingsId)
      .limit(1)
      .get();

    if (snapshot.empty) {
      res.status(404).send('Listing not found');
      return;
    }

    const data = snapshot.docs[0].data();
    console.log('Listing data:', data);

    // Check if request is from a bot
    const userAgent = req.headers['user-agent']?.toLowerCase() || '';
    const isBot = userAgent.includes('bot') || userAgent.includes('crawler') || userAgent.includes('spider');

    if (!isBot) {
      res.redirect(`/panelbeaters-directory/${listingsId}/profile`);
      return;
    }

    const pageUrl = `https://webdirectories.co.za/panelbeaters-directory/${listingsId}/profile`;
    console.log('Starting Puppeteer rendering for URL:', pageUrl);
    const renderedHtml = await PuppeteerRenderer.renderPage(pageUrl);
    console.log('Puppeteer rendering completed');

    res.set('Cache-Control', 'public, max-age=300, s-maxage=600');
    res.set('Content-Type', 'text/html');
    res.send(renderedHtml);

  } catch (error) {
    console.error('Error:', error);
    res.status(500).send('Error generating static page');
  }
});

export const generateSitemap = onRequest(async (req, res) => {
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

// Add back the R-listings function
export const Rlistings = onRequest(async (req, res) => {
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

// Add back the app function
export const app = onRequest(async (req, res) => {
  try {
    // Add the original functionality of your app function here
    res.send('App function restored');
  } catch (error) {
    console.error('Error in app function:', error);
    res.status(500).send('Error in app function');
  }
}); 