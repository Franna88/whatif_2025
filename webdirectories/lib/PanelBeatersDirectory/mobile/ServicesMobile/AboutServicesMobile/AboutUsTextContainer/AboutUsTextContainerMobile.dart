import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class AboutUsTextContainerMobile extends StatefulWidget {
  final String aboutUsText;
  const AboutUsTextContainerMobile({super.key, required this.aboutUsText});

  @override
  State<AboutUsTextContainerMobile> createState() =>
      _AboutUsTextContainerMobileState();
}

class _AboutUsTextContainerMobileState
    extends State<AboutUsTextContainerMobile> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.9,
      height: MyUtility(context).height * 0.58,
      decoration: ShapeDecoration(
        color: Color(0xFF181B1D),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                'About Us:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.4,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: const EdgeInsets.only(right: 35),
                  child: Text(
                    widget.aboutUsText.isEmpty
                        ? 'No more information found'
                        : _stripHtmlTags(widget.aboutUsText),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'raleway',
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Simple function to strip basic HTML tags
  String _stripHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText
        .replaceAll(exp, ' ')
        .replaceAll('&nbsp;', ' ')
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'");
  }
}
