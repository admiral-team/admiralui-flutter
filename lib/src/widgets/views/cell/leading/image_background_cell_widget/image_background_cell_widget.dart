import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class ImageBackgroundCellWidget extends StatelessWidget {
  const ImageBackgroundCellWidget({
    super.key,
    this.icon,
    this.isEnabled = true,
    this.scheme,
  });

  final IconData? icon;
  final bool isEnabled;
  final ImageBackgroundCellWidgetScheme? scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ImageBackgroundCellWidgetScheme listScheme =
        scheme ?? ImageBackgroundCellWidgetScheme(theme: theme);
    final Color backgroundColor = isEnabled
        ? listScheme.backgroundColor
        : listScheme.disabledBackgroundColor;
    final Color tintColor =
        isEnabled ? listScheme.tintColor : listScheme.disabledTintColor;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(LayoutGrid.halfModule * 5.5),
      ),
      child: Container(
        constraints: const BoxConstraints(
          minHeight: LayoutGrid.halfModule * 11,
          minWidth: LayoutGrid.halfModule * 11,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: LayoutGrid.halfModule,
          horizontal: LayoutGrid.module,
        ),
        child: Icon(
          icon,
          size: LayoutGrid.halfModule * 7,
          color: tintColor,
        ),
      ),
    );
  }
}
