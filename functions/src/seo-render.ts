import * as puppeteer from 'puppeteer';
import * as fs from 'fs';
import * as path from 'path';
import * as admin from 'firebase-admin';

// Initialize Firebase Admin
try {
    if (!admin.apps.length) {
        const serviceAccountPath = path.resolve(__dirname, '../serviceAccountKey.json');
        if (fs.existsSync(serviceAccountPath)) {
            const serviceAccount = require(serviceAccountPath);
            admin.initializeApp({
                credential: admin.credential.cert(serviceAccount),
                projectId: serviceAccount.project_id,
                databaseURL: `https://${serviceAccount.project_id}.firebaseio.com`
            });
            console.log('Initialized Firebase with service account');
        } else {
            console.error('Error: serviceAccountKey.json not found!');
            console.error('Expected path:', serviceAccountPath);
            process.exit(1);
        }
    }
} catch (error) {
    console.error('Firebase initialization error:', error);
    process.exit(1);
}

/*
async function getRenderedHTML(url: string): Promise<string> {
    const browser = await puppeteer.launch({ headless: true });
    const page = await browser.newPage();
    await page.goto(url, { waitUntil: 'networkidle0' });
    const html = await page.content();
    await browser.close();
    return html;
}*/

// Cache for rendered pages to improve performance
const pageCache: Record<string, { html: string, timestamp: number }> = {};
const CACHE_DURATION = 3600000; // 1 hour in milliseconds

/**
 * Pre-renders a page using Puppeteer
 * @param url The URL to pre-render
 * @returns The pre-rendered HTML
 */
async function prerenderPage(url: string): Promise<string> {
    // Check cache first
    const now = Date.now();
    const cachedPage = pageCache[url];
    if (cachedPage && (now - cachedPage.timestamp) < CACHE_DURATION) {
        console.log(`Serving cached version of ${url}`);
        return cachedPage.html;
    }

    console.log(`Pre-rendering page: ${url}`);

    // Launch headless browser with optimized configuration
    const browser = await puppeteer.launch({
        headless: true,
        args: [
            '--no-sandbox',
            '--disable-setuid-sandbox',
            '--disable-dev-shm-usage',
            '--disable-accelerated-2d-canvas',
            '--disable-gpu',
            '--window-size=1920x1080'
        ]
    });

    try {
        const page = await browser.newPage();

        // Set viewport and user agent
        await page.setViewport({ width: 1920, height: 1080 });
        await page.setUserAgent('WebDirectories-Renderer/1.0');

        // Reduce timeout values
        await page.goto(url, {
            waitUntil: 'networkidle0',
            timeout: 30000 // 30 seconds timeout
        });

        // // Wait for Flutter to initialize
        // await Promise.race([
        //     page.waitForFunction('window._flutter.loader.didCreateEngineInitializer', { timeout: 20000 }),
        //     new Promise(resolve => setTimeout(resolve, 20000))
        // ]).catch(() => console.log('Flutter initialization timeout, continuing...'));

        // Wait for the content to be fully rendered
        console.log(`Waiting for Flutter content to be ready at ${url}`);
        await Promise.race([
            page.evaluate('window.flutterContentReady === true', { timeout: 65000 }),
        ]).catch(() => console.log('Flutter content ready timeout, continuing...'));

        // Additional wait for UI to settle using evaluate instead of waitForTimeout
        await page.evaluate(() => new Promise(resolve => setTimeout(resolve, 45000)));

        console.log(`Content capture ready for ${url}`);
        const html = await page.content();
        pageCache[url] = { html, timestamp: now };
        return html;
    } finally {
        await browser.close();
    }
}

function sanitize(str: string): string {
    return str.replace(/[^a-z0-9\-_.]/gi, '_');
}

