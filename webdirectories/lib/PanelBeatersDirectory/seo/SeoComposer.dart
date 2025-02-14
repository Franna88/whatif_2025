import 'package:flutter/material.dart';
import 'package:seo/seo.dart';
import 'package:seo/html/seo_widget.dart';
import 'dart:convert';
import 'dart:html' as html;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:webdirectories/PanelBeatersDirectory/seo/seo_checklist.dart';

class SeoComposer {
  static final _firestore = FirebaseFirestore.instance;
  static Map<String, dynamic> _structuredData = {};
  static const String baseUrl =
      'https://webdirectories.co.za/panelbeaters-directory';

  static Widget compose({
    required Widget child,
    required String title,
    required String description,
    required String path,
  }) {
    return Seo.head(
      tags: [
        MetaTag(
          name: 'description',
          content: description,
        ),
        MetaTag(
          name: 'keywords',
          content:
              'panel beaters, car repair, auto body repair, vehicle damage repair, insurance approved panel beaters, ${title.toLowerCase()}',
        ),
        MetaTag(
          name: 'og:title',
          content: '$title - Panel Beaters Directory',
        ),
        MetaTag(
          name: 'og:description',
          content: description,
        ),
        MetaTag(
          name: 'og:type',
          content: 'website',
        ),
        MetaTag(
          name: 'og:url',
          content: '$baseUrl$path',
        ),
        MetaTag(
          name: 'twitter:card',
          content: 'summary_large_image',
        ),
        MetaTag(
          name: 'twitter:title',
          content: title,
        ),
        MetaTag(
          name: 'twitter:description',
          content: description,
        ),
        LinkTag(
          rel: 'canonical',
          href: '$baseUrl$path',
        ),
        MetaTag(
          name: 'robots',
          content: 'index, follow',
        ),
        MetaTag(
          name: 'author',
          content: 'Panel Beaters Directory',
        ),
        MetaTag(
          name: 'viewport',
          content:
              'width=device-width, initial-scale=1.0, maximum-scale=5.0, user-scalable=yes',
        ),
        MetaTag(
          httpEquiv: 'content-language',
          content: 'en-ZA',
        ),
        MetaTag(
          name: 'og:image',
          content: '$baseUrl/images/social-preview.jpg',
        ),
        MetaTag(
          name: 'twitter:image',
          content:
              'https://panelbeatersdirectory.co.za/images/social-preview.jpg',
        ),
        MetaTag(
          name: 'theme-color',
          content: '#FF8828',
        ),
        MetaTag(
          name: 'apple-mobile-web-app-capable',
          content: 'yes',
        ),
        MetaTag(
          name: 'format-detection',
          content: 'telephone=yes',
        ),
      ],
      child: child,
    );
  }

  static Widget composeListingPage({
    required Widget child,
    required String location,
    required String description,
  }) {
    return compose(
      child: child,
      title: 'Panel Beaters in $location',
      description: description,
      path: '/listings/$location',
    );
  }

  static Widget composeProfilePage({
    required Widget child,
    required String businessName,
    required String location,
    required String description,
    required String id,
    required Map<String, Object> businessData,
  }) {
    // Generate structured data for search engines
    final jsonLd = generateLocalBusinessSchema(businessData);

    // Inject the structured data into the page
    injectJsonLd(jsonLd);

    return Seo.head(
      tags: [
        MetaTag(
          name: 'description',
          content: description,
        ),
        MetaTag(
          name: 'keywords',
          content:
              'panel beaters, $location, car repair, ${businessName.toLowerCase()}, auto body repair',
        ),
        MetaTag(
          name: 'og:title',
          content: '$businessName - Panel Beaters in $location',
        ),
        MetaTag(
          name: 'og:description',
          content: description,
        ),
        MetaTag(
          name: 'og:type',
          content: 'business.business',
        ),
        MetaTag(
          name: 'og:url',
          content: '$baseUrl/profile/$id',
        ),
        LinkTag(
          rel: 'canonical',
          href: '$baseUrl/profile/$id',
        ),
      ],
      child: child,
    );
  }

  static String generateLocalBusinessSchema(Map<String, Object> businessData) {
    final localSchema = {
      "@context": "https://schema.org",
      "@type": "AutoBodyShop", // More specific than AutoRepairShop
      "name": businessData['name'],
      "description": businessData['description'],
      "url": businessData['url'],
      "areaServed": {
        "@type": "GeoCircle",
        "geoMidpoint": {
          "@type": "GeoCoordinates",
          "latitude": businessData['latitude'],
          "longitude": businessData['longitude']
        },
        "geoRadius": "50km"
      },
      "address": {
        "@type": "PostalAddress",
        "streetAddress": businessData['streetAddress'],
        "addressLocality": businessData['city'],
        "addressRegion": businessData['province'],
        "postalCode": businessData['postalCode'],
        "addressCountry": "ZA"
      },
      "geo": {
        "@type": "GeoCoordinates",
        "latitude": businessData['latitude'],
        "longitude": businessData['longitude']
      },
      "telephone": businessData['telephone'],
      "openingHoursSpecification": businessData['openingHours'],
      "hasMap":
          "https://www.google.com/maps?q=${businessData['latitude']},${businessData['longitude']}",
      "paymentAccepted": ["cash", "credit card"],
      "currenciesAccepted": "ZAR",
      "priceRange": businessData['priceRange'] ?? "₱₱",
      "makesOffer": {
        "@type": "Offer",
        "itemOffered": {"@type": "Service", "name": "Auto Body Repair"}
      },
      "serviceArea": businessData['serviceArea'] ?? "South Africa",
      "availableLanguage": ["English", "Afrikaans"],
      "isMobile": true,
      "acceptsReservations": "Yes",
      "potentialAction": {
        "@type": "ViewAction",
        "target": [
          "https://panelbeatersdirectory.co.za/profile/${businessData['id']}",
          "android-app://com.panelbeaters/profile/${businessData['id']}",
          "ios-app://com.panelbeaters/profile/${businessData['id']}"
        ]
      }
    };
    return jsonEncode(localSchema);
  }

