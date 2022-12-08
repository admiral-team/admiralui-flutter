import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class IconTabItemScheme {
  IconTabItemScheme({
    required this.theme,
  }) {
    circleColor.set(
      theme.colors.backgroundAdditionalOne.color(),
      ControlState.normal,
    );
    circleColor.set(
      theme.colors.backgroundAccent.colorWithOpacity(),
      ControlState.highlighted,
    );
    circleColor.set(
      theme.colors.backgroundAccent.colorWithOpacity(),
      ControlState.selected,
    );
    circleColor.set(
      theme.colors.backgroundAccent.colorWithOpacity(),
      ControlState.disabled,
    );

    titleFont.set(
      theme.fonts.subhead3,
      ControlState.normal,
    );
    titleFont.set(
      theme.fonts.subhead2,
      ControlState.highlighted,
    );
    titleFont.set(
      theme.fonts.subhead2,
      ControlState.selected,
    );
    titleFont.set(
      theme.fonts.subhead2,
      ControlState.disabled,
    );

    titleColor.set(
      theme.colors.textPrimary.color(),
      ControlState.normal,
    );
    titleColor.set(
      theme.colors.textAccent.colorWithOpacity(),
      ControlState.highlighted,
    );
    titleColor.set(
      theme.colors.textAccent.colorWithOpacity(),
      ControlState.selected,
    );
    titleColor.set(
      theme.colors.textAccent.colorWithOpacity(),
      ControlState.disabled,
    );

    iconColor.set(
      theme.colors.backgroundAccent.colorWithOpacity(),
      ControlState.highlighted,
    );
    iconColor.set(
      theme.colors.backgroundAccent.colorWithOpacity(),
      ControlState.selected,
    );
    iconColor.set(
      theme.colors.textStaticWhite.color(),
      ControlState.normal,
    );
    iconColor.set(
      theme.colors.textStaticWhite.colorWithOpacity(),
      ControlState.disabled,
    );
  }

  AppTheme theme;
  ControlParameter<Color> circleColor = ControlParameter<Color>();
  ControlParameter<AFont> titleFont = ControlParameter<AFont>();
  ControlParameter<Color> titleColor = ControlParameter<Color>();
  ControlParameter<Color> iconColor = ControlParameter<Color>();
}
