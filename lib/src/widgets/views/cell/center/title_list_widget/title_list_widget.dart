import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class TitleCellWidget extends StatelessWidget {
  const TitleCellWidget({
    super.key,
    this.title,
    this.isEnabled = true,
    this.scheme,
  });

  final String? title;
  final bool isEnabled;
  final TitleCellWidgetScheme? scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final TitleCellWidgetScheme listScheme =
        scheme ?? TitleCellWidgetScheme(theme: theme);
    final Color textColor =
        isEnabled ? listScheme.textColor : listScheme.disabledTextColor;
    return TextView(
          title ?? '',
          font: listScheme.font,
          textColorNormal: textColor,
          textAlign: TextAlign.left,
        );
  }
}
