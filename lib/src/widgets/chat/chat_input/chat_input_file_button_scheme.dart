import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class ChatInputFileButtonScheme {
  ChatInputFileButtonScheme({required this.theme}) {
    buttonColor.set(
      theme.colors.elementPrimary.colorWithOpacity(),
      ControlState.highlighted,
    );
    buttonColor.set(
      theme.colors.elementPrimary.color(),
      ControlState.normal,
    );

    buttonColor.set(
      theme.colors.elementPrimary.colorWithOpacity(),
      ControlState.selected,
    );
    buttonColor.set(
      theme.colors.elementPrimary.colorWithOpacity(),
      ControlState.disabled,
    );
  }

  AppTheme theme;
  ControlParameter<Color> buttonColor = ControlParameter<Color>();
}
