import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class CustomThumbShape implements RangeSliderThumbShape {
  const CustomThumbShape({
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
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      bool isDiscrete = false,
      bool isEnabled = false,
      bool? isOnTop,
      required SliderThemeData sliderTheme,
      TextDirection? textDirection,
      Thumb? thumb,
      bool? isPressed,}) {
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
