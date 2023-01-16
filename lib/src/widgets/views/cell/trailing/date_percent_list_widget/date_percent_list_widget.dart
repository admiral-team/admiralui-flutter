import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class DatePercentCellWidget extends StatelessWidget {
  const DatePercentCellWidget({
    super.key,
    this.dateText,
    this.percentText,
    this.isEnabled = true,
    this.scheme,
  });

  final String? dateText;
  final String? percentText;
  final bool isEnabled;
  final DatePercentCellWidgetScheme? scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final DatePercentCellWidgetScheme listScheme =
        scheme ?? DatePercentCellWidgetScheme(theme: theme);
    final Color textColor =
        isEnabled ? listScheme.textColor : listScheme.disabledTextColor;

    List<Widget> children;
    children = <Widget>[];

    if (dateText != null) {
      children.add(
        TextView(
          dateText ?? '',
          font: listScheme.font,
          textColorNormal: textColor,
          textAlign: TextAlign.right,
        ),
      );
    }
    if (percentText != null) {
      if (dateText != null) {
        children.add(const SizedBox(
          height: LayoutGrid.module,
        ),);
      }
      children.add(
        TextView(
          percentText ?? '',
          font: listScheme.font,
          textColorNormal: textColor,
          textAlign: TextAlign.right,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: children,
    );
  }
}
