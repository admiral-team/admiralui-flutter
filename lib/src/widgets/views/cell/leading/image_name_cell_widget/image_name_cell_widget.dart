import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class ImageNameCellWidget extends StatelessWidget {
  const ImageNameCellWidget({
    super.key,
    this.text,
    this.isEnabled = true,
    this.scheme,
  });

  final String? text;
  final bool isEnabled;
  final ImageNameCellWidgetScheme? scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ImageNameCellWidgetScheme listScheme =
        scheme ?? ImageNameCellWidgetScheme(theme: theme);
    final Color backgroundColor =
        isEnabled ? listScheme.backgroundColor 
        : listScheme.disabledBackgroundColor;
    final Color textColor =
        isEnabled ? listScheme.textColor 
        : listScheme.disabledTextColor;
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
          vertical: 14,
          horizontal: LayoutGrid.module,
        ),
        child: TextView(
          text ?? '',
          font: listScheme.font,
          textColorNormal: textColor,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
