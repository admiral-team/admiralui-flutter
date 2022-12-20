import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class InputNumberButton extends StatefulWidget {
  /// Creates a PrimaryButton.
  const InputNumberButton({
    super.key,
    this.onPressed,
    this.onLongPress,
    this.onLongPressCancel,
    this.isEnable = true,
    this.image,
    this.style = InputNumberButtonStyle.normal,
    this.scheme,
  });

  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final VoidCallback? onLongPressCancel;
  final bool isEnable;
  final IconData? image;
  final InputNumberButtonStyle style;
  final InputNumberButtonScheme? scheme;

  @override
  State<InputNumberButton> createState() => _InputNumberButtonState();
}

class _InputNumberButtonState extends State<InputNumberButton> {
  bool _isPressed = false;
  late InputNumberButtonScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? InputNumberButtonScheme(theme: theme);

    final double buttonSize = (widget.style == InputNumberButtonStyle.normal)
        ? LayoutGrid.module * 5
        : LayoutGrid.quadrupleModule;

    final Color backgroundNormal =
        scheme.buttonColor.unsafeParameter(ControlState.normal, widget.style);
    final Color backgroundHighlighted = scheme.buttonColor
        .unsafeParameter(ControlState.highlighted, widget.style);
    final Color backgroundDisabled =
        scheme.buttonColor.unsafeParameter(ControlState.disabled, widget.style);
    final Color background = widget.isEnable
        ? (_isPressed ? backgroundHighlighted : backgroundNormal)
        : backgroundDisabled;

    final Color textColorNormal =
        scheme.imageColor.unsafeParameter(ControlState.normal, widget.style);
    final Color textColorDisabled =
        scheme.imageColor.unsafeParameter(ControlState.disabled, widget.style);
    final Color imageColor =
        widget.isEnable ? textColorNormal : textColorDisabled;

    BoxDecoration? buttonDecoration;

    if (widget.style == InputNumberButtonStyle.normal) {
      buttonDecoration = BoxDecoration(
        color: background,
        shape: BoxShape.circle,
      );
    }

    if (widget.style == InputNumberButtonStyle.secondary) {
      buttonDecoration = BoxDecoration(
        borderRadius: BorderRadius.circular(
          LayoutGrid.module,
        ),
        border: Border.all(
          width: LayoutGrid.halfModule / 2,
          color: background,
        ),
      );
    }

    return GestureDetector(
      onTap: () => widget.onPressed?.call(),
      onLongPress: () => onLongPress(),
      onLongPressEnd: (_) => onLongPressCancel(),
      onTapUp: (_) => setHighlighted(highlighted: false),
      onTapDown: (_) => setHighlighted(highlighted: true),
      onTapCancel: () => setHighlighted(highlighted: false),
      child: Container(
        width: buttonSize,
        height: buttonSize,
        alignment: Alignment.center,
        decoration: buttonDecoration,
        child: Icon(
          widget.image,
          color: imageColor,
          size: LayoutGrid.halfModule * 5,
        ),
      ),
    );
  }

  void setHighlighted({required bool highlighted}) {
    setState(() {
      _isPressed = highlighted;
    });
  }

  void onLongPress() {
    setHighlighted(highlighted: true);
    widget.onLongPress?.call();
  }

  void onLongPressCancel() {
    setHighlighted(highlighted: false);
    widget.onLongPressCancel?.call();
  }
}
