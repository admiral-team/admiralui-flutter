import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class SliderScheme {
  SliderScheme({
    required this.theme,
  }) {
    activeColor.set(
      theme.colors.backgroundAccent.color(), 
      true,
    );
    activeColor.set(
      theme.colors.backgroundAccent.colorWithOpacity(), 
      false,
    );

    inActiveColor.set(
      theme.colors.elementPrimary.color(), 
      true,
    );
    inActiveColor.set(
      theme.colors.elementPrimary.colorWithOpacity(), 
      false,
    );

    thumbColor.set(
      theme.colors.backgroundAccent.color(), 
      true,
    );
    thumbColor.set(
      theme.colors.backgroundAccent.colorWithOpacity(), 
      false,
    );

    tintColor.set(
      theme.colors.elementStaticWhite.color(), 
      true,
    );
    tintColor.set(
      theme.colors.elementStaticWhite.colorWithOpacity(), 
      false,
    );
  }

  AppTheme theme;
  SliderParameters<Color> activeColor = SliderParameters<Color>();
  SliderParameters<Color> inActiveColor = SliderParameters<Color>();
  SliderParameters<Color> thumbColor = SliderParameters<Color>();
  SliderParameters<Color> tintColor = SliderParameters<Color>();
}
