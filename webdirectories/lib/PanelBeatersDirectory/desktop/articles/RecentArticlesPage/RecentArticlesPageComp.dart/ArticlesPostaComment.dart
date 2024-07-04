import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/articles/RecentArticlesPage/RecentArticlesPageComp.dart/TextFiends/PostComentTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/articles/RecentArticlesPage/RecentArticlesPageComp.dart/TextFiends/PostCommentSort.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/articles/RecentArticlesPage/RecentArticlesPageComp.dart/TextFiends/PostCommentEmail.dart';
import 'package:webdirectories/myutility.dart';

class ArticlesPostComment extends StatefulWidget {
  const ArticlesPostComment({super.key});

  @override
  State<ArticlesPostComment> createState() => _ArticlesPostCommentState();
}

class _ArticlesPostCommentState extends State<ArticlesPostComment> {
  final TextEditingController myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 10),
          child: Text(
            'Like the article? ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 23.8,
              fontFamily: 'ralewaysemi',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
            width: 770.8,
            //height: MyUtility(context).height * 0.365,
            decoration: ShapeDecoration(
              color: Color(0xFFEFECEC),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.16),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 8,),
                Text(
                  'Join the conversation!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFE5882F),
                    fontSize: 20.4,
                    fontFamily: 'ralewaysemi',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    'This is a space for respectful conversation. Let’s keep all comments productive and inclusive and the discussion focused on the content of the article, any hateful, offensive and disrespectful language will be removed.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF606060),
                      fontSize: 13.6,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  width: MyUtility(context).width * 0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Postcommentsort(
                          hintText: 'First Name', controller: myController),
                      Postcommentsort(
                          hintText: 'Last Name', controller: myController),
                    ],
                  ),
                ),
                PostCommentEmail(controller: myController),
                PostCommentTextField(controller: myController),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SizedBox(
                    width: MyUtility(context).width * 0.4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFF8728),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.40),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Post Comment',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 11.56,
                              fontFamily: 'raleway',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
