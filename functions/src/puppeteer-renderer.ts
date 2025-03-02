import * as puppeteer from 'puppeteer';

export class PuppeteerRenderer {
    private static browser: puppeteer.Browser | null = null;

    static async initialize() {
        if (!this.browser) {
            this.browser = await puppeteer.launch({
                headless: true,
                args: [
                    '--no-sandbox',
                    '--disable-setuid-sandbox',
                    '--disable-dev-shm-usage',
                    '--single-process',
                    '--no-zygote'
                ]
            });
        }
    }

    static async renderPage(url: string): Promise<string> {
        try {
            await this.initialize();
            const page = await this.browser!.newPage();
            await page.setUserAgent('Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)');
            await page.goto(url, { waitUntil: 'networkidle0' });
            const html = await page.content();
            await page.close();
            return html;
        } catch (error) {
            console.error('Error rendering page:', error);
            throw error;
        }
    }
} 