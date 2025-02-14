import 'package:cloud_firestore/cloud_firestore.dart';

class StaticPageGenerator {
  static Future<String> generateProfileHTML(String businessId) async {
    final businessData = await FirebaseFirestore.instance
        .collection('listings')
        .doc(businessId)
        .get();

    if (!businessData.exists) return '';

    final data = businessData.data()!;

    return '''
      <!DOCTYPE html>
      <html lang="en">
        <head>
          <meta charset="UTF-8">
          <title>${data['title']} - Panel Beaters Directory</title>
          <meta name="description" content="${data['description']}">
          <link rel="canonical" href="https://webdirectories.co.za/panelbeaters-directory/profile/$businessId">
          
          <script type="application/ld+json">
            {
              "@context": "https://schema.org",
              "@type": "AutoRepair",
              "name": "${data['title']}",
              "description": "${data['description']}",
              "address": {
                "@type": "PostalAddress",
                "streetAddress": "${data['streetaddress']}",
                "addressLocality": "${data['city']}",
                "addressRegion": "${data['province']}",
                "addressCountry": "ZA"
              }
            }
          </script>
        </head>
        <body>
          <h1>${data['title']}</h1>
          <p>${data['description']}</p>
          <!-- Add more business details -->
        </body>
      </html>
    ''';
  }
}
