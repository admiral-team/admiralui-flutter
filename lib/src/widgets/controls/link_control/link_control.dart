import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/src/widgets/controls/link_control/link_control_parameter.dart';
import 'package:admiralui_flutter/src/widgets/controls/link_control/link_control_scheme.dart';
import 'package:flutter/material.dart';

/// A PrimaryButton-style button.
///
/// Takes in a text or an icon that fades out and in on touch. May optionally
/// have a background.
///
/// You can create buttons in three sizes: (small, medium, big) by specifying
/// size Type in init PrimaryButtonStyle:
///  Big - the main button, the width of which depends on the width
///  of the screen;
///  Medium - an additional button of a smaller size, the button does not change
///  its size depending on the width of the screen;
///  Small - changes its width depending on the content inside it,
///  often used with the keyboard.
///
class LinkControl extends StatefulWidget {
  /// Creates a PrimaryButton.
  const LinkControl({
    super.key,
    this.onPressed,
    this.title = '',
    this.isEnable = true,
    this.style = LinkStyle.normal,
    this.icon,
    this.iconPosition,
    this.scheme,
  });

  final VoidCallback? onPressed;
  final String title;
  final bool isEnable;
  final LinkStyle style;
  final Widget? icon;
  final IconPosition? iconPosition;
  final LinkControlScheme? scheme;

  @override
  State<LinkControl> createState() => _LinkControlState();
}

class _LinkControlState extends State<LinkControl> {
  bool _isPressed = false;
  late LinkControlScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? LinkControlScheme(theme: theme);

    final Color backgroundNormal =
        scheme.linkColor.unsafeParameter(ControlState.normal);
    final Color backgroundHighlighted =
        scheme.linkColor.unsafeParameter(ControlState.highlighted);
    final Color backgroundDisabled =
        scheme.linkColor.unsafeParameter(ControlState.disabled);
    final Color linkColor = widget.isEnable
        ? (_isPressed ? backgroundHighlighted : backgroundNormal)
        : backgroundDisabled;

    return GestureDetector(
      onTap: () => widget.onPressed?.call(),
      onTapUp: (_) => setHighlighted(highlighted: false),
      onTapDown: (_) => setHighlighted(highlighted: true),
      onTapCancel: () => setHighlighted(highlighted: false),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            child: (widget.icon != null &&
                    (widget.iconPosition == IconPosition.left ||
                        widget.iconPosition == null))
                ? widget.icon
                : null,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8,
            ),
          ),
          Flexible(
            child: TextView(
              widget.title,
              font: scheme.linkFont.parameter(widget.style),
              textColorNormal: linkColor,
            ),
          ),
          SizedBox(
            child: (widget.icon != null &&
                    widget.iconPosition == IconPosition.right)
                ? widget.icon
                : null,
          ),
        ],
      ),
    );
  }

  void setHighlighted({required bool highlighted}) {
    setState(() {
      _isPressed = highlighted;
    });
  }
}
