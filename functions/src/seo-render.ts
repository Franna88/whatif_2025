import puppeteer from 'puppeteer';
import * as fs from 'fs';
import * as path from 'path';

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
        await page.waitForFunction(
            'window.flutterReady === true',
            { timeout: 20000 }
        ).catch(() => {
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
        // For trailing slash paths, create full folder structure and save as index.html.
        const parts = pathname.split('/').filter(Boolean);
        folderPath = path.join(baseFolder, ...parts.map(sanitize));
        fileName = 'index.html';
    } else {
        // For non-trailing slash, last part is the file name.
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

const links = [
    'https://www.webdirectories.co.za/panelbeaters/whats-next',
    'https://www.webdirectories.co.za/panelbeaters/agreement',
    'https://www.webdirectories.co.za/panelbeaters',
];



scrapeLinks(links);

