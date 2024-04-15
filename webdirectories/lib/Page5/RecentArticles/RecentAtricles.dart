import 'package:flutter/material.dart';
import 'package:webdirectories/Page5/RecentArticles/RecentArticlesComponents/ArticleContainer.dart';
import 'package:webdirectories/myutility.dart';

class RecentAtricles extends StatefulWidget {
  const RecentAtricles({super.key});

  @override
  State<RecentAtricles> createState() => _RecentAtriclesState();
}

class _RecentAtriclesState extends State<RecentAtricles> {
  final email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MyUtility(context).height * 1.35,
        width: MyUtility(context).width / 1.2,
        child: Column(
          children: [
            SizedBox(
              width: MyUtility(context).width / 1.35,
              height: MyUtility(context).height * 0.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent articles",
                    style: TextStyle(
                      fontSize: 42,
                      fontFamily: 'ralewaysemi',
                    ),
                  ),
                  SizedBox(
                    width: MyUtility(context).width * 0.2,
                    height: 45,
                    child: TextFormField(
                      controller: email,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        labelText: 'Search Keywords',
                        labelStyle: TextStyle(
                          fontSize: 18,
                          fontFamily: 'raleway',
                          color: Colors.black,
                        ),
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(
                              right: 8), // Add padding to the right
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF88888C),
                              ),
                              padding: EdgeInsets.all(4),
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ArticlesContainer(
                    image: 'images/drive.png',
                    catagory: 'Panel Beater Directory',
                    headline:
                        "See your Lightstone EchoMBR Results for February 2024",
                    writer: 'Wena Cronje',
                    discription:
                        "Your CSI success contributes to your business success and assists both prospects and industry users.",
                    onpress: () {}),
                ArticlesContainer(
                    image: 'images/turbine.png',
                    catagory: 'Fuel Directory',
                    headline:
                        "What Would Happen If You Put Jet Fuel in Your Car?",
                    writer: 'Wena Cronje',
                    discription:
                        "Will jet fuel provide a performance boost or lead to disastrous results?",
                    onpress: () {}),
                ArticlesContainer(
                    image: 'images/drive1.png',
                    catagory: 'Towing Directory',
                    headline: "Why Compare Car Insurance quotes?",
                    writer: 'Wena Cronje',
                    discription:
                        "Let us explore how you could save big on your premiums.",
                    onpress: () {}),
              ],
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ArticlesContainer(
                    image: 'images/buisness.png',
                    catagory: 'Web Directories',
                    headline: "How to Create a Killer Web Directories Listing",
                    writer: 'Wena Cronje',
                    discription:
                        "Today, we'll share 7 tips to drive your online presence and revenue to new heights.",
                    onpress: () {}),
                ArticlesContainer(
                    image: 'images/confrance.png',
                    catagory: 'Web Directories',
                    headline: "Is Hybrid Work spaces the Future?",
                    writer: 'Wena Cronje',
                    discription:
                        "Let’s explore hybrid working models that combines home and office work.",
                    onpress: () {}),
                ArticlesContainer(
                    image: 'images/crime.png',
                    catagory: 'Auto Repair Directory',
                    headline:
                        "Hijacking and Carjacking: What to do in such events",
                    writer: 'Wena Cronje',
                    discription:
                        "Hijacking in South Africa is one of those scary facts we do not like to think about. Prevention is better than cure.",
                    onpress: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
