import 'dart:math' as math;
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class CircularPainter extends CustomPainter {
  const CircularPainter({
    required this.percentage,
    required this.color,
    this.strokeWidth = LayoutGrid.module / 4,
  });

  final double percentage;
  final Color color;
  final double strokeWidth;

  double deg2Rand(double deg) => deg * math.pi / 180;

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final double sweepAngle = deg2Rand(360 * percentage);
    final Offset midOffset = Offset(radius, radius);

    final Paint paint = Paint()
      ..strokeCap = StrokeCap.round
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawArc(
      Rect.fromCenter(
        center: midOffset,
        width: size.width,
        height: size.height,
      ),
      deg2Rand(-90),
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
