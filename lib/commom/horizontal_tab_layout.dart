import 'package:flutter/material.dart';
import 'package:game_message_app/commom/tab_text.dart';
import 'package:game_message_app/model/forum.dart';
import 'package:game_message_app/styles/text_styles.dart';

import 'forum_card.dart';

class HorizontalTabLayout extends StatefulWidget {
  @override
  _HorizontalTabLayoutState createState() => _HorizontalTabLayoutState();
}

class _HorizontalTabLayoutState extends State<HorizontalTabLayout>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _animation;
  Animation<double> _fadeTransitionAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _animation = Tween<Offset>(begin: Offset(0, 0), end: Offset(-0.05, 0)).animate(_controller);
    _fadeTransitionAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  playAnimation() {
    _controller.reset();
    _controller.forward();
  }

  int selectedTabIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: -30,
            bottom: 0,
            top: 0,
            width: 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 80.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TabText(
                      text: "Media",
                      isSelected: selectedTabIndex == 0,
                      onTabTap: () {
                        onTabTap(0);
                      }),
                  TabText(
                      text: "Streamer",
                      isSelected: selectedTabIndex == 1,
                      onTabTap: () {
                        onTabTap(1);
                      }),
                  TabText(
                      text: "Forum",
                      isSelected: selectedTabIndex == 2,
                      onTabTap: () {
                        onTabTap(2);
                      }),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: FutureBuilder(
              future: playAnimation(),
              builder: (context, snapshot){
                return FadeTransition(
                  opacity: _fadeTransitionAnimation,
                  child: SlideTransition(
                    position: _animation,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: getList(selectedTabIndex),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  //index do menu lateral (forum, streamer, media)
  List<Widget> getList(index) {
    return [
      [
        ForumCard(forum: fortniteForum,),
        ForumCard(forum: pubgForum,),
      ],
      [
        ForumCard(forum: pubgForum,),
        ForumCard(forum: fortniteForum,),
      ],
      [
        ForumCard(forum: fortniteForum,),
        ForumCard(forum: pubgForum,),
      ]
    ][index];
  }

  onTabTap(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }
}
