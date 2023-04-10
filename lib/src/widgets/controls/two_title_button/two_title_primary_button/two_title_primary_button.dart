import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// A TwoTitlePrimaryButton-style button.
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
class TwoTitlePrimaryButton extends StatefulWidget {
  /// Creates an PrimaryButton.
  const TwoTitlePrimaryButton({
    super.key,
    this.onPressed,
    this.leftTitle,
    this.rightTitle,
    this.isEnable = true,
    this.sizeType = ButtonSizeType.big,
    this.scheme,
  });

  final VoidCallback? onPressed;
  final String? leftTitle;
  final String? rightTitle;
  final bool isEnable;
  final ButtonSizeType sizeType;
  final TwoTitlePrimaryButtonScheme? scheme;

  @override
  State<TwoTitlePrimaryButton> createState() => _TwoTitlePrimaryButtonState();
}

class _TwoTitlePrimaryButtonState extends State<TwoTitlePrimaryButton> {
  bool _isPressed = false;
  late TwoTitlePrimaryButtonScheme scheme;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? TwoTitlePrimaryButtonScheme(theme: theme);

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
      onTapUp: (_) => setHighlighted(isPressed: false),
      onTapDown: (_) => setHighlighted(isPressed: true),
      onTapCancel: () => setHighlighted(isPressed: false),
      child: Container(
        width: widget.sizeType.width,
        height: widget.sizeType.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(
            LayoutGrid.module,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: LayoutGrid.halfModule * 3,
          horizontal: LayoutGrid.doubleModule,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(
                left: LayoutGrid.halfModule * 3,
              ),
            ),
            Expanded(
              child: TextView(
                widget.leftTitle ?? '',
                overflow: TextOverflow.ellipsis,
                font: scheme.font,
                textColorNormal: textColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: LayoutGrid.halfModule * 3,
              ),
              child: TextView(
                widget.rightTitle ?? '',
                font: scheme.font,
                textColorNormal: textColor,
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
