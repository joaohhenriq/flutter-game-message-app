import 'package:flutter/material.dart';
import 'package:game_message_app/model/forum.dart';

import 'forum_details_widget.dart';
import 'forum_name_widget.dart';

class ForumCard extends StatelessWidget {
  final Forum forum;

  ForumCard({this.forum});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      child: Card(
        margin: const EdgeInsets.fromLTRB(25.0, 40, 10, 40),
        elevation: 15.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          child: Stack(
            children: <Widget>[
              Image.asset(
                forum.imagePath,
                width: 240.0,
                fit: BoxFit.fitWidth,
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: ForumDetailsWidget(forum: forum),
              ),
              Positioned(
                  left: 0,
                  bottom: 80.0,
                  child: ForumNameWidget(
                    forum: forum,
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
}
