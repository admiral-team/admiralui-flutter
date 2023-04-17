import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/src/widgets/views/toast/toast_parameter.dart';
import 'package:flutter/material.dart';

class ActionToastScheme {
  ActionToastScheme({
    required this.theme,
  }) {
    titleFont = theme.fonts.body2;

    // Normal
    backgroundColor.set(
      theme.colors.backgroundAdditionalOne.color(),
      true,
      ToastStyle.normal,
    );
    backgroundColor.set(
      theme.colors.backgroundAdditionalOne.colorWithOpacity(),
      false,
      ToastStyle.normal,
    );

    // Attention
    backgroundColor.set(
      theme.colors.backgroundAttention.color(),
      true,
      ToastStyle.attention,
    );
    backgroundColor.set(
      theme.colors.backgroundAttention.colorWithOpacity(),
      false,
      ToastStyle.attention,
    );

    // Success
    backgroundColor.set(
      theme.colors.backgroundSuccess.color(),
      true,
      ToastStyle.success,
    );
    backgroundColor.set(
      theme.colors.backgroundSuccess.colorWithOpacity(),
      false,
      ToastStyle.success,
    );

    // Error
    backgroundColor.set(
      theme.colors.backgroundError.color(),
      true,
      ToastStyle.error,
    );
    backgroundColor.set(
      theme.colors.backgroundError.colorWithOpacity(),
      false,
      ToastStyle.error,
    );

    textColor = theme.colors.textPrimary.color();
    disabledTextColor = theme.colors.textPrimary.colorWithOpacity();
    linkControlScheme = LinkControlScheme(theme: theme);

    timerTextColor = theme.colors.textAccent.color();
    timerColor = theme.colors.elementAccent.color();
    timerFont = theme.fonts.subhead3;
  }

  AppTheme theme;
  late AFont titleFont;
  late Color textColor;
  late Color disabledTextColor;

  late Color timerTextColor;
  late AFont timerFont;
  late Color timerColor;

  late LinkControlScheme linkControlScheme;
  ToastParameters<Color> backgroundColor = ToastParameters<Color>();
}
