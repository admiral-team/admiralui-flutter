import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

enum SpinnerStyle {
  initial,
  contrast,
}

enum SpinnerSize {
  small,
  medium,
  large,
}

class Spinner extends StatefulWidget {
  const Spinner(
    this.style,
    this.size, {
    this.scheme,
  });

  final SpinnerStyle style;
  final SpinnerSize size;
  final SpinnerScheme? scheme;

  @override
  State<StatefulWidget> createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> {
  late SpinnerScheme scheme;
  late double lineWidth;
  late double spinnerSize;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? SpinnerScheme(theme: theme);

    final Color lineColor = widget.style == SpinnerStyle.initial
        ? scheme.defaultColor.color()
        : scheme.contrastColor.color();

    switch (widget.size) {
      case SpinnerSize.large:
        lineWidth = LayoutGrid.module / 2;
        spinnerSize = LayoutGrid.doubleModule * 3;
        break;
      case SpinnerSize.medium:
        lineWidth = LayoutGrid.tripleModule / 8;
        spinnerSize = LayoutGrid.tripleModule;
        break;
      case SpinnerSize.small:
        lineWidth = LayoutGrid.doubleModule / 8;
        spinnerSize = LayoutGrid.doubleModule;
        break;
    }

    return SizedBox(
      width: spinnerSize,
      height: spinnerSize,
      child: CircularProgressIndicator(
        color: lineColor,
        strokeWidth: lineWidth,
      ),
    );
  }
}
