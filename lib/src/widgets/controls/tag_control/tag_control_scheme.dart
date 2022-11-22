import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/src/widgets/controls/tag_control/tag_style.dart';
import 'package:flutter/material.dart';
import 'package:admiralui_flutter/src/widgets/controls/tag_control/tag_parameters.dart';

class TagControlScheme {
  TagControlScheme({
    required this.theme,
  }) {
    font = theme.fonts.body1;

    // None
    backgroundColor.set(
      Colors.transparent, 
      ControlState.normal,
      TagStyle.none,
    );
    backgroundColor.set(
      Colors.transparent, 
      ControlState.selected,
      TagStyle.none,
    );
    backgroundColor.set(
      Colors.transparent, 
      ControlState.highlighted,
      TagStyle.none,
    );

    // Normal
    backgroundColor.set(
      theme.colors.backgroundSelected.color(), 
      ControlState.normal,
      TagStyle.normal,
    );
    backgroundColor.set(
      theme.colors.backgroundSelectedPressed.color(), 
      ControlState.selected,
      TagStyle.normal,
    );
    backgroundColor.set(
      theme.colors.backgroundSelectedPressed.color(), 
      ControlState.highlighted,
      TagStyle.normal,
    );

    // Additional
    backgroundColor.set(
      theme.colors.backgroundAdditionalOne.color(), 
      ControlState.normal,
      TagStyle.additional,
    );
    backgroundColor.set(
      theme.colors.elementPrimary.colorWithOpacity(), 
      ControlState.selected,
      TagStyle.additional,
    );
    backgroundColor.set(
      theme.colors.elementPrimary.colorWithOpacity(), 
      ControlState.highlighted,
      TagStyle.additional,
    );

    // Success
    backgroundColor.set(
      theme.colors.backgroundSuccess.color(), 
      ControlState.normal,
      TagStyle.success,
    );
    backgroundColor.set(
      theme.colors.backgroundSuccessPressed.colorWithOpacity(), 
      ControlState.selected,
      TagStyle.success,
    );
    backgroundColor.set(
      theme.colors.backgroundSuccessPressed.colorWithOpacity(), 
      ControlState.highlighted,
      TagStyle.success,
    );

    // Error
    backgroundColor.set(
      theme.colors.backgroundError.color(), 
      ControlState.normal,
      TagStyle.error,
    );
    backgroundColor.set(
      theme.colors.backgroundErrorPressed.colorWithOpacity(), 
      ControlState.selected,
      TagStyle.error,
    );
    backgroundColor.set(
      theme.colors.backgroundErrorPressed.colorWithOpacity(), 
      ControlState.highlighted,
      TagStyle.error,
    );

    // Attention
    backgroundColor.set(
      theme.colors.backgroundAttention.color(), 
      ControlState.normal,
      TagStyle.attention,
    );
    backgroundColor.set(
      theme.colors.backgroundAttentionPressed.colorWithOpacity(), 
      ControlState.selected,
      TagStyle.attention,
    );
    backgroundColor.set(
      theme.colors.backgroundAttentionPressed.colorWithOpacity(), 
      ControlState.highlighted,
      TagStyle.attention,
    );

    textColor.set(
      theme.colors.textPrimary.color(),
      ControlState.normal,
    );
    textColor.set(
      theme.colors.textPrimary.colorWithOpacity(),
      ControlState.disabled,
    );
  }

  AppTheme theme;
  late AFont font;
  ControlParameter<Color> textColor = ControlParameter<Color>();
  TagParameters<Color> backgroundColor = TagParameters<Color>();
}
