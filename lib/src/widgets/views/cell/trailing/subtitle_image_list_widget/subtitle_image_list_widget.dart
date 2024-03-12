import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// A widget that displays a subtitle with an optional image icon.
///
/// This widget is designed for use in cells or list items, providing a simple
/// layout with a subtitle text and an optional image icon. It supports
/// customization of appearance and enables or disables interaction based on
/// the provided parameters.
///
/// Constructor:
/// ```
/// SubtitleImageCellWidget({
///   Key? key,
///   String? subtitle,
///   IconData? imageWidget,
///   bool isEnabled = true,
///   SubtitleImageCellWidgetScheme? scheme,
/// })
/// ```
///
/// Parameters:
/// - `subtitle`: The text to display as the subtitle.
/// Defaults to an empty string.
/// - `imageWidget`: The icon to display alongside the subtitle.
/// Defaults to `null`.
/// - `isEnabled`: A boolean indicating whether the widget
/// is enabled or disabled.
///   Defaults to `true`.
/// - `scheme`: An optional `SubtitleImageCellWidgetScheme` object that defines
///   the appearance of the widget.
///
/// Example usage:
/// ```dart
/// SubtitleImageCellWidget(
///   subtitle: 'This is a subtitle',
///   imageWidget: Icons.star,
///   isEnabled: true,
/// )
/// ```
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
