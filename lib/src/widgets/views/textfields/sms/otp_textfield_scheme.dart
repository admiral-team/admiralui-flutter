import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class OTPTextFieldScheme {
  OTPTextFieldScheme({
    required this.theme,
  }) {
    placeholderColor = theme.colors.textSecondary.colorWithOpacity();

    textFieldFont = theme.fonts.title2;
    informerFont = theme.fonts.subhead3;
    placeholderFont = theme.fonts.title2;

    textColor.set(
      theme.colors.textPrimary.color(),
      TextInputState.normal,
    );
    textColor.set(
      theme.colors.textSecondary.colorWithOpacity(),
      TextInputState.disabled,
    );
    textColor.set(
      theme.colors.textError.color(),
      TextInputState.error,
    );
    textColor.set(
      theme.colors.textPrimary.color(),
      TextInputState.readOnly,
    );

    infomerLabelColor.set(
      theme.colors.textSecondary.color(),
      TextInputState.normal,
    );
    infomerLabelColor.set(
      theme.colors.textSecondary.colorWithOpacity(),
      TextInputState.disabled,
    );
    infomerLabelColor.set(
      theme.colors.textError.color(),
      TextInputState.error,
    );
    infomerLabelColor.set(
      theme.colors.textSecondary.color(),
      TextInputState.readOnly,
    );
  }

  AppTheme theme;
  late Color placeholderColor;

  late AFont informerFont;
  late AFont textFieldFont;
  late AFont placeholderFont;

  TextFieldControlParameter<Color> textColor =
      TextFieldControlParameter<Color>();
  TextFieldControlParameter<Color> infomerLabelColor =
      TextFieldControlParameter<Color>();
}
