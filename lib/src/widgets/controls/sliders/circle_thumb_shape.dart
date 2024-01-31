import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class CircleThumbShape extends SliderComponentShape {
  const CircleThumbShape({
    required this.borderColor,
    required this.fillColor,
    this.thumbWidth = (LayoutGrid.halfModule / 2) * 5,
    this.borderWidth = LayoutGrid.halfModule * 1.5,
  });

  final Color borderColor;
  final Color fillColor;
  final double thumbWidth;
  final double borderWidth;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbWidth);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final Paint fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    final Paint borderPaint = Paint()
      ..color = borderColor
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, thumbWidth, fillPaint);
    canvas.drawCircle(center, thumbWidth, borderPaint);
  }
}
