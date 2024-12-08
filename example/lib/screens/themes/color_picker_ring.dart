import 'dart:math';
import 'package:flutter/material.dart';

typedef ColorPickerChangeCallback = void Function(Color color);

class ColorPickerHueRing extends StatefulWidget {
  const ColorPickerHueRing({
    super.key,
    required this.color,
    required this.onColorChanged,
    this.size = 200.0
  });

  final Color color;
  final ColorPickerChangeCallback onColorChanged;
  final double size;

  @override
  _ColorPickerHueRingState createState() => _ColorPickerHueRingState();
}

class _ColorPickerHueRingState extends State<ColorPickerHueRing> {

  _ColorPickerHueRingState() : currentColor = Colors.white;
  
  Offset? selectedOffset;
  Color currentColor;

  @override
  void initState() {
    super.initState();
    currentColor = widget.color;
    selectedOffset = _calculateOffsetFromColor(currentColor);
  }

  @override
  void didUpdateWidget(ColorPickerHueRing oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.color != oldWidget.color) {
      setState(() {
        currentColor = widget.color;
        selectedOffset = _calculateOffsetFromColor(currentColor);
      });
    }
  }
  

  void _handleGesture(Offset position, BuildContext context) {
    RenderBox? box = context.findRenderObject() as RenderBox?;
    if (box == null) return;

    Offset localOffset = box.globalToLocal(position);

    Offset center = Offset(widget.size / 2, widget.size / 2);
    double radius = widget.size / 2;

    double distanceFromCenter = (localOffset - center).distance;

    if (distanceFromCenter <= radius) {
      setState(() {
        selectedOffset = localOffset;

        double angle = atan2(
          localOffset.dy - center.dy, localOffset.dx - center.dx);
        double hue = (angle * 180 / pi + 360) % 360;
        double saturation = (distanceFromCenter / radius).clamp(0.0, 1.0);

        HSVColor hsvColor = HSVColor.fromAHSV(1.0, hue, saturation, 1.0);
        currentColor = hsvColor.toColor();
        widget.onColorChanged(currentColor);
      });
    }
  }

  Offset? _calculateOffsetFromColor(Color color) {
    HSVColor hsvColor = HSVColor.fromColor(color);
    double hue = hsvColor.hue;
    double saturation = hsvColor.saturation;

    Offset center = Offset(widget.size / 2, widget.size / 2);
    double radius = widget.size / 2;

    // Угол в радианах
    double angle = (hue / 180) * pi;

    // Вычисляем координаты
    double x = center.dx + saturation * radius * cos(angle);
    double y = center.dy + saturation * radius * sin(angle);

    return Offset(x, y);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                width: widget.size,
                height: widget.size,
                child: Center(
      child: GestureDetector(
        onPanDown: (DragDownDetails details) => 
        _handleGesture(details.globalPosition, context),
        onPanUpdate: (DragUpdateDetails details) => 
        _handleGesture(details.globalPosition, context),
        child: SizedBox(
          width: widget.size,
          height: widget.size,
          child: CustomPaint(
            painter: HueRingPainter(currentColor, selectedOffset),
          ),
        ),
      ),
    ),);
  }
}

class HueRingPainter extends CustomPainter {
  HueRingPainter(this.selectedColor, this.selectedOffset);

  final Color selectedColor;
  final Offset? selectedOffset;

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = size.width / 2;

    double ringThickness = size.width * 0.8;
    double innerRadius = radius - ringThickness / 2;

    final Paint paint = Paint()
      ..shader = SweepGradient(
        colors: <Color>[
          const HSVColor.fromAHSV(1.0, 0.0, 1.0, 1.0).toColor(),
          const HSVColor.fromAHSV(1.0, 60.0, 1.0, 1.0).toColor(),
          const HSVColor.fromAHSV(1.0, 120.0, 1.0, 1.0).toColor(),
          const HSVColor.fromAHSV(1.0, 180.0, 1.0, 1.0).toColor(),
          const HSVColor.fromAHSV(1.0, 240.0, 1.0, 1.0).toColor(),
          const HSVColor.fromAHSV(1.0, 300.0, 1.0, 1.0).toColor(),
          const HSVColor.fromAHSV(1.0, 360.0, 1.0, 1.0).toColor(),
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = ringThickness;

    canvas.drawCircle(center, innerRadius, paint);

    if (selectedOffset != null) {
      canvas.drawCircle(
        selectedOffset!,
        8.0,
        Paint()
          ..color = Colors.black
          ..style = PaintingStyle.fill,
      );
      canvas.drawCircle(
        selectedOffset!,
        6.0,
        Paint()
          ..color = selectedColor
          ..style = PaintingStyle.fill,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
