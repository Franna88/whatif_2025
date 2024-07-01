import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/articles/RecentArticlescomponents/ArticlesContainer.dart';
import 'package:webdirectories/myutility.dart';

class RecentArticlesPage extends StatefulWidget {
  const RecentArticlesPage({Key? key}) : super(key: key);

  @override
  State<RecentArticlesPage> createState() => _RecentArticlesPageState();
}

class _RecentArticlesPageState extends State<RecentArticlesPage> {
  final search = TextEditingController();
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MyUtility(context).height,
        width: MyUtility(context).width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/mainbackgroundPanel.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
            right: 75,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 25),
                child: SizedBox(
                  width: MyUtility(context).width / 1.15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Image.asset(
                          'images/logoPanel.png',
                          height: 70,
                        ),
                      ),
                      Text(
                        'Recent Articles:',
                        style: TextStyle(
                          fontSize: 34,
                          fontFamily: 'ralewaybold',
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: MyUtility(context).width / 1.12,
                height: MyUtility(context).height * 0.83,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.56, -0.83),
                    end: Alignment(-0.56, 0.83),
                    colors: [
                      Colors.white.withOpacity(0.1),
                      Colors.white.withOpacity(0.4)
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0xBF000000),
                      blurRadius: 24,
                      offset: Offset(0, 4),
                      spreadRadius: -1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      width: MyUtility(context).width / 1.1,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFF0E1013),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: MyUtility(context).width * 0.25,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black,
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.search,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: search,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'ralewaysemi',
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'Search Keywords',
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'ralewaysemi',
                                        color: Color(0xFF717375),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 10,
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    search.clear();
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    color: Color(0xFF717375),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: DraggableScrollbar.rrect(
                          controller: _scrollController,
                          backgroundColor: Colors.grey.withOpacity(0.3),
                          alwaysVisibleScrollThumb: true,
                          child: ListView(
                            controller: _scrollController,
                            children: [
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
