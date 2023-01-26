import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class CircularPageControlScheme {
  CircularPageControlScheme({
    required this.theme,
  }) {
    backgroundColor.set(
      theme.colors.backgroundAccent.color(),
      false,
      CirclePageSliderStyle.initial,
    );

    backgroundColor.set(
      theme.colors.backgroundAdditionalOne.color(),
      false,
      CirclePageSliderStyle.additional,
    );

    backgroundColor.set(
      theme.colors.backgroundAccent.colorWithOpacity(),
      true,
      CirclePageSliderStyle.initial,
    );

    backgroundColor.set(
      theme.colors.backgroundAdditionalOne.colorWithOpacity(),
      true,
      CirclePageSliderStyle.additional,
    );

    imageTintColor.set(
      theme.colors.textStaticWhite.color(),
      false,
      CirclePageSliderStyle.initial,
    );

    imageTintColor.set(
      theme.colors.backgroundAdditionalOne.color(),
      false,
      CirclePageSliderStyle.additional,
    );

    imageTintColor.set(
      theme.colors.backgroundAdditionalOne.colorWithOpacity(),
      true,
      CirclePageSliderStyle.initial,
    );

    imageTintColor.set(
      theme.colors.elementAccent.colorWithOpacity(),
      true,
      CirclePageSliderStyle.additional,
    );
  }

  AppTheme theme;
  late CircularPageControlParameters<Color> backgroundColor =
      CircularPageControlParameters<Color>();
  late CircularPageControlParameters<Color> imageTintColor =
      CircularPageControlParameters<Color>();
}
