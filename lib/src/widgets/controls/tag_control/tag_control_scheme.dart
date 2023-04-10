import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/src/widgets/controls/tag_control/tag_parameters.dart';
import 'package:flutter/material.dart';

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
    backgroundColor.set(
      Colors.transparent, 
      ControlState.disabled,
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
    backgroundColor.set(
      theme.colors.backgroundSelected.colorWithOpacity(), 
      ControlState.disabled,
      TagStyle.normal,
    );
    tintColor.set(
      theme.colors.elementAccent.color(), 
      ControlState.normal,
      TagStyle.normal,
    );
    tintColor.set(
      theme.colors.elementAccent.colorWithOpacity(), 
      ControlState.selected,
      TagStyle.normal,
    );
    tintColor.set(
      theme.colors.elementAccent.colorWithOpacity(), 
      ControlState.highlighted,
      TagStyle.normal,
    );
    tintColor.set(
      theme.colors.elementAccent.colorWithOpacity(), 
      ControlState.disabled,
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
    backgroundColor.set(
      theme.colors.backgroundAdditionalOne.colorWithOpacity(), 
      ControlState.disabled,
      TagStyle.additional,
    );

    tintColor.set(
      theme.colors.elementSecondary.color(), 
      ControlState.normal,
      TagStyle.additional,
    );
    tintColor.set(
      theme.colors.elementSecondary.colorWithOpacity(), 
      ControlState.selected,
      TagStyle.additional,
    );
    tintColor.set(
      theme.colors.elementSecondary.colorWithOpacity(), 
      ControlState.highlighted,
      TagStyle.additional,
    );
    tintColor.set(
      theme.colors.elementSecondary.colorWithOpacity(), 
      ControlState.disabled,
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
    backgroundColor.set(
      theme.colors.backgroundSuccess.colorWithOpacity(), 
      ControlState.disabled,
      TagStyle.success,
    );
    tintColor.set(
      theme.colors.elementSuccess.color(), 
      ControlState.normal,
      TagStyle.success,
    );
    tintColor.set(
      theme.colors.elementSuccessPressed.color(), 
      ControlState.selected,
      TagStyle.success,
    );
    tintColor.set(
      theme.colors.elementSuccessPressed.color(), 
      ControlState.highlighted,
      TagStyle.success,
    );
    tintColor.set(
      theme.colors.elementSuccess.colorWithOpacity(), 
      ControlState.disabled,
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
    backgroundColor.set(
      theme.colors.backgroundError.colorWithOpacity(), 
      ControlState.disabled,
      TagStyle.error,
    );
    tintColor.set(
      theme.colors.elementError.color(), 
      ControlState.normal,
      TagStyle.error,
    );
    tintColor.set(
      theme.colors.elementErrorPressed.color(), 
      ControlState.selected,
      TagStyle.error,
    );
    tintColor.set(
      theme.colors.elementErrorPressed.color(), 
      ControlState.highlighted,
      TagStyle.error,
    );
    tintColor.set(
      theme.colors.elementError.colorWithOpacity(), 
      ControlState.disabled,
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
    backgroundColor.set(
      theme.colors.backgroundAttention.colorWithOpacity(), 
      ControlState.disabled,
      TagStyle.attention,
    );
    tintColor.set(
      theme.colors.elementAttention.color(), 
      ControlState.normal,
      TagStyle.attention,
    );
    tintColor.set(
      theme.colors.elementAttentionPressed.color(), 
      ControlState.selected,
      TagStyle.attention,
    );
    tintColor.set(
      theme.colors.elementAttentionPressed.color(), 
      ControlState.highlighted,
      TagStyle.attention,
    );
    tintColor.set(
      theme.colors.elementAttention.colorWithOpacity(), 
      ControlState.disabled,
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
  TagParameters<Color> tintColor = TagParameters<Color>();
  TagParameters<Color> backgroundColor = TagParameters<Color>();
}
