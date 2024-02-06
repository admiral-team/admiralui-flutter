import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/theme/admiral_color.dart';
import 'package:flutter/material.dart';

class ChatInputButtonScheme {
  ChatInputButtonScheme({required this.theme}) {
    sendButtonColor = theme.colors.elementStaticWhite;

    buttonColor.set(
      theme.colors.backgroundAccent.color(),
      ControlState.highlighted,
    );
    buttonColor.set(
      theme.colors.backgroundAccent.color(),
      ControlState.normal,
    );

    buttonColor.set(
      theme.colors.backgroundAccentPressed.color(),
      ControlState.selected,
    );
    buttonColor.set(
      theme.colors.backgroundAccentPressed.colorWithOpacity(),
      ControlState.disabled,
    );
  }

  AppTheme theme;
  late AColor sendButtonColor;
  ControlParameter<Color> buttonColor = ControlParameter<Color>();
}
