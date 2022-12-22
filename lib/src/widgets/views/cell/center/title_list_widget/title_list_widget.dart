import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class TitleListWidget extends StatelessWidget {
  const TitleListWidget({
    super.key,
    this.title,
    this.isEnabled = true,
    this.scheme,
  });

  final String? title;
  final bool isEnabled;
  final TitleListWidgetScheme? scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final TitleListWidgetScheme listScheme =
        scheme ?? TitleListWidgetScheme(theme: theme);
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
