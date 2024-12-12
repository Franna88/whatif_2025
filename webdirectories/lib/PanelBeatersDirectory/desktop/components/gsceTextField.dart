import 'package:flutter/material.dart';
import 'dart:ui_web' as ui;
import 'package:web/web.dart' as web;
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class GsceTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Register a view for the HTML content

    // ui.platformViewRegistry.registerViewFactory(
    //   'google-search',
    //   (int viewId) => web.HTMLDivElement().innerHTML = '''
    //       <script async src="https://cse.google.com/cse.js?cx=a182b439dfdc444f4">
    //       </script>
    //       <div class="gcse-search"></div>
    //   ''',
    // );
    // ui.platformViewRegistry.registerViewFactory(
    //     'google-search', (int viewId) => web.HTMLDivElement().innerHTML = '''<div>Hello World</div>''');

    return const SizedBox(
      height: 200,
      child: Center(
        child: HtmlWidget('<div class="gcse-search"></div>'),
      ),
    );
  }
}
