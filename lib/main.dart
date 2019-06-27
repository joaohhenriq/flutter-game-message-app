import 'package:flutter/material.dart';
import 'package:game_message_app/pages/landing_page.dart';

import 'api/firebase_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FirebaseService _firebaseService = FirebaseService();
    return MaterialApp(
        title: 'Game Msg App',
        theme: ThemeData(
          platform: TargetPlatform.iOS,
        ),
        debugShowCheckedModeBanner: false,
        home: LandingPage(firebaseService: _firebaseService));
  }
}
