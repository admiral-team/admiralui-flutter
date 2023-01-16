import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class ImageSubtitleCellWidget extends StatelessWidget {
  const ImageSubtitleCellWidget({
    super.key,
    this.subtitle,
    this.imageWidget,
    this.isEnabled = true,
    this.scheme,
  });

  final String? subtitle;
  final Image? imageWidget;
  final bool isEnabled;
  final ImageSubtitleCellWidgetScheme? scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ImageSubtitleCellWidgetScheme listScheme =
        scheme ?? ImageSubtitleCellWidgetScheme(theme: theme);
    final Color textColor =
        isEnabled ? listScheme.textColor : listScheme.disabledTextColor;

    List<Widget> children;
    children = <Widget>[];

    if (imageWidget != null) {
      children.add(
        imageWidget!,
      );
    }

    if (subtitle != null) {
      if (imageWidget != null) {
        children.add(
          const SizedBox(
            width: LayoutGrid.module,
          ),
        );
      }
      children.add(
        TextView(
          subtitle ?? '',
          font: listScheme.font,
          textColorNormal: textColor,
          textAlign: TextAlign.right,
        ),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: children,
    );
  }
}
