import 'package:flutter/material.dart';

class AColor {
  const AColor(this.value);

  final int value;

  Color color({double opacity = 1.0}) {
    return Color(value).withOpacity(opacity);
  }
}
