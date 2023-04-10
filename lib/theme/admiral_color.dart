import 'package:flutter/material.dart';

class AColor {
  const AColor(this.value);

  final int value;

  Color color() {
    return Color(value);
  }

  Color colorWithOpacity({double opacity = 0.6}) {
    return Color(value).withOpacity(opacity);
  }
}
