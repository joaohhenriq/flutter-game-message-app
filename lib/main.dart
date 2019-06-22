import 'package:flutter/material.dart';
import 'package:game_message_app/pages/landing_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Game Msg App',
        theme: ThemeData(
          platform: TargetPlatform.iOS,
        ),
        debugShowCheckedModeBanner: false,
        home: LandingPage());
  }
}
