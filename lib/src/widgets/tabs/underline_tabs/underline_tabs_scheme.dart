import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class UnderlineTabsScheme {
  UnderlineTabsScheme({
    required this.theme,
  }) {
    backgroundColor = theme.colors.backgroundBasic.color();
    unselectedLabelFont = theme.fonts.subhead3;

    borderColor.set(
      theme.colors.elementAccent.color(),
      ControlState.normal,
    );

    borderColor.set(
      theme.colors.elementAccent.colorWithOpacity(),
      ControlState.disabled,
    );

    labelColor.set(
      theme.colors.textPrimary.color(),
      ControlState.normal,
    );

    labelColor.set(
      theme.colors.textSecondary.color(),
      ControlState.selected,
    );

    labelColor.set(
      theme.colors.textSecondary.colorWithOpacity(),
      ControlState.disabled,
    );

    labelFont.set(
      theme.fonts.body2,
      ControlState.normal,
    );

    labelFont.set(
      theme.fonts.body1,
      ControlState.selected,
    );

    labelFont.set(
      theme.fonts.body1,
      ControlState.disabled,
    );
  }

  AppTheme theme;
  late Color backgroundColor;
  late AFont unselectedLabelFont;

  ControlParameter<AFont> labelFont = ControlParameter<AFont>();
  ControlParameter<Color> borderColor = ControlParameter<Color>();
  ControlParameter<Color> labelColor = ControlParameter<Color>();
}
