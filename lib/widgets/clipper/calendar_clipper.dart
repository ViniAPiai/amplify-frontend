import 'package:flutter/material.dart';

class CalendarClipper extends CustomClipper<Rect> {

  final Rect rect;

  CalendarClipper(this.rect);

  @override
  Rect getClip(Size size) => rect;

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => false;



}
