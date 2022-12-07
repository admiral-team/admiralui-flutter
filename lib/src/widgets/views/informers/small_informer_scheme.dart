import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/src/widgets/views/informers/informer_parametr.dart';
import 'package:flutter/material.dart';

class SmallInformerScheme {
  SmallInformerScheme({
    required this.theme,
  }) {
    font = theme.fonts.body2;

    // Normal
    backgroundColor.set(
      theme.colors.backgroundAdditionalOne.color(),
      true,
      InformerStyle.normal,
    );
    backgroundColor.set(
      theme.colors.backgroundAdditionalOne.colorWithOpacity(),
      false,
      InformerStyle.normal,
    );

    // Attention
    backgroundColor.set(
      theme.colors.backgroundAttention.color(),
      true,
      InformerStyle.attention,
    );
    backgroundColor.set(
      theme.colors.backgroundAttention.colorWithOpacity(),
      false,
      InformerStyle.attention,
    );

    // Success
    backgroundColor.set(
      theme.colors.backgroundSuccess.color(),
      true,
      InformerStyle.success,
    );
    backgroundColor.set(
      theme.colors.backgroundSuccess.colorWithOpacity(),
      false,
      InformerStyle.success,
    );

    // Error
    backgroundColor.set(
      theme.colors.backgroundError.color(),
      true,
      InformerStyle.error,
    );
    backgroundColor.set(
      theme.colors.backgroundError.colorWithOpacity(),
      false,
      InformerStyle.error,
    );

    enabledTextColor = theme.colors.textPrimary.color();
    disabledTextColor = theme.colors.textPrimary.colorWithOpacity();
  }

  AppTheme theme;
  late AFont font;
  late Color enabledTextColor;
  late Color disabledTextColor;
  InformerParameters<Color> backgroundColor = InformerParameters<Color>();
}
