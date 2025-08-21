
import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  IgnorePointer ignorePointer({bool ignoring = false}) => IgnorePointer(ignoring: ignoring, child: this);
}