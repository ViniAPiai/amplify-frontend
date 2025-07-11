import 'package:flutter/material.dart';
import 'package:frontend/enums/tooth_code.dart';

class DentalArchPainter extends CustomPainter {
  final List<ToothCode> selectedTeeth;
  final Map<ToothCode, List<Path>> toothPaths;
  final double scale;

  DentalArchPainter({
    required this.selectedTeeth,
    required this.toothPaths,
    this.scale = 1
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(scale);
    final paintFill = Paint()
      ..style = PaintingStyle.fill;

    final paintStroke = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.miter;

    toothPaths.forEach((tooth, path) {
      paintFill.color = selectedTeeth.contains(tooth) ? Color(0xFF73D53F) : Colors.transparent;
      for(int i = 0; i < path.length; i++) {
        if(i == 0) {
          canvas.drawPath(path[i], paintFill);
          canvas.drawPath(path[i], paintStroke);
        } else {
          canvas.drawPath(path[i], paintStroke);
        }
      }
    });
  }

  @override
  bool shouldRepaint(DentalArchPainter oldDelegate) {
    final old = Set.from(oldDelegate.selectedTeeth);
    final current = Set.from(selectedTeeth);
    return old.length != current.length || !old.containsAll(current);
  }
}