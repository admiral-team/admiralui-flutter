import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class SubtitleImageCellWidget extends StatelessWidget {
  const SubtitleImageCellWidget({
    super.key,
    this.subtitle,
    this.imageWidget,
    this.isEnabled = true,
    this.scheme,
  });

  final String? subtitle;
  final IconData? imageWidget;
  final bool isEnabled;
  final SubtitleImageCellWidgetScheme? scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final SubtitleImageCellWidgetScheme listScheme =
        scheme ?? SubtitleImageCellWidgetScheme(theme: theme);
    final Color textColor =
        isEnabled ? listScheme.textColor : listScheme.disabledTextColor;

    List<Widget> children;
    children = <Widget>[];
    children.add(
      TextView(
        subtitle ?? '',
        font: listScheme.font,
        textColorNormal: textColor,
        textAlign: TextAlign.right,
      ),
    );

    if (subtitle != null) {
      if (imageWidget != null) {
        children.add(
          const SizedBox(
            width: LayoutGrid.module,
          ),
        );
      }
      if (imageWidget != null) {
        children.add(
          Icon(
            imageWidget,
            color: textColor,
            size: LayoutGrid.halfModule * 5,
          ),
        );
      }
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: children,
    );
  }
}
