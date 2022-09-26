import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// A TwoTitleGhostButton-style button.
///
/// A button with two title text (leftTitle and rightTitle)
///
/// You can create buttons in three sizes: (small, medium, big) by specifying
/// size Type in init ButtonSizeType:
/// Big - the main button, the width of which depends on the width
/// of the screen;
/// Medium - an additional button of a smaller size, the button does not change
/// its size depending on the width of the screen;
/// Small - changes its width depending on the content inside it, often used
/// with the keyboard.
///
class TwoTitleGhostButton extends StatefulWidget {
  /// Creates an GhostButton.
  const TwoTitleGhostButton({
    Key? key,
    this.onPressed,
    this.leftTitle,
    this.rightTitle,
    this.isEnable = true,
    this.sizeType = ButtonSizeType.big,
    this.direction,
    this.scheme,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String? leftTitle;
  final String? rightTitle;
  final bool isEnable;
  final ButtonSizeType sizeType;
  final IconDirection? direction;
  final TwoTitleGhostButtonScheme? scheme;

  @override
  State<TwoTitleGhostButton> createState() => _TwoTitleGhostButtonState();
}

class _TwoTitleGhostButtonState extends State<TwoTitleGhostButton> {
  bool _isPressed = false;
  late TwoTitleGhostButtonScheme scheme;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? TwoTitleGhostButtonScheme(theme: theme);
    final Color textColorNormal =
        scheme.textColor.unsafeParameter(ControlState.normal);
    final Color textColorHighlighted =
        scheme.textColor.unsafeParameter(ControlState.highlighted);
    final Color textColorDisabled =
        scheme.textColor.unsafeParameter(ControlState.disabled);
    final Color textColor = widget.isEnable
        ? (_isPressed ? textColorHighlighted : textColorNormal)
        : textColorDisabled;

    return GestureDetector(
      onTap: () => widget.onPressed?.call(),
      onTapUp: (_) => setHighlighted(isPressed: false),
      onTapDown: (_) => setHighlighted(isPressed: true),
      onTapCancel: () => setHighlighted(isPressed: false),
      child: Container(
        width: widget.sizeType.width,
        height: widget.sizeType.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(LayoutGrid.module),
        ),
        padding: EdgeInsets.symmetric(
          vertical: LayoutGrid.oneAndHalfModule,
          horizontal: LayoutGrid.doubleModule,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: LayoutGrid.oneAndHalfModule,
              ),
            ),
            Expanded(
              child: Text(
                widget.leftTitle ?? '',
                style: TextStyle(
                  color: textColor,
                  fontSize: scheme.font.fontSize,
                  fontFamily: scheme.font.fontFamily,
                  fontWeight: scheme.font.fontWeight,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: LayoutGrid.oneAndHalfModule,
              ),
              child: Text(
                widget.rightTitle ?? '',
                style: TextStyle(
                  color: textColor,
                  fontSize: scheme.font.fontSize,
                  fontFamily: scheme.font.fontFamily,
                  fontWeight: scheme.font.fontWeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void setHighlighted({required bool isPressed}) {
    setState(() {
      _isPressed = isPressed;
    });
  }
}