
import 'package:flutter/material.dart';

class TimeRange {

  final TimeOfDay startTime;
  final TimeOfDay endTime;

  TimeRange(this.startTime, this.endTime);

  factory TimeRange.empty() {
    return TimeRange(TimeOfDay(hour: 0, minute: 0), TimeOfDay(hour: 0, minute: 0));
  }

  factory TimeRange.fromJson(Map<String, dynamic> json) {
    return TimeRange(_timeOfDayFromJson(json["start"]), _timeOfDayFromJson(json["end"]));
  }

  bool isEmpty() {
    return startTime.hour == 0 && startTime.minute == 0 && endTime.hour == 0 && endTime.minute == 0;
  }

  static TimeOfDay _timeOfDayFromJson(String timeString) {
    final parts = timeString.split(":");
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  static String _timeOfDayToJson(TimeOfDay time) {
    return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
  }

  @override
  String toString() {
    return "${_timeOfDayToJson(startTime)} - ${_timeOfDayToJson(endTime)}";
  }



}