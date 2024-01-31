import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class InputNumberTextfieldScheme {
  InputNumberTextfieldScheme({
    required this.theme,
  }) {
    leftButtonScheme = InputNumberTextfieldButtonScheme(theme: theme);
    rightButtonScheme = InputNumberTextfieldButtonScheme(theme: theme);
    font = theme.fonts.body1;
    textFieldScheme = TextFieldScheme(theme: theme);

    textFieldBackground.set(
      theme.colors.backgroundAdditionalOne.color(),
      TextInputState.normal,
    );
    textFieldBackground.set(
      theme.colors.backgroundAdditionalOne.colorWithOpacity(),
      TextInputState.disabled,
    );
    textFieldBackground.set(
      theme.colors.backgroundAdditionalOnePressed.color(),
      TextInputState.error,
    );
    textFieldBackground.set(
      theme.colors.backgroundAdditionalOnePressed.color(),
      TextInputState.readOnly,
    );

    inputTextColor.set(
      theme.colors.textPrimary.color(),
      ControlState.normal,
    );
    inputTextColor.set(
      theme.colors.textPrimary.colorWithOpacity(),
      ControlState.disabled,
    );
  }

  AppTheme theme;

  late TextFieldScheme textFieldScheme;
  late InputNumberTextfieldButtonScheme leftButtonScheme;
  late InputNumberTextfieldButtonScheme rightButtonScheme;
  late AFont font;
  ControlParameter<Color> inputTextColor = ControlParameter<Color>();
  TextFieldControlParameter<Color> textFieldBackground =
      TextFieldControlParameter<Color>();
}
