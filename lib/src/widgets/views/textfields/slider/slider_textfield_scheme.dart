import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/theme/admiral_color.dart';
import 'package:flutter/material.dart';

class InputRangeTextFieldScheme {
  InputRangeTextFieldScheme({
    required this.theme,
  }) {
    textFieldScheme = TextFieldScheme(theme: theme);
    sliderScheme = SliderScheme(theme: theme);

    valueFont = theme.fonts.subhead3;
    labelFont = theme.fonts.subhead3;
    leadingTextFont = theme.fonts.body1;
    fromToTextFont = theme.fonts.body1;
    iconColor = theme.colors.elementPrimary;

    labelTextColor.set(
      theme.colors.elementAccent.color(),
      TextInputState.normal,
    );
    labelTextColor.set(
      theme.colors.textSecondary.colorWithOpacity(),
      TextInputState.disabled,
    );
    labelTextColor.set(
      theme.colors.textError.color(),
      TextInputState.error,
    );
    labelTextColor.set(
      theme.colors.textSecondary.color(),
      TextInputState.readOnly,
    );

    valueTextColor.set(
      theme.colors.textSecondary.color(),
      TextInputState.normal,
    );
    valueTextColor.set(
      theme.colors.textSecondary.colorWithOpacity(),
      TextInputState.disabled,
    );
    valueTextColor.set(
      theme.colors.textSecondary.color(),
      TextInputState.error,
    );
    valueTextColor.set(
      theme.colors.textSecondary.color(),
      TextInputState.readOnly,
    );

    leadingTextColor.set(
      theme.colors.textPrimary.color(),
      TextInputState.normal,
    );
    leadingTextColor.set(
      theme.colors.textPrimary.colorWithOpacity(),
      TextInputState.disabled,
    );
    leadingTextColor.set(
      theme.colors.textPrimary.color(),
      TextInputState.error,
    );
    leadingTextColor.set(
      theme.colors.textPrimary.color(),
      TextInputState.readOnly,
    );

    textColor.set(
      theme.colors.textPrimary.color(),
      TextInputState.normal,
    );
    textColor.set(
      theme.colors.textSecondary.colorWithOpacity(),
      TextInputState.disabled,
    );
    textColor.set(
      theme.colors.textPrimary.color(),
      TextInputState.error,
    );
    textColor.set(
      theme.colors.textPrimary.color(),
      TextInputState.readOnly,
    );
  }

  AppTheme theme;

  late TextFieldScheme textFieldScheme;
  late SliderScheme sliderScheme;
  late AFont labelFont;
  late AFont valueFont;
  late AFont leadingTextFont;
  late AFont fromToTextFont;
  late AColor iconColor;
  TextFieldControlParameter<Color> textColor =
      TextFieldControlParameter<Color>();
  TextFieldControlParameter<Color> labelTextColor =
      TextFieldControlParameter<Color>();
  TextFieldControlParameter<Color> valueTextColor =
      TextFieldControlParameter<Color>();
  TextFieldControlParameter<Color> leadingTextColor =
      TextFieldControlParameter<Color>();
}
