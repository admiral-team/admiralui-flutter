import 'dart:math' as math;
import 'package:flutter/material.dart';

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    this.animation,
    this.fillColor,
    this.fillGradient,
    this.ringColor,
    this.ringGradient,
    this.strokeWidth,
    this.strokeCap,
    this.backgroundColor,
    this.isReverse,
    this.isReverseAnimation,
    this.backgroundGradient,
  }) : super(repaint: animation);

  final Animation<double>? animation;
  final Color? fillColor;
  final Color? ringColor;
  final Color? backgroundColor;
  final double? strokeWidth;
  final StrokeCap? strokeCap;
  final bool? isReverse;
  final bool? isReverseAnimation;
  final Gradient? fillGradient; 
  final Gradient? ringGradient;
  final Gradient? backgroundGradient;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = ringColor!
      ..strokeWidth = strokeWidth!
      ..strokeCap = strokeCap!
      ..style = PaintingStyle.stroke;

    if (ringGradient != null) {
      final Rect rect = Rect.fromCircle(
          center: size.center(Offset.zero), radius: size.width / 2,);
      paint.shader = ringGradient!.createShader(rect);
    } else {
      paint.shader = null;
    }

    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);
    final double progress = (animation!.value) * 2 * math.pi;
    const double startAngle = math.pi * 1.5;

    // if ((!isReverse! && isReverseAnimation!) ||
    //     (isReverse! && isReverseAnimation!)) {
    //   progress = progress * -1;
    //   startAngle = -math.pi / 2;
    // }

    if (fillGradient != null) {
      final Rect rect = Rect.fromCircle(
          center: size.center(Offset.zero), radius: size.width / 2,);
      paint.shader = fillGradient!.createShader(rect);
    } else {
      paint.shader = null;
      paint.color = fillColor!;
    }

    canvas.drawArc(Offset.zero & size, startAngle, progress, false, paint);

    if (backgroundColor != null || backgroundGradient != null) {
      final Paint backgroundPaint = Paint();

      if (backgroundGradient != null) {
        final Rect rect = Rect.fromCircle(
            center: size.center(Offset.zero), radius: size.width / 2.2,);
        backgroundPaint.shader = backgroundGradient!.createShader(rect);
      } else {
        backgroundPaint.color = backgroundColor!;
      }
      canvas.drawCircle(
          size.center(Offset.zero), size.width / 2.2, backgroundPaint,);
    }
  }

  @override
  bool shouldRepaint(CustomTimerPainter oldDelegate) {
    return animation!.value != oldDelegate.animation!.value ||
        ringColor != oldDelegate.ringColor ||
        fillColor != oldDelegate.fillColor;
  }
}
