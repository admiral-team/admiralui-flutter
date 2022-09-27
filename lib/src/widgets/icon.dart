import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';

/// A graphical icon widget drawn with a glyph from a font described in
/// an [AdmiralIconData] such as Admiral's predefined
/// [IconData]s in [AdmiralIcons].
///
/// This widget assumes that the rendered icon is squared. Non-squared icons may
/// render incorrectly.
class Icon extends StatelessWidget {
  const Icon(
    this.icon, {
    Key? key,
    this.size,
    this.isEnabled = true,
    this.iconColorEnabled,
    this.iconColorDisabled,
  }) : super(key: key);

  /// The icon to display. The available icons are described in [AdmiralIcons].
  ///
  /// The icon can be null, in which case the widget will render as an empty
  /// space of the specified [size].
  final AdmiralIconData? icon;

  /// The size of the icon in logical pixels.
  ///
  /// Icons occupy a square with width and height equal to size.
  final double? size;

  final bool isEnabled;

  final Color? iconColorEnabled;
  final Color? iconColorDisabled;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;

    final Color iconColor = isEnabled
        ? (iconColorEnabled ?? colors.elementAccent.color())
        : (iconColorDisabled ?? colors.elementAccent.colorWithOpacity());

    return cupertino.Icon(
      icon,
      size: size,
      color: iconColor,
    );
  }
}
