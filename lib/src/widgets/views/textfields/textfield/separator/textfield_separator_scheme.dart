import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class TextFieldSeparatorScheme {
  TextFieldSeparatorScheme({
    required this.theme,
  }) {
    lineColor.set(
      theme.colors.elementAccent.color(),
      TextInputState.normal,
    );
    lineColor.set(
      theme.colors.textSecondary.colorWithOpacity(),
      TextInputState.disabled,
    );
    lineColor.set(
      theme.colors.textError.color(),
      TextInputState.error,
    );
    lineColor.set(
      theme.colors.textSecondary.color(),
      TextInputState.readOnly,
    );
  }

  AppTheme theme;
  TextFieldControlParameter<Color> lineColor =
      TextFieldControlParameter<Color>();
}
