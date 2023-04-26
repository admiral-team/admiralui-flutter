import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/theme/admiral_color.dart';
import 'package:flutter/material.dart';

class InformerTabItemScheme {
  InformerTabItemScheme({
    required this.theme,
  }) {
    backgroundColor = theme.colors.backgroundBasic;

    thubmColor.set(
      theme.colors.elementAccent.color(),
      ControlState.normal,
    );
    thubmColor.set(
      theme.colors.elementAccent.color(),
      ControlState.selected,
    );
    thubmColor.set(
      theme.colors.elementAccent.colorWithOpacity(),
      ControlState.disabled,
    );

    borderColor.set(
      theme.colors.elementAdditional.color(),
      ControlState.normal,
    );
    borderColor.set(
      theme.colors.elementAdditional.color(),
      ControlState.selected,
    );
    borderColor.set(
      theme.colors.elementAdditional.colorWithOpacity(),
      ControlState.disabled,
    );

    titleFont.set(
      theme.fonts.subtitle1,
      ControlState.normal,
    );
    titleFont.set(
      theme.fonts.subtitle1,
      ControlState.selected,
    );
    titleFont.set(
      theme.fonts.subtitle1,
      ControlState.disabled,
    );

    titleColor.set(
      theme.colors.textPrimary.color(),
      ControlState.normal,
    );
    titleColor.set(
      theme.colors.textPrimary.color(),
      ControlState.selected,
    );
    titleColor.set(
      theme.colors.textPrimary.colorWithOpacity(),
      ControlState.disabled,
    );

    subtitleColor.set(
      theme.colors.textSecondary.color(),
      ControlState.normal,
    );
    subtitleColor.set(
      theme.colors.textSecondary.color(),
      ControlState.selected,
    );
    subtitleColor.set(
      theme.colors.textSecondary.colorWithOpacity(),
      ControlState.disabled,
    );

    subtitleFont.set(
      theme.fonts.subhead4,
      ControlState.selected,
    );
    subtitleFont.set(
      theme.fonts.subhead4,
      ControlState.normal,
    );
    subtitleFont.set(
      theme.fonts.subhead4,
      ControlState.disabled,
    );
  }

  AppTheme theme;
  late AColor backgroundColor;
  ControlParameter<Color> borderColor = ControlParameter<Color>();
  ControlParameter<Color> thubmColor = ControlParameter<Color>();
  ControlParameter<Color> titleColor = ControlParameter<Color>();
  ControlParameter<AFont> titleFont = ControlParameter<AFont>();
  ControlParameter<Color> subtitleColor = ControlParameter<Color>();
  ControlParameter<AFont> subtitleFont = ControlParameter<AFont>();
}
