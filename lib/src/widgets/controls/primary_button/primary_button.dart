import 'package:admiralui_flutter/src/widgets/controls/button_size_type.dart';
import 'package:admiralui_flutter/src/widgets/controls/control_parameter.dart';
import 'package:admiralui_flutter/src/widgets/controls/icon_direction.dart';
import 'package:admiralui_flutter/src/widgets/controls/primary_button/primary_button_scheme.dart';
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
class PrimaryButton extends StatefulWidget {
  /// Creates a PrimaryButton.
  const PrimaryButton({
    Key? key,
    this.onPressed,
    this.title = '',
    this.isEnable = true,
    this.sizeType = ButtonSizeType.big,
    this.icon,
    this.direction,
    this.scheme,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String title;
  final bool isEnable;
  final ButtonSizeType sizeType;
  final Widget? icon;
  final IconDirection? direction;
  final PrimaryButtonScheme? scheme;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _isPressed = false;
  late PrimaryButtonScheme scheme;

  @override
  void initState() {
    super.initState();
    scheme = widget.scheme ?? PrimaryButtonScheme();
  }

  @override
  Widget build(BuildContext context) {
    final Color backgroundNormal =
        scheme.buttonColor.unsafeParameter(ControlState.normal);
    final Color backgroundHighlighted =
        scheme.buttonColor.unsafeParameter(ControlState.highlighted);
    final Color backgroundDisabled =
        scheme.buttonColor.unsafeParameter(ControlState.disabled);
    final Color background = widget.isEnable
        ? (_isPressed ? backgroundHighlighted : backgroundNormal)
        : backgroundDisabled;
    final Color textColorNormal =
        scheme.textColor.unsafeParameter(ControlState.normal);
    final Color textColorDisabled =
        scheme.textColor.unsafeParameter(ControlState.disabled);
    final Color textColor =
        widget.isEnable ? textColorNormal : textColorDisabled;

    return GestureDetector(
      onTap: () => widget.onPressed?.call(),
      onTapUp: (_) => setHighlighted(highlighted: false),
      onTapDown: (_) => setHighlighted(highlighted: true),
      onTapCancel: () => setHighlighted(highlighted: false),
      child: Container(
        width: widget.sizeType.width,
        height: widget.sizeType.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 16.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: (widget.icon != null &&
                      widget.direction == IconDirection.left)
                  ? widget.icon
                  : null,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Text(
                widget.title,
                style: TextStyle(
                  color: textColor,
                  fontSize: scheme.fontSize,
                  fontFamily: scheme.fontFamily,
                  fontWeight: scheme.fontWeight,
                ),
              ),
            ),
            SizedBox(
              child: (widget.icon != null &&
                      widget.direction == IconDirection.right)
                  ? widget.icon
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  void setHighlighted({required bool highlighted}) {
    setState(() {
      _isPressed = highlighted;
    });
  }
}
