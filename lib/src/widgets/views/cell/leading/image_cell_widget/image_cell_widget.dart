import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class ImageCellWidget extends StatelessWidget {
  const ImageCellWidget({
    super.key,
    required this.icon,
    this.isEnabled = true,
    this.scheme,
  });

  final IconData icon;
  final bool isEnabled;
  final ImageCellWidgetScheme? scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ImageCellWidgetScheme listScheme =
        scheme ?? ImageCellWidgetScheme(theme: theme);
    final Color tintColor =
        isEnabled ? listScheme.tintColor : listScheme.disabledTintColor;
    return Align(
      alignment: Alignment.centerLeft,
      child: Icon(
        icon,
        size: LayoutGrid.halfModule * 7,
        color: tintColor,
      ),
    );
  }
}