  static void injectJsonLd(String jsonLd) {
    // Remove any existing schema
    html.document
        .querySelectorAll('script[type="application/ld+json"]')
        .forEach((element) => element.remove());

    // Add new schema
    final script = html.ScriptElement()
      ..type = 'application/ld+json'
      ..text = jsonLd;
    html.document.head?.append(script);
  }

  static Future<Map<String, dynamic>> fetchBusinessData(
      String businessId) async {
    try {
      print('DEBUG: Querying Firestore for business ID: $businessId');
      print('DEBUG: businessId type: ${businessId.runtimeType}');

      // Try both string and int queries
      QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('listings')
          .where('listingsId', whereIn: [businessId, int.tryParse(businessId)])
          .limit(1)
          .get();

      print('DEBUG: Query parameters:');
      print('  - String value: $businessId');
      print('  - Int value: ${int.tryParse(businessId)}');
      print('DEBUG: Documents found: ${snapshot.docs.length}');

      if (snapshot.docs.isEmpty) {
        throw Exception('Business not found');
      }

      var data = snapshot.docs.first.data();
      print('DEBUG: Found document data: $data');

      if (data['specializedServices'] != null) {
        print(
            'Services Type: ${data['specializedServices'].runtimeType}'); // Debug services
        print(
            'Services Data: ${data['specializedServices']}'); // Debug services data
      }

      // Ensure specializedServices is a list of strings
      List<String> services = [];
      if (data['specializedServices'] != null) {
        services = (data['specializedServices'] as List)
            .map((e) => e.toString())
            .toList();
      }

      print('Services: $services'); // Debugging: Check the services list

      return {
        'name': data['title']?.toString() ?? '',
        'description': data['description']?.toString() ?? '',
        'url': '$baseUrl/profile/$businessId',
        'streetAddress': data['streetaddress']?.toString() ?? '',
        'city': data['city']?.toString() ?? '',
        'province': data['province']?.toString() ?? '',
        'postalCode': data['postalCode']?.toString() ?? '',
        'latitude': data['latitude'] ?? 0,
        'longitude': data['longitude'] ?? 0,
        'telephone': data['businessTelephone']?.toString() ?? '',
        'openingHours': data['businessHours']?.toString() ?? '',
        'priceRange': data['priceRange']?.toString() ?? '',
        'serviceArea': '${data['city'] ?? ''}, ${data['province'] ?? ''}',
        'makesOffer': services,
      };
    } catch (e) {
      print('Error fetching business data: $e');
      rethrow;
    }
  }

  static void addStructuredData(Map<String, dynamic> data) {
    _structuredData = data;
  }

  static Future<Widget> buildProfilePage(
      String businessId, Widget child) async {
    try {
      Map<String, dynamic> businessData = await fetchBusinessData(businessId);

      // Convert the data to the expected types before passing to composeProfilePage
      Map<String, Object> convertedData = Map<String, Object>.from({
        'name': businessData['name'],
        'description': businessData['description'],
        'url': businessData['url'],
        'streetAddress': businessData['streetAddress'],
        'city': businessData['city'],
        'province': businessData['province'],
        'postalCode': businessData['postalCode'],
        'latitude': businessData['latitude'],
        'longitude': businessData['longitude'],
        'telephone': businessData['telephone'],
        'openingHours': businessData['openingHours'],
        'priceRange': businessData['priceRange'],
        'serviceArea': businessData['serviceArea'],
        'makesOffer': businessData['makesOffer'],
      });

      return composeProfilePage(
        child: child,
        businessName: businessData['name'] as String,
        location: businessData['city'] as String,
        description: businessData['description'] as String,
        id: businessId,
        businessData: convertedData,
      );
    } catch (e) {
      print('Error building profile page: $e');
      rethrow;
    }
  }

  static String generateRobotsTxt() {
    return '''
User-agent: *
Allow: /
Disallow: /admin-portal
Disallow: /owners-portal
Disallow: /reset-password

# Mobile-specific paths
Allow: /*?m=1
Allow: /*mobile=1

Sitemap: $baseUrl/sitemap.xml
''';
  }
}

void testSeo() async {
  await SeoChecklist.runTests();
}
