import 'package:http/http.dart' as http;
import 'dart:convert';

class SeoTester {
  static const String baseUrl = 'https://webdirectories.co.za/panelbeaters';

  static Future<Map<String, dynamic>> validateSeo() async {
    return {
      'meta_tags': await _validateMetaTags(),
      'structured_data': await _validateStructuredData(),
      'sitemap': await _validateSitemap(),
      'mobile_friendly': await _validateMobileOptimization(),
    };
  }

  static Future<Map<String, bool>> _validateMetaTags() async {
    final response = await http.get(Uri.parse(baseUrl));
    final html = response.body;

    return {
      'has_title': html.contains('<title>'),
      'has_description': html.contains('name="description"'),
      'has_viewport': html.contains('name="viewport"'),
      'has_canonical': html.contains('rel="canonical"'),
      'has_language': html.contains('content-language'),
    };
  }

  static Future<bool> _validateStructuredData() async {
    final response = await http.get(Uri.parse(baseUrl));
    final html = response.body;
    return html.contains('application/ld+json');
  }

  static Future<bool> _validateSitemap() async {
    final response = await http.get(Uri.parse('$baseUrl/sitemap.xml'));
    return response.statusCode == 200;
  }

  static Future<bool> _validateMobileOptimization() async {
    // Use Google's Mobile-Friendly Test API
    final apiKey = 'YOUR_GOOGLE_API_KEY';
    final url =
        'https://searchconsole.googleapis.com/v1/urlTestingTools/mobileFriendlyTest:run';

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'url': baseUrl,
        'requestScreenshot': false,
      }),
    );

    final result = jsonDecode(response.body);
    return result['mobileFriendliness'] == 'MOBILE_FRIENDLY';
  }
}
