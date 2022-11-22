import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class SwitcherScheme {
  SwitcherScheme({
    required this.theme,
  }) {
    trackColor.set(
      theme.colors.elementPrimary.color(),
      ControlState.normal,
    );
    trackColor.set(
      theme.colors.elementPrimary.colorWithOpacity(),
      ControlState.disabled,
    );

    activeTrackColor.set(
      theme.colors.elementAccent.color(),
      ControlState.normal,
    );
    activeTrackColor.set(
      theme.colors.elementAccent.colorWithOpacity(),
      ControlState.disabled,
    );

    thumbColor.set(
      theme.colors.elementStaticWhite.color(),
      ControlState.normal,
    );
    thumbColor.set(
      theme.colors.elementStaticWhite.color(),
      ControlState.disabled,
    );
  }

  AppTheme theme;
  ControlParameter<Color> trackColor = ControlParameter<Color>();
  ControlParameter<Color> thumbColor = ControlParameter<Color>();
  ControlParameter<Color> activeTrackColor = ControlParameter<Color>();
}
