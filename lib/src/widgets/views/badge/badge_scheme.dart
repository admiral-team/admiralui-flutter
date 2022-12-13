import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/src/widgets/views/badge/badge_parameter.dart';
import 'package:flutter/material.dart';

class BadgeScheme {
  BadgeScheme({
    required this.theme,
  }) {
    font = theme.fonts.caption2;

    // Normal
    backgroundColor.set(
      theme.colors.backgroundAccent.color(),
      ControlState.normal,
      BadgeStyle.normal,
    );
    backgroundColor.set(
      theme.colors.backgroundAdditionalTwo.colorWithOpacity(),
      ControlState.disabled,
      BadgeStyle.normal,
    );

    // Additional
    backgroundColor.set(
      theme.colors.elementPrimary.color(),
      ControlState.normal,
      BadgeStyle.additional,
    );
    backgroundColor.set(
      theme.colors.backgroundAdditionalTwo.colorWithOpacity(),
      ControlState.disabled,
      BadgeStyle.additional,
    );

    // Success
    backgroundColor.set(
      theme.colors.elementSuccess.color(),
      ControlState.normal,
      BadgeStyle.success,
    );
    backgroundColor.set(
      theme.colors.backgroundAdditionalTwo.colorWithOpacity(),
      ControlState.disabled,
      BadgeStyle.success,
    );

    // Error
    backgroundColor.set(
      theme.colors.elementError.color(),
      ControlState.normal,
      BadgeStyle.error,
    );
    backgroundColor.set(
      theme.colors.backgroundAdditionalTwo.colorWithOpacity(),
      ControlState.disabled,
      BadgeStyle.error,
    );

    // Attention
    backgroundColor.set(
      theme.colors.elementAttention.color(),
      ControlState.normal,
      BadgeStyle.attention,
    );
    backgroundColor.set(
      theme.colors.backgroundAdditionalTwo.colorWithOpacity(),
      ControlState.disabled,
      BadgeStyle.attention,
    );

    // Natural
    backgroundColor.set(
      theme.colors.elementSecondary.color(),
      ControlState.normal,
      BadgeStyle.natural,
    );
    backgroundColor.set(
      theme.colors.backgroundAdditionalTwo.colorWithOpacity(),
      ControlState.disabled,
      BadgeStyle.natural,
    );

    // Clear
    backgroundColor.set(
      Colors.transparent,
      ControlState.normal,
      BadgeStyle.clear,
    );
    backgroundColor.set(
      Colors.transparent,
      ControlState.disabled,
      BadgeStyle.clear,
    );

    textColor.set(
      theme.colors.textStaticWhite.color(),
      ControlState.normal,
    );
    textColor.set(
      theme.colors.textSecondary.color(),
      ControlState.disabled,
    );

    borderColor = theme.colors.backgroundBasic.color();
  }

  AppTheme theme;
  late AFont font;
  late Color borderColor;
  ControlParameter<Color> textColor = ControlParameter<Color>();
  BadgeParameters<Color> tintColor = BadgeParameters<Color>();
  BadgeParameters<Color> backgroundColor = BadgeParameters<Color>();
}
