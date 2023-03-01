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
      ToastStyle.normal,
    );

    // Attention
    backgroundColor.set(
      theme.colors.backgroundAttention.color(),
      ToastStyle.attention,
    );

    // Success
    backgroundColor.set(
      theme.colors.backgroundSuccess.color(),
      ToastStyle.success,
    );

    // Error
    backgroundColor.set(
      theme.colors.backgroundError.color(),
      ToastStyle.error,
    );

    textColor = theme.colors.textPrimary.color();
    linkControlScheme = LinkControlScheme(theme: theme);

    timerTextColor = theme.colors.textAccent.color();
    timerColor = theme.colors.elementAccent.color();
    timerFont = theme.fonts.subhead3;
  }

  AppTheme theme;
  late AFont titleFont;
  late Color textColor;

  late Color timerTextColor;
  late AFont timerFont;
  late Color timerColor;

  late LinkControlScheme linkControlScheme;
  ToastParameters<Color> backgroundColor = ToastParameters<Color>();
}
