import 'package:admiralui_flutter/src/widgets/controls/control_parameter.dart';
import 'package:admiralui_flutter/theme/admiral_font.dart';
import 'package:admiralui_flutter/theme/app_theme.dart';
import 'package:flutter/material.dart';

class TwoTitleSecondaryButtonScheme {
  TwoTitleSecondaryButtonScheme({
    required this.theme,
  }) {
    font = theme.fonts.body1;

    final ControlParameter<Color> defaultButtonColor =
        ControlParameter<Color>();
    defaultButtonColor.set(
      theme.colors.backgroundAccent.color(),
      ControlState.normal,
    );
    defaultButtonColor.set(
      theme.colors.backgroundAccentPressed.color(),
      ControlState.highlighted,
    );
    defaultButtonColor.set(
      theme.colors.backgroundAccent.colorWithOpacity(),
      ControlState.disabled,
    );
    buttonColor = defaultButtonColor;
  }

  AppTheme theme;
  late ControlParameter<Color> buttonColor = ControlParameter<Color>();
  late AFont font;
}
