
import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {

  String toFormattedString(TimeOfDay time) => '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';

}