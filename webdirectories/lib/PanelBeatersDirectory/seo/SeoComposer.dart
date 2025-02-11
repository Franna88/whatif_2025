import 'package:flutter/material.dart';
import 'package:seo/seo.dart';
import 'dart:convert';

class SeoComposer {
  static Widget compose({
    required Widget child,
    required String title,
    required String description,
    required String path,
    Map<String, Object>? structuredData,
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
          content: 'https://panelbeatersdirectory.co.za$path',
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
          href: 'https://panelbeatersdirectory.co.za$path',
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
          content: 'width=device-width, initial-scale=1.0, maximum-scale=5.0',
        ),
      ],
      jsonLd: _generateStructuredData(structuredData),
      child: child,
    );
  }

  static String _generateStructuredData(Map<String, Object>? customData) {
    final baseData = <String, Object>{
      "@context": "https://schema.org",
      "@type": "LocalBusiness",
      "name": "Panel Beaters Directory",
      "description":
          "Find professional panel beaters and auto body repair services across South Africa",
      "url": "https://panelbeatersdirectory.co.za",
      "areaServed": "South Africa",
      "serviceType": "Auto Body Repair",
      "sameAs": [
        "https://www.facebook.com/panelbeatersdirectory",
        "https://twitter.com/panelbeaterssa",
      ],
    };

    if (customData != null) {
      baseData.addAll(customData);
    }

    return jsonEncode(baseData);
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
      structuredData: {
        "@type": "SearchResultsPage",
        "about": {
          "@type": "LocalBusiness",
          "name": "Panel Beaters in $location",
          "description": description,
          "areaServed": location,
        }
      },
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
    return compose(
      child: child,
      title: '$businessName - Panel Beaters in $location',
      description: description,
      path: '/profile/$id',
      structuredData: {
        "@type": "AutoRepair",
        "name": businessName,
        "description": description,
        "address": {
          "@type": "PostalAddress",
          "streetAddress": businessData['streetAddress'] ?? '',
          "addressLocality": businessData['city'] ?? '',
          "addressRegion": businessData['province'] ?? '',
          "postalCode": businessData['postalCode'] ?? '',
          "addressCountry": "ZA"
        },
        "geo": {
          "@type": "GeoCoordinates",
          "latitude": businessData['latitude'] ?? 0,
          "longitude": businessData['longitude'] ?? 0
        },
        "telephone": businessData['telephone'] ?? '',
        "openingHours": businessData['openingHours'] ?? '',
      },
    );
  }
}
