import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

/// A SecondaryButton-style button.
///
/// Takes in a text or an icon that fades out and in on touch.
/// May optionally have a background.
///
/// You can create buttons in three sizes: (small, medium, big)
/// by specifying size Type in init PrimaryButtonStyle:
///  Big - the main button, the width of which depends on the width
///  of the screen;
///  Medium - an additional button of a smaller size, the button does not change
///  its size depending on the width of the screen;
///  Small - changes its width depending on the content inside it, often used
///  with the keyboard.
///
class SecondaryButton extends StatefulWidget {
  /// Creates a SecondaryButton.
  const SecondaryButton({
    Key? key,
    this.onPressed,
    this.title = '',
    this.isEnable = true,
    this.sizeType = ButtonSizeType.big,
    this.icon,
    this.iconPosition,
    this.scheme,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String title;
  final bool isEnable;
  final ButtonSizeType sizeType;
  final Widget? icon;
  final IconPosition? iconPosition;
  final SecondaryButtonScheme? scheme;

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  bool _isPressed = false;
  late SecondaryButtonScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? SecondaryButtonScheme(theme: theme);

    final Color backgroundNormal =
        scheme.buttonColor.unsafeParameter(ControlState.normal);
    final Color backgroundHighlighted =
        scheme.buttonColor.unsafeParameter(ControlState.highlighted);
    final Color backgroundDisabled =
        scheme.buttonColor.unsafeParameter(ControlState.disabled);
    final Color background = widget.isEnable
        ? (_isPressed ? backgroundHighlighted : backgroundNormal)
        : backgroundDisabled;

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
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            width: 2,
            color: background,
          ),
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
                      (widget.iconPosition == IconPosition.left ||
                          widget.iconPosition == null))
                  ? widget.icon
                  : null,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12,
              ),
            ),
            Flexible(
              child: Text(
                widget.title,
                style: TextStyle(
                  color: background,
                  fontSize: scheme.font.fontSize,
                  fontFamily: scheme.font.fontFamily,
                  fontWeight: scheme.font.fontWeight,
                ),
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
      ),
    );
  }

  void setHighlighted({required bool highlighted}) {
    setState(() {
      _isPressed = highlighted;
    });
  }
}
