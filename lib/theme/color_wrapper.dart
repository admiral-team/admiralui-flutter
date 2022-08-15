import 'package:flutter/material.dart';

class ColorWrapper {
  final int value;

  const ColorWrapper(this.value);

  Color color({double opacity = 1.0}) {
    return Color(value).withOpacity(opacity);
  }
}
