import 'package:flutter/material.dart';
import 'package:game_message_app/commom/app_background.dart';
import 'package:game_message_app/commom/horizontal_tab_layout.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBackground(),
          Center(
            child: HorizontalTabLayout(),
          )
        ],
      ),
    );
  }
}
