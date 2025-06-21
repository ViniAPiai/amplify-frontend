
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

extension UtilsExtension on BuildContext {

  ScreenBreakpoints get breakpoints => ResponsiveSizingConfig.instance.breakpoints;

  bool get isDesktop => getDeviceType(MediaQuery.of(this).size, ScreenBreakpoints(desktop: 1100, tablet: 550, watch: 200)) == DeviceScreenType.desktop;

  bool get isTablet => getDeviceType(MediaQuery.of(this).size, ScreenBreakpoints(desktop: 1100, tablet: 550, watch: 200)) == DeviceScreenType.tablet;

  bool get isTabletOrDesktop => isTablet || isDesktop;

  String timeOfDayString(TimeOfDay time) => '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';

}