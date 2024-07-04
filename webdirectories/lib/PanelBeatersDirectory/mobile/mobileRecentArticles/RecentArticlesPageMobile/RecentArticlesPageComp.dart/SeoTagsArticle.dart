import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/articles/RecentArticlesPage/RecentArticlesPageComp.dart/SeoTags.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileRecentArticles/RecentArticlesPageMobile/RecentArticlesPageComp.dart/SeoTagsMobile.dart';

class SeoTagsArticleMobile extends StatefulWidget {
  const SeoTagsArticleMobile({super.key});

  @override
  State<SeoTagsArticleMobile> createState() => _SeoTagsArticleMobileState();
}

class _SeoTagsArticleMobileState extends State<SeoTagsArticleMobile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            'Read more about:',
            style: TextStyle(
              color: Colors.black,
              fontSize: 10.53,
              fontStyle: FontStyle.italic,
              fontFamily: 'raleway',
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Row(
          children: [
            SeoTagsMobile(seoTag: 'Lightstone'),
            SeoTagsMobile(seoTag: 'EchoMBR'),
            SeoTagsMobile(seoTag: 'KAI Results'),
            SeoTagsMobile(seoTag: 'Panelbeaters'),
          ],
        )
      ],
    );
  }
}
