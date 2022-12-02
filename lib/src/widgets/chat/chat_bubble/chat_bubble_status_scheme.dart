import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/src/widgets/chat/chat_bubble/chat_bubble_status_parameters.dart';
import 'package:admiralui_flutter/src/widgets/chat/chat_bubble/chat_bubble_status_style.dart';
import 'package:admiralui_flutter/src/widgets/chat/chat_direction.dart';
import 'package:admiralui_flutter/src/widgets/chat/chat_status.dart';
import 'package:admiralui_flutter/theme/admiral_color.dart';
import 'package:flutter/material.dart';

class ChatBubbleStatusScheme {
  ChatBubbleStatusScheme({required this.theme}) {
    textFont = theme.fonts.caption1;

    /// Direction-right style-initial state-normal
    textColor.set(
      theme.colors.textAccentAdditional.color(),
      ControlState.normal,
      ChatBubbleStatusStyle.initial,
      ChatDirection.right,
      ChatStatus.loading,
    );

    textColor.set(
      theme.colors.textAccentAdditional.color(),
      ControlState.normal,
      ChatBubbleStatusStyle.initial,
      ChatDirection.right,
      ChatStatus.error,
    );

    textColor.set(
      theme.colors.textAccentAdditional.color(),
      ControlState.normal,
      ChatBubbleStatusStyle.initial,
      ChatDirection.right,
      ChatStatus.sent,
    );

    textColor.set(
      theme.colors.textAccentAdditional.color(),
      ControlState.normal,
      ChatBubbleStatusStyle.initial,
      ChatDirection.right,
      ChatStatus.receive,
    );

    textColor.set(
      theme.colors.textAccentAdditional.color(),
      ControlState.normal,
      ChatBubbleStatusStyle.initial,
      ChatDirection.right,
      ChatStatus.read,
    );

    textColor.set(
      theme.colors.textAccentAdditional.color(),
      ControlState.normal,
      ChatBubbleStatusStyle.initial,
      ChatDirection.right,
      ChatStatus.none,
    );

    /// Direction-right style-initial state-disabled
    textColor.set(
      theme.colors.textAccentAdditional.colorWithOpacity(),
      ControlState.disabled,
      ChatBubbleStatusStyle.initial,
      ChatDirection.right,
      ChatStatus.loading,
    );

    textColor.set(
      theme.colors.textAccentAdditional.colorWithOpacity(),
      ControlState.disabled,
      ChatBubbleStatusStyle.initial,
      ChatDirection.right,
      ChatStatus.error,
    );

    textColor.set(
      theme.colors.textAccentAdditional.colorWithOpacity(),
      ControlState.disabled,
      ChatBubbleStatusStyle.initial,
      ChatDirection.right,
      ChatStatus.sent,
    );

    textColor.set(
      theme.colors.textAccentAdditional.colorWithOpacity(),
      ControlState.disabled,
      ChatBubbleStatusStyle.initial,
      ChatDirection.right,
      ChatStatus.receive,
    );

    textColor.set(
      theme.colors.textAccentAdditional.colorWithOpacity(),
      ControlState.disabled,
      ChatBubbleStatusStyle.initial,
      ChatDirection.right,
      ChatStatus.read,
    );

    textColor.set(
      theme.colors.textAccentAdditional.colorWithOpacity(),
      ControlState.disabled,
      ChatBubbleStatusStyle.initial,
      ChatDirection.right,
      ChatStatus.none,
    );

    /// Direction-right style-light state-normal
    textColor.set(
      theme.colors.textSecondary.color(),
      ControlState.normal,
      ChatBubbleStatusStyle.light,
      ChatDirection.right,
      ChatStatus.loading,
    );

    textColor.set(
      theme.colors.textSecondary.color(),
      ControlState.normal,
      ChatBubbleStatusStyle.light,
      ChatDirection.right,
      ChatStatus.error,
    );

    textColor.set(
      theme.colors.textSecondary.color(),
      ControlState.normal,
      ChatBubbleStatusStyle.light,
      ChatDirection.right,
      ChatStatus.sent,
    );

    textColor.set(
      theme.colors.textSecondary.color(),
      ControlState.normal,
      ChatBubbleStatusStyle.light,
      ChatDirection.right,
      ChatStatus.receive,
    );

    textColor.set(
      theme.colors.textSecondary.color(),
      ControlState.normal,
      ChatBubbleStatusStyle.light,
      ChatDirection.right,
      ChatStatus.read,
    );

    textColor.set(
      theme.colors.textSecondary.color(),
      ControlState.normal,
      ChatBubbleStatusStyle.light,
      ChatDirection.right,
      ChatStatus.none,
    );

    /// Direction-right style-light state-disabled
    textColor.set(
      theme.colors.textSecondary.colorWithOpacity(),
      ControlState.disabled,
      ChatBubbleStatusStyle.light,
      ChatDirection.right,
      ChatStatus.loading,
    );

    textColor.set(
      theme.colors.textSecondary.colorWithOpacity(),
      ControlState.disabled,
      ChatBubbleStatusStyle.light,
      ChatDirection.right,
      ChatStatus.error,
    );

    textColor.set(
      theme.colors.textSecondary.colorWithOpacity(),
      ControlState.disabled,
      ChatBubbleStatusStyle.light,
      ChatDirection.right,
      ChatStatus.sent,
    );

    textColor.set(
      theme.colors.textSecondary.colorWithOpacity(),
      ControlState.disabled,
      ChatBubbleStatusStyle.light,
      ChatDirection.right,
      ChatStatus.receive,
    );

    textColor.set(
      theme.colors.textSecondary.colorWithOpacity(),
      ControlState.disabled,
      ChatBubbleStatusStyle.light,
      ChatDirection.right,
      ChatStatus.read,
    );

    textColor.set(
      theme.colors.textSecondary.colorWithOpacity(),
      ControlState.disabled,
      ChatBubbleStatusStyle.light,
      ChatDirection.right,
      ChatStatus.none,
    );

    /// Direction-left style-initial state-normal
    textColor.set(
      theme.colors.textSecondary.color(),
      ControlState.normal,
      ChatBubbleStatusStyle.initial,
      ChatDirection.left,
      ChatStatus.loading,
    );

    textColor.set(
      theme.colors.textSecondary.color(),
      ControlState.normal,
      ChatBubbleStatusStyle.initial,
      ChatDirection.left,
      ChatStatus.error,
    );

    textColor.set(
      theme.colors.textSecondary.color(),
      ControlState.normal,
      ChatBubbleStatusStyle.initial,
      ChatDirection.left,
      ChatStatus.sent,
    );

    textColor.set(
      theme.colors.textSecondary.color(),
      ControlState.normal,
      ChatBubbleStatusStyle.initial,
      ChatDirection.left,
      ChatStatus.receive,
    );

    textColor.set(
      theme.colors.textSecondary.color(),
      ControlState.normal,
      ChatBubbleStatusStyle.initial,
      ChatDirection.left,
      ChatStatus.read,
    );

    textColor.set(
      theme.colors.textSecondary.color(),
      ControlState.normal,
      ChatBubbleStatusStyle.initial,
      ChatDirection.left,
      ChatStatus.none,
    );

    /// Direction-left style-initial state-disabled
    textColor.set(
      theme.colors.textSecondary.colorWithOpacity(),
      ControlState.disabled,
      ChatBubbleStatusStyle.initial,
      ChatDirection.left,
      ChatStatus.loading,
    );

    textColor.set(
      theme.colors.textSecondary.colorWithOpacity(),
      ControlState.disabled,
      ChatBubbleStatusStyle.initial,
      ChatDirection.left,
      ChatStatus.error,
    );

    textColor.set(
      theme.colors.textSecondary.colorWithOpacity(),
      ControlState.disabled,
      ChatBubbleStatusStyle.initial,
      ChatDirection.left,
      ChatStatus.sent,
    );

    textColor.set(
      theme.colors.textSecondary.colorWithOpacity(),
      ControlState.disabled,
      ChatBubbleStatusStyle.initial,
      ChatDirection.left,
      ChatStatus.receive,
    );

    textColor.set(
      theme.colors.textSecondary.colorWithOpacity(),
      ControlState.disabled,
      ChatBubbleStatusStyle.initial,
      ChatDirection.left,
      ChatStatus.read,
    );

    textColor.set(
      theme.colors.textSecondary.colorWithOpacity(),
      ControlState.disabled,
      ChatBubbleStatusStyle.initial,
      ChatDirection.left,
      ChatStatus.none,
    );

    /// Direction-left style-light state-normal
    textColor.set(
      theme.colors.textSecondary.color(),
      ControlState.normal,
      ChatBubbleStatusStyle.light,
      ChatDirection.left,
      ChatStatus.loading,
    );

    textColor.set(
      theme.colors.textSecondary.color(),
      ControlState.normal,
      ChatBubbleStatusStyle.light,
      ChatDirection.left,
      ChatStatus.error,
    );

    textColor.set(
      theme.colors.textSecondary.color(),
      ControlState.normal,
      ChatBubbleStatusStyle.light,
      ChatDirection.left,
      ChatStatus.sent,
    );

    textColor.set(
      theme.colors.textSecondary.color(),
      ControlState.normal,
      ChatBubbleStatusStyle.light,
      ChatDirection.left,
      ChatStatus.receive,
    );

    textColor.set(
      theme.colors.textSecondary.color(),
      ControlState.normal,
      ChatBubbleStatusStyle.light,
      ChatDirection.left,
      ChatStatus.read,
    );

    textColor.set(
      theme.colors.textSecondary.color(),
      ControlState.normal,
      ChatBubbleStatusStyle.light,
      ChatDirection.left,
      ChatStatus.none,
    );

    /// Direction-left style-light state-disabled
    textColor.set(
      theme.colors.textSecondary.colorWithOpacity(),
      ControlState.disabled,
      ChatBubbleStatusStyle.light,
      ChatDirection.left,
      ChatStatus.loading,
    );

    textColor.set(
      theme.colors.textSecondary.colorWithOpacity(),
      ControlState.disabled,
      ChatBubbleStatusStyle.light,
      ChatDirection.left,
      ChatStatus.error,
    );

    textColor.set(
      theme.colors.textSecondary.colorWithOpacity(),
      ControlState.disabled,
      ChatBubbleStatusStyle.light,
      ChatDirection.left,
      ChatStatus.sent,
    );

    textColor.set(
      theme.colors.textSecondary.colorWithOpacity(),
      ControlState.disabled,
      ChatBubbleStatusStyle.light,
      ChatDirection.left,
      ChatStatus.receive,
    );

    textColor.set(
      theme.colors.textSecondary.colorWithOpacity(),
      ControlState.disabled,
      ChatBubbleStatusStyle.light,
      ChatDirection.left,
      ChatStatus.read,
    );

    textColor.set(
      theme.colors.textSecondary.colorWithOpacity(),
      ControlState.disabled,
      ChatBubbleStatusStyle.light,
      ChatDirection.left,
      ChatStatus.none,
    );

    /// Direction-left style-initial state-normal
    textColor.set(
      theme.colors.textSecondary.color(),
      ControlState.normal,
      ChatBubbleStatusStyle.initial,
      ChatDirection.left,
      ChatStatus.loading,
    );

    textColor.set(
      theme.colors.textSecondary.color(),
      ControlState.normal,
      ChatBubbleStatusStyle.initial,
      ChatDirection.left,
      ChatStatus.error,
    );

    textColor.set(
      theme.colors.textSecondary.color(),
      ControlState.normal,
      ChatBubbleStatusStyle.initial,
      ChatDirection.left,
      ChatStatus.sent,
    );

    textColor.set(
      theme.colors.textSecondary.color(),
      ControlState.normal,
      ChatBubbleStatusStyle.initial,
      ChatDirection.left,
      ChatStatus.receive,
    );

    textColor.set(
      theme.colors.textSecondary.color(),
      ControlState.normal,
      ChatBubbleStatusStyle.initial,
      ChatDirection.left,
      ChatStatus.read,
    );

    textColor.set(
      theme.colors.textSecondary.color(),
      ControlState.normal,
      ChatBubbleStatusStyle.initial,
      ChatDirection.left,
      ChatStatus.none,
    );

    /// Direction-left style-initial state-disabled
    textColor.set(
      theme.colors.textSecondary.color(),
      ControlState.disabled,
      ChatBubbleStatusStyle.initial,
      ChatDirection.left,
      ChatStatus.loading,
    );

    textColor.set(
      theme.colors.textSecondary.colorWithOpacity(),
      ControlState.disabled,
      ChatBubbleStatusStyle.initial,
      ChatDirection.left,
      ChatStatus.error,
    );

    textColor.set(
      theme.colors.textSecondary.colorWithOpacity(),
      ControlState.disabled,
      ChatBubbleStatusStyle.initial,
      ChatDirection.left,
      ChatStatus.sent,
    );

    textColor.set(
      theme.colors.textSecondary.colorWithOpacity(),
      ControlState.disabled,
      ChatBubbleStatusStyle.initial,
      ChatDirection.left,
      ChatStatus.receive,
    );

    textColor.set(
      theme.colors.textSecondary.colorWithOpacity(),
      ControlState.disabled,
      ChatBubbleStatusStyle.initial,
      ChatDirection.left,
      ChatStatus.read,
    );

    textColor.set(
      theme.colors.textSecondary.colorWithOpacity(),
      ControlState.disabled,
      ChatBubbleStatusStyle.initial,
      ChatDirection.left,
      ChatStatus.none,
    );

    imageColorDefault = theme.colors.elementStaticWhite;
    imageColorSecondary = theme.colors.textSecondary;
  }

  AppTheme theme;
  late AFont textFont;
  late AColor imageColorDefault;
  late AColor imageColorSecondary;
  ChatBubbleStatusParameters<Color> textColor =
      ChatBubbleStatusParameters<Color>();
}
