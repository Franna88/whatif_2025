import 'package:xml/xml.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SitemapGenerator {
  static final _firestore = FirebaseFirestore.instance;
  static const String baseUrl = 'https://webdirectories.co.za/panelbeaters';

  // Generate sitemap XML for all business listings
  static Future<String> generateSitemap() async {
    final builder = XmlBuilder();
    builder.processing('xml', 'version="1.0" encoding="UTF-8"');

    builder.element('urlset', nest: () async {
      builder.attribute('xmlns', 'http://www.sitemaps.org/schemas/sitemap/0.9');
      builder.attribute(
          'xmlns:mobile', 'http://www.google.com/schemas/sitemap-mobile/1.0');

      // 1. Add static pages
      _addStaticPages(builder);

      // 2. Add all business listings
      final QuerySnapshot listings =
          await _firestore.collection('listings').get();

      for (var doc in listings.docs) {
        final data = doc.data() as Map<String, dynamic>;
        builder.element('url', nest: () {
          // Main profile page
          builder.element('loc',
              nest:
                  '$baseUrl/panelbeaters-directory/${data['listingsId']}/profile');
          builder.element('lastmod',
              nest: (data['lastUpdated'] as Timestamp)
                  .toDate()
                  .toIso8601String());
          builder.element('changefreq', nest: 'weekly');
          builder.element('priority', nest: '0.8');
        });

        // Add sub-pages for each listing (contact, reviews, etc.)
        _addListingSubpages(builder, data['listingsId']);
      }

      // 3. Add location-based pages
      await _addLocationPages(builder);

      // Add mobile-specific tags
      builder.element('url', nest: () {
        builder.element('loc', nest: '$baseUrl');
        builder.element('mobile:mobile'); // Indicates mobile-friendly
        builder.element('changefreq', nest: 'daily');
        builder.element('priority', nest: '1.0');
      });
    });

    return builder.buildDocument().toString();
  }

  // Helper method for static pages
  static void _addStaticPages(XmlBuilder builder) {
    final staticPages = [
      {'url': '', 'priority': '1.0'},
      {'url': 'articles', 'priority': '0.7'},
      {'url': 'we-can-help', 'priority': '0.6'},
      // Add other static pages
    ];

    for (var page in staticPages) {
      builder.element('url', nest: () {
        builder.element('loc',
            nest: 'https://panelbeatersdirectory.co.za/${page['url']}');
        builder.element('changefreq', nest: 'weekly');
        builder.element('priority', nest: page['priority']);
      });
    }
  }

  // Helper method for listing sub-pages
  static void _addListingSubpages(XmlBuilder builder, String listingId) {
    final subPages = [
      'contact',
      'reviews',
      'maps',
      'about',
    ];

    for (var page in subPages) {
      builder.element('url', nest: () {
        builder.element('loc',
            nest:
                'https://panelbeatersdirectory.co.za/panelbeaters-directory/$listingId/$page');
        builder.element('changefreq', nest: 'weekly');
        builder.element('priority', nest: '0.6');
      });
    }
  }

  // Helper method for location-based pages
  static Future<void> _addLocationPages(XmlBuilder builder) async {
    // Get unique locations from listings
    final QuerySnapshot listings =
        await _firestore.collection('listings').get();
    final Set<String> cities = {};
    final Set<String> provinces = {};

    for (var doc in listings.docs) {
      final data = doc.data() as Map<String, dynamic>;
      cities.add(data['city'] as String);
      provinces.add(data['province'] as String);
    }

    // Add city pages
    for (var city in cities) {
      builder.element('url', nest: () {
        builder.element('loc',
            nest:
                'https://panelbeatersdirectory.co.za/panelbeaters-directory/area/${city.toLowerCase()}');
        builder.element('changefreq', nest: 'daily');
        builder.element('priority', nest: '0.7');
      });
    }

    // Add province pages
    for (var province in provinces) {
      builder.element('url', nest: () {
        builder.element('loc',
            nest:
                'https://panelbeatersdirectory.co.za/panelbeaters-directory/province/${province.toLowerCase()}');
        builder.element('changefreq', nest: 'daily');
        builder.element('priority', nest: '0.7');
      });
    }
  }
}
