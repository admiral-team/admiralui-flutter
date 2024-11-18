import 'package:flutter/material.dart';

class AColor {
  const AColor(this.value);

  factory AColor.fromJson(Map<String, dynamic> json) {
    return AColor(json['value']);
  }

  final int value;

  Color color() {
    return Color(value);
  }

  Color colorWithOpacity({double opacity = 0.6}) {
    return Color(value).withOpacity(opacity);
  }

  Map<String, int> toJson() {
    return <String, int>{
      'value': value,
    };
  }
  
}
