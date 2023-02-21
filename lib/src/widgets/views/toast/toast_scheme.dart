import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/src/widgets/views/toast/toast_parameter.dart';
import 'package:flutter/material.dart';

class ToastScheme {
  ToastScheme({
    required this.theme,
  }) {
    titleFont = theme.fonts.body2;

    // Normal
    backgroundColor.set(
      theme.colors.backgroundAdditionalOne.color(),
      ToastStyle.normal,
    );
    imageColor.set(
      theme.colors.elementAccent.color(),
      ToastStyle.normal,
    );

    // Attention
    backgroundColor.set(
      theme.colors.backgroundAttention.color(),
      ToastStyle.attention,
    );
    imageColor.set(
      theme.colors.elementAttention.color(),
      ToastStyle.attention,
    );

    // Success
    backgroundColor.set(
      theme.colors.backgroundSuccess.color(),
      ToastStyle.success,
    );
    imageColor.set(
      theme.colors.elementSuccess.color(),
      ToastStyle.success,
    );

    // Error
    backgroundColor.set(
      theme.colors.backgroundError.color(),
      ToastStyle.error,
    );
    imageColor.set(
      theme.colors.elementError.color(),
      ToastStyle.error,
    );

    textColor = theme.colors.textPrimary.color();
    closeImageColor = theme.colors.elementPrimary.color();

    linkControlScheme = LinkControlScheme(theme: theme);
  }

  AppTheme theme;
  late AFont titleFont;
  late Color textColor;
  late Color closeImageColor;
  late LinkControlScheme linkControlScheme;
  ToastParameters<Color> backgroundColor = ToastParameters<Color>();
  ToastParameters<Color> imageColor = ToastParameters<Color>();
}
