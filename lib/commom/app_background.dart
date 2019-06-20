import 'package:flutter/material.dart';
import 'package:game_message_app/styles/colors.dart';

class AppBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint){
        final height = constraint.maxHeight;
        final width = constraint.maxWidth;

        return Stack(
          children: <Widget>[
            Container(
              color: backgroundColor,
            ),
            Positioned(
              left: -(height/2 - width/2),
              bottom: height * 0.25,
              child: Container(
                // both use height because it's a circle
                height: height,
                width: height,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: firstCircleColor
                ),
              ),
            ),
            Positioned(
              left: width * 0.15,
              top: -width * 0.6,
              child: Container(
                // both use height because it's a circle
                height: width * 1.6,
                width: width * 1.6,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: secondCircleColor
                ),
              ),
            ),
            Positioned(
              right: -width * 0.2,
              top: -40,
              child: Container(
                // both use height because it's a circle
                height: width * 0.6,
                width: width * 0.6,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: thirdCircleColor
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
