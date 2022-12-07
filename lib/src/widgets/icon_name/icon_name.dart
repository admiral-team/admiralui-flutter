import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:admiralui_flutter/src/widgets/icon_name/icon_name_scheme.dart';
import 'package:flutter/material.dart';

/// A graphical text widget widget witch contains only 2 letters with a
/// background colors.
class IconName extends StatelessWidget {
  const IconName(
    this.label, {
    super.key,
    this.isEnabled = true,
    this.scheme,
  }) : assert(label.length < 3);

  /// The text to display.
  ///
  /// The text can't be null and can contains at most 2 letters.
  final String label;
  final bool isEnabled;

  final IconNameScheme? scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    final IconNameScheme finalScheme = scheme ?? IconNameScheme(theme: theme);

    final Color color = finalScheme.backgroundColor.unsafeParameter(
      isEnabled ? ControlState.normal : ControlState.disabled,
    );

    return Container(
      width: LayoutGrid.halfModule * 11,
      height: LayoutGrid.halfModule * 11,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: TextView(
        label,
        isEnabled: isEnabled,
        font: fonts.subhead1,
        textColorNormal: colors.textStaticWhite.color(),
        textColorDisabled: colors.textStaticWhite.color(),
      ),
    );
  }
}
