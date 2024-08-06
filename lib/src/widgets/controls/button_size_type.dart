import 'package:admiralui_flutter/layout/layout_grid.dart';

abstract class ButtonSizeType {
  const ButtonSizeType();

  factory ButtonSizeType.custom(double width, double height) = CustomButtonSize;

  double get width;
  double get height;

  static const ButtonSizeType small = SmallButtonSize();
  static const ButtonSizeType medium = MediumButtonSize();
  static const ButtonSizeType big = BigButtonSize();
}

class SmallButtonSize extends ButtonSizeType {
  const SmallButtonSize();

  @override
  double get width => LayoutGrid.module * 16;

  @override
  double get height => LayoutGrid.halfModule * 10;
}

class MediumButtonSize extends ButtonSizeType {
  const MediumButtonSize();

  @override
  double get width => LayoutGrid.halfModule * 75;

  @override
  double get height => LayoutGrid.doubleModule * 3;
}

class BigButtonSize extends ButtonSizeType {
  const BigButtonSize();

  @override
  double get width => double.infinity;

  @override
  double get height => LayoutGrid.doubleModule * 3;
}

class CustomButtonSize extends ButtonSizeType {

  const CustomButtonSize(this.customWidth, this.customHeight);
  final double customWidth;
  final double customHeight;

  @override
  double get width => customWidth;

  @override
  double get height => customHeight;
}