function getFilePath(url: string): { folderPath: string, fileName: string } {
    const parsed = new URL(url);
    const domain = parsed.hostname;
    let pathname = parsed.pathname;
    const baseFolder = path.join(__dirname, domain);

    let folderPath: string;
    let fileName: string;

    if (pathname.endsWith('/')) {
        // For trailing slash paths, create full folder structure and save as index.html
        const parts = pathname.split('/').filter(Boolean);
        folderPath = path.join(baseFolder, ...parts.map(sanitize));
        fileName = 'index.html';
    } else {
        // For non-trailing slash, last part is the file name
        const parts = pathname.split('/').filter(Boolean);
        if (parts.length > 1) {
            fileName = sanitize(parts.pop()!);
            folderPath = path.join(baseFolder, ...parts.map(sanitize));
        } else {
            fileName = sanitize(parts[0]);
            folderPath = baseFolder;
        }
        if (!fileName.endsWith('.html')) {
            fileName += '.html';
        }
    }

    return { folderPath, fileName };
}

async function saveHTML(url: string, html: string): Promise<void> {
    const { folderPath, fileName } = getFilePath(url);
    fs.mkdirSync(folderPath, { recursive: true });
    const filePath = path.join(folderPath, fileName);
    fs.writeFileSync(filePath, html, 'utf-8');
    console.log(`Saved ${url} to ${filePath}`);
}

// async function generateBusinessProfiles() {
//     try {
//         // Test Firestore connection
//         const testSnapshot = await admin.firestore().collection('listings').limit(1).get();
//         if (testSnapshot.empty) {
//             throw new Error('No listings found in Firestore');
//         }
//         console.log('Successfully connected to Firestore');

//         // Get all business profiles
//         const snapshot = await admin.firestore()
//             .collection('listings')
//             .get();

//         // Log sample data to understand structure
//         if (snapshot.docs.length > 0) {
//             console.log('\nSample document data:');
//             const sampleDoc = snapshot.docs[0].data();
//             console.log(JSON.stringify(sampleDoc, null, 2));
//         }

//         // Map and filter business IDs, with logging
//         const validBusinessIds = snapshot.docs.map(doc => {
//             const data = doc.data();
//             if (!data.listingsId) {
//                 console.log('Document missing listingsId:', doc.id, JSON.stringify(data, null, 2));
//             }
//             return data.listingsId?.toString();
//         }).filter(id => id);

//         const total = validBusinessIds.length;
//         console.log(`\nFound ${total} valid business profiles to generate`);
//         console.log('First few business IDs:', validBusinessIds.slice(0, 5));

//         let completed = 0;
//         let skipped = 0;
//         const batchSize = 5; // Process 5 profiles at a time

//         for (let i = 0; i < validBusinessIds.length; i += batchSize) {
//             const batch = validBusinessIds.slice(i, i + batchSize);
//             await Promise.all(batch.map(async (businessId) => {
//                 try {
//                     // Log the query we're about to make
//                     console.log(`\nQuerying Firestore for business ID: ${businessId}`);

//                     //const html = await generateBusinessProfileHTML(businessId);
//                    // const url = `https://www.webdirectories.co.za/panelbeaters-directory/${businessId}/profile`;
//                    // await saveHTML(url, html);
//                     completed++;
//                     console.log(`Progress: ${completed}/${total} profiles (${Math.round(completed / total * 100)}%) - ${skipped} skipped`);
//                 } catch (error: any) {
//                     skipped++;
//                     console.warn(`Skipping business ${businessId}: ${error.message}`);
//                 }
//             }));
//         }

//         console.log(`\nGeneration complete:`);
//         console.log(`- Successfully generated: ${completed} profiles`);
//         console.log(`- Skipped: ${skipped} profiles`);
//         console.log(`- Total processed: ${total} profiles`);
//     } catch (error) {
//         console.error('Error accessing Firestore:', error);
//         process.exit(1);
//     }
// }

// async function generateBusinessProfileHTML(businessId: string): Promise<string> {
//     try {
//         // Validate businessId
//         if (!businessId || typeof businessId !== 'string') {
//             throw new Error('Invalid business ID');
//         }

//         // Query Firestore
//         console.log(`Querying Firestore for business ${businessId} with type:`, typeof businessId);

//         // Try both string and number comparisons
//         const snapshot = await admin.firestore()
//             .collection('listings')
//             .where('listingsId', 'in', [businessId, parseInt(businessId, 10)])
//             .limit(1)
//             .get();

//         if (snapshot.empty) {
//             // Log the failed query details
//             console.log(`Query failed for business ${businessId}. Trying to find it in the collection...`);
//             const allDocs = await admin.firestore()
//                 .collection('listings')
//                 .where('listingsId', '!=', null)
//                 .limit(5)
//                 .get();

