import 'package:flutter/material.dart';
import 'package:seo/seo.dart';
import 'package:seo/html/seo_widget.dart';
import 'dart:convert';
import 'dart:html' as html;
import 'package:cloud_firestore/cloud_firestore.dart';

class SeoComposer {
  static final _firestore = FirebaseFirestore.instance;
  static Map<String, dynamic> _structuredData = {};

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
    String jsonLd = generateJsonLd(businessData);
    injectJsonLd(jsonLd);
    return compose(
      child: child,
      title: '$businessName - Panel Beaters in $location',
      description: description,
      path: '/profile/$id',
    );
  }

  static String generateJsonLd(Map<String, Object> businessData) {
    final structuredData = {
      "@context": "https://schema.org",
      "@type": "LocalBusiness",
      "name": businessData['name'],
      "description": businessData['description'],
      "url": businessData['url'],
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
      "openingHours": businessData['openingHours'],
    };

    return jsonEncode(structuredData);
  }

  static void injectJsonLd(String jsonLd) {
    final script = html.ScriptElement()
      ..type = 'application/ld+json'
      ..text = jsonLd;
    html.document.head?.append(script);
  }

  static Future<Map<String, Object>> fetchBusinessData(
      String businessId) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('listings').doc(businessId).get();
      if (!doc.exists) {
        throw Exception('Business not found');
      }

      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return {
        'name': data['title'] ?? '',
        'description': data['description'] ?? '',
        'url': 'https://panelbeatersdirectory.co.za/profile/$businessId',
        'streetAddress': data['streetaddress'] ?? '',
        'city': data['city'] ?? '',
        'province': data['province'] ?? '',
        'postalCode': data['postalCode'] ?? '',
        'latitude': data['latitude'] ?? 0,
        'longitude': data['longitude'] ?? 0,
        'telephone': data['businessTelephone'] ?? '',
        'openingHours': data['businessHours'] ?? '',
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
      Map<String, Object> businessData = await fetchBusinessData(businessId);
      return composeProfilePage(
        child: child,
        businessName: businessData['name'] as String,
        location: businessData['city'] as String,
        description: businessData['description'] as String,
        id: businessId,
        businessData: businessData,
      );
    } catch (e) {
      print('Error building profile page: $e');
      rethrow;
    }
  }
}
