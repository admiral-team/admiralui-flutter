import 'package:flutter/material.dart';

class SliderLinePainter extends CustomPainter {
  const SliderLinePainter({
    required this.color,
    required this.divisions,
    this.currentSliderValue,
  });

  final Color color;
  final double? currentSliderValue;
  final int divisions;

  @override
  void paint(Canvas canvas, Size size) {
    const Offset p1 = Offset.zero;
    final double width = currentSliderValue != null
        ? (currentSliderValue! * size.width) / divisions
        : size.width;
    final Offset p2 = Offset(width, 0);

    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = size.height;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
