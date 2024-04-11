import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// An GhostButton-style button.
///
/// Takes in a text or an icon that fades out and in on touch. May optionally
/// have a background.
///
/// You can create buttons in three sizes: (small, medium, big) by specifying
/// size Type in init PrimaryButtonStyle:
/// Big - the main button, the width of which depends on the width of the
/// screen;
/// Medium - an additional button of a smaller size, the button does not change
/// its size depending on the width of the screen;
/// Small - changes its width depending on the content inside it, often used
/// with the keyboard.
///
class GhostButton extends StatefulWidget {
  /// Creates an GhostButton.
  const GhostButton({
    super.key,
    this.onPressed,
    this.title = '',
    this.isEnable = true,
    this.isLoading = false,
    this.sizeType = ButtonSizeType.big,
    this.iconData,
    this.iconPosition,
    this.scheme,
  });

  final VoidCallback? onPressed;
  final String title;
  final bool isEnable;
  final bool isLoading;
  final ButtonSizeType sizeType;
  final IconData? iconData;
  final IconPosition? iconPosition;
  final GhostButtonScheme? scheme;

  @override
  State<GhostButton> createState() => _GhostButtonState();
}

class _GhostButtonState extends State<GhostButton> {
  bool _isPressed = false;
  late GhostButtonScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? GhostButtonScheme(theme: theme);

    final Color textColorNormal =
        scheme.buttonColor.unsafeParameter(ControlState.normal);
    final Color textColorHighlighted =
        scheme.buttonColor.unsafeParameter(ControlState.highlighted);
    final Color textColorDisabled =
        scheme.buttonColor.unsafeParameter(ControlState.disabled);
    final Color textColor = widget.isEnable
        ? (_isPressed ? textColorHighlighted : textColorNormal)
        : textColorDisabled;

    return GestureDetector(
      onTap: () => widget.onPressed?.call(),
      onTapUp: (_) => setHighlighted(highlighted: false),
      onTapDown: (_) => setHighlighted(highlighted: true),
      onTapCancel: () => setHighlighted(highlighted: false),
      child: Container(
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
                      color: textColor,
                    )
                  : null,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: !widget.isLoading
                  ? TextView(
                      widget.title,
                      font: scheme.font,
                      textColorNormal: textColor,
                    )
                  : SizedBox(
                      width: LayoutGrid.doubleModule,
                      height: LayoutGrid.doubleModule,
                      child: Spinner(scheme: scheme.spinnerScheme),
                    ),
            ),
            SizedBox(
              child: (widget.iconData != null &&
                      widget.iconPosition == IconPosition.right)
                  ? Icon(
                      widget.iconData,
                      color: textColor,
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
