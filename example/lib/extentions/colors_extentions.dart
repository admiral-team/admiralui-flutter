import 'package:flutter/material.dart';

extension ColorExtension on Color {
  /// Converts the Color to a HEX string.
  /// Example: Color(0xFF123456) -> "#123456"
  String toHexString() {
    // ignore: lines_longer_than_80_chars
    return '#${value.toRadixString(16).padLeft(8, '0').substring(2, 8).toUpperCase()}';
  }
}
