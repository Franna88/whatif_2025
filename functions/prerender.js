// Use the compiled JavaScript directly
const indexFunctions = require('./lib/index');
const fs = require('fs');
const path = require('path');
const admin = require('firebase-admin');

// Set environment variables for Firebase
process.env.GCLOUD_PROJECT = 'web-directories';
process.env.FIREBASE_CONFIG = JSON.stringify({
    projectId: 'web-directories',
    databaseURL: 'https://web-directories.firebaseio.com'
});

// Check if Firebase is already initialized
try {
    if (!admin.apps.length) {
        console.log('Initializing Firebase...');
        // Check if service account exists
        if (fs.existsSync('./serviceAccountKey.json')) {
            const serviceAccount = require('./serviceAccountKey.json');

            // Initialize with the service account
            admin.initializeApp({
                credential: admin.credential.cert(serviceAccount),
                projectId: serviceAccount.project_id,
                databaseURL: `https://${serviceAccount.project_id}.firebaseio.com`
            });
            console.log('Initialized Firebase with service account');
        } else {
            console.error('Error: serviceAccountKey.json not found!');
            console.error('You must have a valid service account key file to proceed.');
            console.error('Obtain a service account key from Firebase console and save it as serviceAccountKey.json in the functions directory.');
            process.exit(1);
        }
    } else {
        console.log('Firebase already initialized, using existing app');
    }
} catch (error) {
    console.error('Firebase initialization error:', error);
    process.exit(1);
}

// Create output directory
const OUTPUT_DIR = 'src/www.webdirectories.co.za';

// Helper function to ensure directory exists
function ensureDirectoryExists(dirPath) {
    if (!fs.existsSync(dirPath)) {
        fs.mkdirSync(dirPath, { recursive: true });
    }
}

// Helper function to write HTML file
async function writeHtmlFile(filePath, content) {
    ensureDirectoryExists(path.dirname(filePath));
    await fs.promises.writeFile(filePath, content);
    console.log(`Generated: ${filePath}`);
}

// Create mock request and response objects
function createMockReqRes(path, userAgent = '') {
    const req = {
        path,
        headers: { 'user-agent': userAgent },
        get: (header) => req.headers[header]
    };

    let responseContent = '';
    let responseHeaders = {};
    let responseStatus = 200;

    const res = {
        set: (name, value) => {
            responseHeaders[name] = value;
            return res;
        },
        send: (content) => {
            responseContent = content;
            return res;
        },
        redirect: (url) => {
            responseContent = `Redirecting to ${url}`;
            return res;
        },
        status: (code) => {
            responseStatus = code;
            return res;
        },
        getContent: () => responseContent,
        getStatus: () => responseStatus,
        getHeaders: () => responseHeaders
    };

    return { req, res };
}

// Pre-render static pages
async function prerenderStaticPages() {
    const pages = [
        { path: '/', outputFile: 'index.html' },
        { path: '/panelbeaters', outputFile: 'panelbeaters/index.html' },
        { path: '/about', outputFile: 'about/index.html' },
        { path: '/contact', outputFile: 'contact/index.html' }
    ];

    for (const page of pages) {
        console.log(`Pre-rendering ${page.path}...`);
        const { req, res } = createMockReqRes(page.path, 'googlebot');

        try {
            // Call the function directly
            await new Promise((resolve) => {
                indexFunctions.renderPage(req, res);
                resolve();
            });

            const filePath = path.join(OUTPUT_DIR, page.outputFile);
            await writeHtmlFile(filePath, res.getContent());
        } catch (error) {
            console.error(`Error pre-rendering ${page.path}:`, error);
        }
    }
}

// Pre-render all business profiles
async function prerenderBusinessProfiles() {
    try {
        const snapshot = await admin.firestore()
            .collection('listings')
            .get();

        console.log(`Found ${snapshot.size} business profiles to pre-render`);

        for (const doc of snapshot.docs) {
            const businessId = doc.data().listingsId;
            console.log(`Pre-rendering profile for business ${businessId}...`);

            const { req, res } = createMockReqRes(
                `/panelbeaters-directory/${businessId}/profile`,
                'googlebot'
            );

            try {
                await new Promise((resolve) => {
                    indexFunctions.generateStaticProfile(req, res);
                    resolve();
                });

                const filePath = path.join(OUTPUT_DIR, 'panelbeaters-directory', businessId.toString(), 'profile.html');
                await writeHtmlFile(filePath, res.getContent());
            } catch (error) {
                console.error(`Error pre-rendering profile ${businessId}:`, error);
            }
        }
    } catch (error) {
        console.error('Error fetching business profiles:', error);
    }
}

// Main function to run all pre-rendering tasks
async function prerenderAllPages() {
    try {
        console.log('Starting pre-rendering process...');
        await prerenderStaticPages();
        await prerenderBusinessProfiles();
        console.log('Pre-rendering completed successfully!');
    } catch (error) {
        console.error('Error during pre-rendering:', error);
    }
}

// Run the pre-rendering
prerenderAllPages(); 