

import 'package:frontend/models/dentist_free_time/time_range.dart';

class DentistFreeTimeResponse {

  final List<TimeRange> timeRanges;

  DentistFreeTimeResponse(this.timeRanges);

  factory DentistFreeTimeResponse.fromJson(Map<String, dynamic> json) {
    return DentistFreeTimeResponse(List.from(json["timeRanges"]).map((e) => TimeRange.fromJson(e)).toList());
  }

}