import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class ArrowCellWidget extends StatelessWidget {
  const ArrowCellWidget({
    super.key,
    this.isEnabled = true,
    this.scheme,
  });

  final bool isEnabled;
  final ArrowCellWidgetScheme? scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ArrowCellWidgetScheme listScheme =
        scheme ?? ArrowCellWidgetScheme(theme: theme);
    final Color tintColor =
        isEnabled ? listScheme.tintColor : listScheme.disabledTintColor;
    return Icon(
      AdmiralIcons.admiral_ic_chevron_right_outline,
      color: tintColor,
      size: LayoutGrid.halfModule * 6,
    );
  }
}
