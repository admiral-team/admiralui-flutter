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
      true,
      ToastStyle.normal,
    );
    imageColor.set(
      theme.colors.elementAccent.color(),
      true,
      ToastStyle.normal,
    );
    backgroundColor.set(
      theme.colors.backgroundAdditionalOne.colorWithOpacity(),
      false,
      ToastStyle.normal,
    );
    imageColor.set(
      theme.colors.elementAccent.colorWithOpacity(),
      false,
      ToastStyle.normal,
    );

    // Additional
    backgroundColor.set(
      theme.colors.backgroundSelected.color(),
      true,
      ToastStyle.additional,
    );
    imageColor.set(
      theme.colors.elementAccent.color(),
      true,
      ToastStyle.additional,
    );
    backgroundColor.set(
      theme.colors.backgroundSelected.colorWithOpacity(),
      false,
      ToastStyle.additional,
    );
    imageColor.set(
      theme.colors.elementAccent.colorWithOpacity(),
      false,
      ToastStyle.additional,
    );

    // Attention
    backgroundColor.set(
      theme.colors.backgroundAttention.color(),
      true,
      ToastStyle.attention,
    );
    imageColor.set(
      theme.colors.elementAttention.color(),
      true,
      ToastStyle.attention,
    );
    backgroundColor.set(
      theme.colors.backgroundAttention.colorWithOpacity(),
      false,
      ToastStyle.attention,
    );
    imageColor.set(
      theme.colors.elementAttention.colorWithOpacity(),
      false,
      ToastStyle.attention,
    );

    // Success
    backgroundColor.set(
      theme.colors.backgroundSuccess.color(),
      true,
      ToastStyle.success,
    );
    imageColor.set(
      theme.colors.elementSuccess.color(),
      true,
      ToastStyle.success,
    );
    backgroundColor.set(
      theme.colors.backgroundSuccess.colorWithOpacity(),
      false,
      ToastStyle.success,
    );
    imageColor.set(
      theme.colors.elementSuccess.colorWithOpacity(),
      false,
      ToastStyle.success,
    );

    // Error
    backgroundColor.set(
      theme.colors.backgroundError.color(),
      true,
      ToastStyle.error,
    );
    imageColor.set(
      theme.colors.elementError.color(),
      true,
      ToastStyle.error,
    );
    backgroundColor.set(
      theme.colors.backgroundError.colorWithOpacity(),
      false,
      ToastStyle.error,
    );
    imageColor.set(
      theme.colors.elementError.colorWithOpacity(),
      false,
      ToastStyle.error,
    );

    textColor = theme.colors.textPrimary.color();
    disabledTextColor = theme.colors.textPrimary.colorWithOpacity();
    closeImageColor = theme.colors.elementPrimary.color();
    disabledCloseImageColor = theme.colors.elementPrimary.colorWithOpacity();

    linkControlScheme = LinkControlScheme(theme: theme);
  }

  AppTheme theme;
  late AFont titleFont;
  late Color textColor;
  late Color disabledTextColor;
  late Color closeImageColor;
  late Color disabledCloseImageColor;
  late LinkControlScheme linkControlScheme;
  ToastParameters<Color> backgroundColor = ToastParameters<Color>();
  ToastParameters<Color> imageColor = ToastParameters<Color>();
}
