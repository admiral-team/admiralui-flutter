import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/src/widgets/chat/text_operation/text_operation_parameter.dart';
import 'package:admiralui_flutter/theme/admiral_color.dart';
import 'package:flutter/material.dart';

class TextOperationScheme {
  TextOperationScheme({required this.theme}) {
    descriptionColor = theme.colors.textPrimary;
    timeColor = theme.colors.textSecondary;

    titleFont = theme.fonts.subhead1;
    descriptionFont = theme.fonts.subhead3;
    timeFont = theme.fonts.caption1;

    // Background color
    // Default
    backgroundColor.set(
      theme.colors.backgroundAdditionalOne.color(),
      ControlState.normal,
      TextOperationStyle.initial,
    );
    backgroundColor.set(
      theme.colors.backgroundAdditionalOne.colorWithOpacity(),
      ControlState.disabled,
      TextOperationStyle.initial,
    );

    // Success
    backgroundColor.set(
      theme.colors.backgroundSuccess.color(),
      ControlState.normal,
      TextOperationStyle.success,
    );
    backgroundColor.set(
      theme.colors.backgroundSuccess.colorWithOpacity(),
      ControlState.disabled,
      TextOperationStyle.success,
    );

    // Error
    backgroundColor.set(
      theme.colors.backgroundError.color(),
      ControlState.normal,
      TextOperationStyle.error,
    );
    backgroundColor.set(
      theme.colors.backgroundError.colorWithOpacity(),
      ControlState.disabled,
      TextOperationStyle.error,
    );

    // Title color
    // Default
    titleColor.set(
      theme.colors.textPrimary.color(),
      ControlState.normal,
      TextOperationStyle.initial,
    );
    titleColor.set(
      theme.colors.textPrimary.colorWithOpacity(),
      ControlState.disabled,
      TextOperationStyle.initial,
    );

    // Success
    titleColor.set(
      theme.colors.textSuccess.color(),
      ControlState.normal,
      TextOperationStyle.success,
    );
    titleColor.set(
      theme.colors.textSuccess.colorWithOpacity(),
      ControlState.disabled,
      TextOperationStyle.success,
    );

    // Error
    titleColor.set(
      theme.colors.textError.color(),
      ControlState.normal,
      TextOperationStyle.error,
    );
    titleColor.set(
      theme.colors.textError.colorWithOpacity(),
      ControlState.disabled,
      TextOperationStyle.error,
    );
  }

  AppTheme theme;
  late AColor descriptionColor;
  late AColor timeColor;
  late AFont titleFont;
  late AFont descriptionFont;
  late AFont timeFont;

  TextOperationParameters<Color> backgroundColor =
      TextOperationParameters<Color>();
  TextOperationParameters<Color> titleColor = TextOperationParameters<Color>();
}
