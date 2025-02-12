import 'seo_tester.dart';

class SeoChecklist {
  static final List<Map<String, dynamic>> checklist = [
    {
      'category': 'Meta Tags',
      'items': [
        'Title tags present and optimized',
        'Meta descriptions present and compelling',
        'Viewport meta tag configured',
        'Language tag set to en-ZA',
        'Canonical URLs implemented',
      ]
    },
    {
      'category': 'Structured Data',
      'items': [
        'Local Business schema present',
        'Schema validates in testing tool',
        'Business hours formatted correctly',
        'Geographic coordinates accurate',
      ]
    },
    {
      'category': 'Mobile Optimization',
      'items': [
        'Passes Google Mobile-Friendly test',
        'Responsive design working',
        'Touch elements properly sized',
        'No horizontal scrolling',
      ]
    },
    {
      'category': 'Technical SEO',
      'items': [
        'Sitemap.xml accessible',
        'Robots.txt properly configured',
        'No broken links',
        'Page load speed optimized',
      ]
    },
  ];

  static Future<void> runTests() async {
    final results = await SeoTester.validateSeo();
    // Log results and generate report
    print('SEO Test Results:');
    print(results);
  }
}
