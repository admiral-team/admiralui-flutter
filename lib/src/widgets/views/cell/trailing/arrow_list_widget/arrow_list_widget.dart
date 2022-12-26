import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class ArrowListWidget extends StatelessWidget {
  const ArrowListWidget({
    super.key,
    this.isEnabled = true,
    this.scheme,
  });

  final bool isEnabled;
  final ArrowListWidgetScheme? scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ArrowListWidgetScheme listScheme =
        scheme ?? ArrowListWidgetScheme(theme: theme);
    final Color tintColor =
        isEnabled ? listScheme.tintColor : listScheme.disabledTintColor;
    return Icon(
      AdmiralIcons.admiral_ic_chevron_right_outline,
      color: tintColor,
    );
  }
}
