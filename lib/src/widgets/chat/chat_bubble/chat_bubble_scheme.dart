import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/theme/admiral_color.dart';
import 'package:flutter/material.dart';

class ChatBubbleScheme {
  ChatBubbleScheme({required this.theme}) {
    errorImageColor = theme.colors.elementError;
    nameTextFont = theme.fonts.caption1;
    nameTextColor = theme.colors.textSecondary;

    backgroundColor.set(
      theme.colors.backgroundAdditionalOne.color(),
      ChatDirection.left,
    );

    backgroundColor.set(
      theme.colors.backgroundAccent.color(),
      ChatDirection.right,
    );

    textColor.set(
      theme.colors.textPrimary.color(),
      ChatDirection.left,
    );

    textColor.set(
      theme.colors.textStaticWhite.color(),
      ChatDirection.right,
    );
    textFont = theme.fonts.body1;
  }

  AppTheme theme;
  late AColor errorImageColor;
  late AFont nameTextFont;
  late AColor nameTextColor;
  late AFont textFont;

  ChatBubbleParameters<Color> backgroundColor = ChatBubbleParameters<Color>();
  ChatBubbleParameters<Color> textColor = ChatBubbleParameters<Color>();
}
