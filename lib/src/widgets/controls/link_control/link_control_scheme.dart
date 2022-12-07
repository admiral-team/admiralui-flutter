import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/src/widgets/controls/link_control/link_control_parameter.dart';
import 'package:flutter/material.dart';

class LinkControlScheme {
  LinkControlScheme({
    required this.theme,
  }) {
    linkColor.set(
      theme.colors.elementAccent.color(),
      ControlState.normal,
    );
    linkColor.set(
      theme.colors.elementAccentPressed.color(),
      ControlState.highlighted,
    );
    linkColor.set(
      theme.colors.elementAccent.colorWithOpacity(),
      ControlState.disabled,
    );

    linkFont.set(theme.fonts.body2, LinkStyle.normal);
    linkFont.set(theme.fonts.subhead3, LinkStyle.medium);
  }

  AppTheme theme;
  LinkControlParameter<AFont> linkFont = LinkControlParameter<AFont>();
  ControlParameter<Color> linkColor = ControlParameter<Color>();
}
