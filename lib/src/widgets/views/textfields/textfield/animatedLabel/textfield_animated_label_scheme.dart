import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/src/widgets/views/textfields/textfield/textfield_control_parameter.dart';
import 'package:flutter/material.dart';

class TextFieldAnimatedLabelScheme {
  TextFieldAnimatedLabelScheme({
    required this.theme,
  }) {
    focusedLabelFont = theme.fonts.subhead3;
    unfocucedLabelFont = theme.fonts.body1;

    textColor.set(
      theme.colors.elementAccent.color(),
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
      theme.colors.textSecondary.color(),
      TextInputState.readOnly,
    );
  }

  AppTheme theme;
  late AFont focusedLabelFont;
  late AFont unfocucedLabelFont;

  TextFieldControlParameter<Color> textColor =
      TextFieldControlParameter<Color>();
}
