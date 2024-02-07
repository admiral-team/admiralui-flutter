import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/theme/admiral_color.dart';
import 'package:flutter/material.dart';

class ChatInputScheme {
  ChatInputScheme({required this.theme}) {
    textColor = theme.colors.textPrimary;
    tintColor = theme.colors.elementAccent;

    textFont = theme.fonts.body2;
    placeholderFont = theme.fonts.body2;

    fileButtonImageColor.set(
      theme.colors.elementPrimary.colorWithOpacity(),
      ControlState.disabled,
    );
    fileButtonImageColor.set(
      theme.colors.elementPrimary.colorWithOpacity(),
      ControlState.normal,
    );

    placeHolderColor.set(
      theme.colors.textSecondary.colorWithOpacity(),
      ControlState.disabled,
    );
    placeHolderColor.set(
      theme.colors.textSecondary.color(),
      ControlState.normal,
    );

    backgroundColor.set(
      theme.colors.backgroundAdditionalOne.colorWithOpacity(),
      ControlState.disabled,
    );
    backgroundColor.set(
      theme.colors.backgroundAdditionalOne.color(),
      ControlState.normal,
    );

    backgroundColor.set(
      theme.colors.backgroundAdditionalOne.color(),
      ControlState.selected,
    );
    backgroundColor.set(
      theme.colors.backgroundSuccess.colorWithOpacity(),
      ControlState.highlighted,
    );
  }

  AppTheme theme;
  late AColor textColor;
  late AColor tintColor;

  late AFont textFont;
  late AFont placeholderFont;

  ControlParameter<Color> fileButtonImageColor = ControlParameter<Color>();
  ControlParameter<Color> placeHolderColor = ControlParameter<Color>();
  ControlParameter<Color> backgroundColor = ControlParameter<Color>();
}
