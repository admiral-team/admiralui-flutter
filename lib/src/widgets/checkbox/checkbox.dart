import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// This is a private class for creating checkbox unit for the [CheckBoxTitle].
class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    required this.fillColor,
    required this.value,
  });

  final bool value;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    const int checkAnimation = 650;

    return AnimatedContainer(
      margin: const EdgeInsets.all(LayoutGrid.module / 4),
      duration: const Duration(milliseconds: checkAnimation),
      curve: Curves.fastLinearToSlowEaseIn,
      decoration: BoxDecoration(
        color: value ? fillColor : Colors.transparent,
        borderRadius: BorderRadius.circular(LayoutGrid.halfModule),
        border: Border.all(
          color: value ? Colors.transparent : fillColor,
          width: LayoutGrid.module / 4,
        ),
      ),
      width: LayoutGrid.module / 2 * 5,
      height: LayoutGrid.module / 2 * 5,
      child: Icon(
        Icons.check,
        color: value ? colors.backgroundBasic.color() : Colors.transparent,
        size: LayoutGrid.module * 1.5,
      ),
    );
  }
}
