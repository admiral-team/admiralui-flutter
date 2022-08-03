import 'package:flutter/material.dart';
import '../../../layout/layout_grid.dart';

enum ButtonSizeType {
  small,
  medium,
  big,
}

extension ButtonSizeTypeExtension on ButtonSizeType {
  double get height {
    switch (this) {
      case ButtonSizeType.small:
        return LayoutGrid.halfModule * 10;
      case ButtonSizeType.medium:
        return LayoutGrid.doubleModule * 3;
      case ButtonSizeType.big:
        return LayoutGrid.doubleModule * 3;
    }
  }

  double get width {
    switch (this) {
      case ButtonSizeType.small:
        return LayoutGrid.module * 16;
      case ButtonSizeType.medium:
        return LayoutGrid.halfModule * 75;
      case ButtonSizeType.big:
        return double.infinity;
    }
  }
}
