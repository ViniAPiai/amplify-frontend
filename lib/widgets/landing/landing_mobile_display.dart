import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';

class LandingMobileDisplay extends StatelessWidget {
  const LandingMobileDisplay({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: context.mqWidth,
          height: context.mqHeight,
          color: color,
        ),
        Positioned(
          bottom: 0,
          child: Card(
            elevation: 5,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.only(topLeft: Radius.circular(100))),
            child: Container(
              width: context.mqWidth,
              height: context.mqHeight * 0.45,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(100))),
            ),
          ),
        )
      ],
    );
  }
}
