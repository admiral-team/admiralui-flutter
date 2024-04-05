import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
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
    super.key,
    this.onPressed,
    this.title = '',
    this.isEnable = true,
    this.sizeType = ButtonSizeType.big,
    this.iconData,
    this.iconPosition,
    this.scheme,
  });

  final VoidCallback? onPressed;
  final String title;
  final bool isEnable;
  final ButtonSizeType sizeType;
  final IconData? iconData;
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

    final Color colorNormal =
        scheme.buttonColor.unsafeParameter(ControlState.normal);
    final Color colorHighlighted =
        scheme.buttonColor.unsafeParameter(ControlState.highlighted);
    final Color colorDisabled =
        scheme.buttonColor.unsafeParameter(ControlState.disabled);
    final Color color = widget.isEnable
        ? (_isPressed ? colorHighlighted : colorNormal)
        : colorDisabled;

    return GestureDetector(
      onTap: () => widget.onPressed?.call(),
      onTapUp: (_) => setHighlighted(highlighted: false),
      onTapDown: (_) => setHighlighted(highlighted: true),
      onTapCancel: () => setHighlighted(highlighted: false),
      child: Container(
        constraints: BoxConstraints(
          minWidth: widget.sizeType.width,
          minHeight: widget.sizeType.height,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            LayoutGrid.module,
          ),
          border: Border.all(
            width: 2,
            color: color,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: LayoutGrid.halfModule * 3,
          horizontal: LayoutGrid.doubleModule,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: (widget.iconData != null &&
                      (widget.iconPosition == IconPosition.left ||
                          widget.iconPosition == null))
                  ? Icon(
                      widget.iconData,
                      color: color,
                    )
                  : null,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: LayoutGrid.module,
              ),
              child: TextView(
                widget.title,
                font: scheme.font,
                textColorNormal: color,
              ),
            ),
            SizedBox(
              child: (widget.iconData != null &&
                      widget.iconPosition == IconPosition.right)
                  ? Icon(
                      widget.iconData,
                      color: color,
                    )
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
