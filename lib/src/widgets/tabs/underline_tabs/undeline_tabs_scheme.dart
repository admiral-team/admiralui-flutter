import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/theme/app_theme.dart';
import 'package:flutter/material.dart';

class UnderlineTabsScheme {
  UnderlineTabsScheme({
    required this.theme,
  }) {
    backgroundColor = theme.colors.backgroundBasic.color();

    labelFont = theme.fonts.subhead2;
    unselectedLabelFont = theme.fonts.subhead3;

    borderColor.set(
      theme.colors.elementAccent.color(),
      ControlState.normal,
    );

    borderColor.set(
      theme.colors.elementAccent.color().withOpacity(0.6),
      ControlState.disabled,
    );

    labelColor.set(
      theme.colors.textPrimary.color(),
      ControlState.normal,
    );

    labelColor.set(
      theme.colors.textSecondary.color(),
      ControlState.disabled,
    );
  }

  AppTheme theme;
  late Color backgroundColor;

  late AFont labelFont;
  late AFont unselectedLabelFont;

  ControlParameter<Color> borderColor = ControlParameter<Color>();
  ControlParameter<Color> labelColor = ControlParameter<Color>();
}