//             if (!allDocs.empty) {
//                 console.log('Sample documents with listingsId:');
//                 allDocs.docs.forEach(doc => {
//                     const data = doc.data();
//                     console.log(`- listingsId: ${data.listingsId} (type: ${typeof data.listingsId})`);
//                 });
//             }

//             throw new Error(`Business profile ${businessId} not found in Firestore`);
//         }

//         const data = snapshot.docs[0].data();

//         // Validate required data
//         if (!data) {
//             throw new Error(`No data found for business ${businessId}`);
//         }

//         // Extract and validate business name
//         const businessName = data.title || data.businessname;
//         if (!businessName) {
//             throw new Error(`No business name found for business ${businessId}`);
//         }

//         const city = data.city || '';
//         const getLocationText = (cityName: string) => cityName ? `in ${cityName}` : 'in South Africa';
//         const description = data.description || `Professional panel beating services ${getLocationText(city)}`;

//         return `
//             <!DOCTYPE html>
//             <html lang="en">
//                 <head>
//                     <meta charset="UTF-8">
//                     <meta name="viewport" content="width=device-width, initial-scale=1.0">
//                     <title>${businessName} - Panel Beaters Directory</title>
//                     <meta name="description" content="${description}">
//                     <meta name="robots" content="index, follow">
//                     <link rel="canonical" href="https://webdirectories.co.za/panelbeaters-directory/${businessId}/profile">

//                     <script type="application/ld+json">
//                         {
//                             "@context": "https://schema.org",
//                             "@type": "AutoRepair",
//                             "name": "${businessName}",
//                             "description": "${description}",
//                             "address": {
//                                 "@type": "PostalAddress",
//                                 "streetAddress": "${data.streetaddress || ''}",
//                                 "addressLocality": "${city}",
//                                 "addressRegion": "${data.province || ''}",
//                                 "addressCountry": "ZA"
//                             }${data.businessTelephone || data.contactnumber ? `,
//                             "telephone": "${data.businessTelephone || data.contactnumber}"` : ''}
//                         }
//                     </script>
//                 </head>
//                 <body>
//                     <main>
//                         <h1>${businessName}</h1>
//                         <p>${description}</p>
//                         <p>Address: ${[data.streetaddress, data.city, data.province].filter(Boolean).join(', ')}</p>
//                         ${data.businessTelephone || data.contactnumber ? `<p>Phone: ${data.businessTelephone || data.contactnumber}</p>` : ''}
//                         ${data.businessHours ? `<p>Hours: ${data.businessHours}</p>` : ''}
//                         ${data.services ? `<p>Services: ${data.services}</p>` : ''}
//                     </main>
//                 </body>
//             </html>
//         `;
//     } catch (error: any) {
//         console.error(`Error generating HTML for business ${businessId}:`, error);
//         throw error;
//     }
// }

async function scrapeLinks(urls: string[]) {
    for (const url of urls) {
        try {
            const html = await prerenderPage(url);
            await saveHTML(url, html);
        } catch (error) {
            console.error(`Error processing ${url}:`, error);
        }
    }
}

// Main execution
async function main() {
    const startTime = Date.now();
    try {
        console.log('Starting SEO content generation...');

        // Generate static pages
        const staticUrls = [
            // 'https://www.webdirectories.co.za/panelbeaters/whats-next',
            // 'https://www.webdirectories.co.za/panelbeaters/agreement',
            // 'https://www.webdirectories.co.za/panelbeaters',
            // 'https://www.webdirectories.co.za/',
            // 'https://www.webdirectories.co.za/about',
            // 'https://www.webdirectories.co.za/contact',
            'https://webdirectories.co.za/panelbeaters-directory/100/profile'
        ];

        console.log('Generating static pages...');
        await Promise.all(staticUrls.map(url => scrapeLinks([url])));

        // console.log('Generating business profiles...');
        // await generateBusinessProfiles();

        const duration = (Date.now() - startTime) / 1000;
        console.log(`SEO content generation completed in ${duration.toFixed(1)} seconds!`);
    } catch (error) {
        console.error('Error during SEO content generation:', error);
        process.exit(1);
    }
}

// Run the script
main();

