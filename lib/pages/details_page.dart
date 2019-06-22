import 'package:flutter/material.dart';
import 'package:game_message_app/commom/app_background.dart';
import 'package:game_message_app/commom/label_value_widget.dart';
import 'package:game_message_app/model/forum.dart';
import 'package:game_message_app/model/topic.dart';
import 'package:game_message_app/styles/colors.dart';
import 'package:game_message_app/styles/text_styles.dart';

class DetailsPage extends StatefulWidget {
  final Forum forum;

  DetailsPage({this.forum});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation<double> _fadeAnimation;
  Animation<double> _scaleAnimation;
  Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _offsetAnimation = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(_controller);
  }

  _playAnimation() {
    _controller.reset();
    _controller.forward();
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBackground(
            firstColor: firstOrangeCircleColor,
            secondColor: secondOrangeCircleColor,
            thirdColor: thirdOrangeCircleColor,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 45.0,
              ),
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 15.0,),
              FutureBuilder(
                future: _playAnimation(),
                builder: (context, snapshot) {
                  return FadeTransition(
                    opacity: _fadeAnimation,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 100),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          LabelValueWidget(
                            value: widget.forum.topics.length.toString(),
                            label: "topics",
                            labelStyle: whiteLabelTextStyle,
                            valueStyle: whiteValueTextStyle,
                          ),
                          LabelValueWidget(
                            value: widget.forum.threads,
                            label: "threads",
                            labelStyle: whiteLabelTextStyle,
                            valueStyle: whiteValueTextStyle,
                          ),
                          LabelValueWidget(
                            value: widget.forum.subs,
                            label: "subs",
                            labelStyle: whiteLabelTextStyle,
                            valueStyle: whiteValueTextStyle,
                          )
                        ],
                      ),
                    ),
                  );
                },

              ),
              SizedBox(
                height: 15.0,
              ),
              Hero(
                tag: widget.forum.title,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0)),
                  child: Image.asset(widget.forum.imagePath),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0)),
              child: Container(
                height: 200.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Topics",
                        style: subHeadingStyle.copyWith(fontSize: 22.0),),
                      Expanded(
                        child: SlideTransition(
                          position: _offsetAnimation,
                          child: ListView(
                            shrinkWrap: true,
                            children: <Widget>[
                              TopicsTile(topic: widget.forum.topics[0]),
                              TopicsTile(topic: widget.forum.topics[1]),
                            ],),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 166,
            right: 20,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Material(
                elevation: 10.0,
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(widget.forum.rank, style: rankBigStyle,)
                ),
                color: Colors.white,
                shape: CircleBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopicsTile extends StatelessWidget {

  final Topic topic;

  TopicsTile({this.topic});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                topic.question,
                style: topicQuestionTextStyle,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8.0, vertical: 8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: primaryColor
                ),
                child: Text(
                  topic.answerCount, style: topicAnswerCountTextStyle,),
              )
            ],
          ),
          SizedBox(height: 4.0,),
          Text(
            topic.recentAnswer,
            style: topicAnswerTextStyle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
