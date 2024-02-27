import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class IconTabItemScheme {
  IconTabItemScheme({
    required this.theme,
  }) {
    alfaColor.set(1, ControlState.normal);
    alfaColor.set(0.6, ControlState.disabled);
    circleColor.set(
      theme.colors.backgroundAdditionalOne.color(),
      ControlState.normal,
    );
    circleColor.set(
      theme.colors.backgroundAccent.color(),
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
      theme.colors.textAccent.color(),
      ControlState.selected,
    );

    iconColor.set(
      theme.colors.backgroundAccent.color(),
      ControlState.selected,
    );
    iconColor.set(
      theme.colors.textStaticWhite.color(),
      ControlState.normal,
    );
  }

  AppTheme theme;
  ControlParameter<double> alfaColor = ControlParameter<double>();
  ControlParameter<Color> circleColor = ControlParameter<Color>();
  ControlParameter<AFont> titleFont = ControlParameter<AFont>();
  ControlParameter<Color> titleColor = ControlParameter<Color>();
  ControlParameter<Color> iconColor = ControlParameter<Color>();
}
