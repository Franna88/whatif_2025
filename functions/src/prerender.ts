import * as admin from 'firebase-admin';
import * as fs from 'fs';
import * as path from 'path';
import * as functions from 'firebase-functions';

// Use the same named app as index.ts
try {
    admin.initializeApp({
        credential: admin.credential.applicationDefault()
    }, 'webDirectories');
} catch (error) {
    // If app already exists, use it
    admin.app('webDirectories');
}

const OUTPUT_DIR = 'src/www.webdirectories.co.za';

// Helper function to ensure directory exists
function ensureDirectoryExists(dirPath: string) {
    if (!fs.existsSync(dirPath)) {
        fs.mkdirSync(dirPath, { recursive: true });
    }
}

// Helper function to write HTML file
async function writeHtmlFile(filePath: string, content: string) {
    ensureDirectoryExists(path.dirname(filePath));
    await fs.promises.writeFile(filePath, content);
    console.log(`Generated: ${filePath}`);
}

// Create mock request and response objects
function createMockReqRes(path: string, userAgent = '') {
    const req = {
        path,
        headers: { 'user-agent': userAgent },
        get: (header: string) => req.headers[header]
    } as functions.https.Request;

    let responseContent = '';
    let responseHeaders = new Map<string, string>();
    let responseStatus = 200;

    const res = {
        set: (name: string, value: string) => {
            responseHeaders.set(name, value);
            return res;
        },
        send: (content: string) => {
            responseContent = content;
            return res;
        },
        redirect: (url: string) => {
            responseContent = `Redirecting to ${url}`;
            return res;
        },
        status: (code: number) => {
            responseStatus = code;
            return res;
        },
        getContent: () => responseContent,
        getStatus: () => responseStatus,
        getHeaders: () => responseHeaders
    } as any;

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

    const indexModule = await import('./index');

    for (const page of pages) {
        console.log(`Pre-rendering ${page.path}...`);
        const { req, res } = createMockReqRes(page.path, 'googlebot');

        await new Promise<void>((resolve, reject) => {
            try {
                // Call the function directly
                const handler = indexModule.renderPage;
                if (typeof handler === 'function') {
                    handler(req, res);
                } else if (typeof (handler as any).run === 'function') {
                    (handler as any).run(req, res);
                } else {
                    throw new Error('Invalid function handler');
                }
                resolve();
            } catch (error) {
                reject(error);
            }
        });

        if (res.getStatus() === 200) {
            const filePath = path.join(OUTPUT_DIR, page.outputFile);
            await writeHtmlFile(filePath, res.getContent());
        } else {
            console.warn(`Skipping ${page.path} due to non-200 status: ${res.getStatus()}`);
        }
    }
}

// Pre-render all business profiles
async function prerenderBusinessProfiles() {
    const snapshot = await admin.firestore()
        .collection('listings')
        .get();

    const indexModule = await import('./index');

    for (const doc of snapshot.docs) {
        const businessId = doc.data().listingsId;
        console.log(`Pre-rendering profile for business ${businessId}...`);

        const { req, res } = createMockReqRes(
            `/panelbeaters-directory/${businessId}/profile`,
            'googlebot'
        );

        await new Promise<void>((resolve, reject) => {
            try {
                // Call the function directly
                const handler = indexModule.generateStaticProfile;
                if (typeof handler === 'function') {
                    handler(req, res);
                } else if (typeof (handler as any).run === 'function') {
                    (handler as any).run(req, res);
                } else {
                    throw new Error('Invalid function handler');
                }
                resolve();
            } catch (error) {
                reject(error);
            }
        });

        if (res.getStatus() === 200) {
            const filePath = path.join(OUTPUT_DIR, 'panelbeaters-directory', businessId.toString(), 'profile.html');
            await writeHtmlFile(filePath, res.getContent());
        } else {
            console.warn(`Skipping profile ${businessId} due to non-200 status: ${res.getStatus()}`);
        }
    }
}

// Main function to run all pre-rendering tasks
export async function prerenderAllPages() {
    try {
        console.log('Starting pre-rendering process...');
        await prerenderStaticPages();
        await prerenderBusinessProfiles();
        console.log('Pre-rendering completed successfully!');
    } catch (error) {
        console.error('Error during pre-rendering:', error);
        throw error;
    }
}

// Execute if run directly
if (require.main === module) {
    prerenderAllPages().catch(console.error);
} 