import 'package:flutter/material.dart';

class ArrowSegmentSlider extends CustomPainter {
  ArrowSegmentSlider({
    required this.strokeColor,
    this.strokeWidth = 3,
    this.paintingStyle = PaintingStyle.stroke,
  });
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, y)
      ..lineTo(x / 2, 0)
      ..lineTo(x, y)
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(ArrowSegmentSlider oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
