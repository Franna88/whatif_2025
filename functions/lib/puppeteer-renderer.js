"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.PuppeteerRenderer = void 0;
const puppeteer = require("puppeteer");
class PuppeteerRenderer {
    static browser = null;
    static async initialize() {
        if (!this.browser) {
            this.browser = await puppeteer.launch({
                headless: true,
                args: [
                    '--no-sandbox',
                    '--disable-setuid-sandbox',
                    '--disable-dev-shm-usage',
                    '--single-process'
                ]
            });
        }
    }
    static async renderPage(url) {
        try {
            await this.initialize();
            const page = await this.browser.newPage();
            await page.setUserAgent('Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)');
            await page.goto(url, { waitUntil: 'networkidle0' });
            const html = await page.content();
            await page.close();
            return html;
        }
        catch (error) {
            console.error('Error rendering page:', error);
            throw error;
        }
    }
}
exports.PuppeteerRenderer = PuppeteerRenderer;
//# sourceMappingURL=puppeteer-renderer.js.map