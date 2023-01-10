import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

enum InputNumberTextfieldButtonStyle { left, right }

class InputNumberTextFieldButton extends StatefulWidget {
  /// Creates a InputNumberTextfieldButton.
  const InputNumberTextFieldButton({
    super.key,
    this.onPressed,
    this.onLongPress,
    this.onLongPressCancel,
    this.isEnable = true,
    this.image,
    this.style = InputNumberTextfieldButtonStyle.left,
    this.scheme,
  });

  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final VoidCallback? onLongPressCancel;
  final bool isEnable;
  final IconData? image;
  final InputNumberTextfieldButtonStyle style;
  final InputNumberTextfieldButtonScheme? scheme;

  @override
  State<InputNumberTextFieldButton> createState() =>
      _InputNumberTextfieldButtonState();
}

class _InputNumberTextfieldButtonState
    extends State<InputNumberTextFieldButton> {
  bool _isPressed = false;
  late InputNumberTextfieldButtonScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? InputNumberTextfieldButtonScheme(theme: theme);

    const double buttonSize = LayoutGrid.halfModule * 9;

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
        scheme.imageColor.unsafeParameter(ControlState.normal);
    final Color textColorDisabled =
        scheme.imageColor.unsafeParameter(ControlState.disabled);
    final Color imageColor =
        widget.isEnable ? textColorNormal : textColorDisabled;

    BoxDecoration? buttonDecoration;

    switch (widget.style) {
      case InputNumberTextfieldButtonStyle.left:
        buttonDecoration = BoxDecoration(
          color: background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(LayoutGrid.module),
            bottomLeft: Radius.circular(LayoutGrid.module),
          ),
        );
        break;
      case InputNumberTextfieldButtonStyle.right:
        buttonDecoration = BoxDecoration(
          color: background,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(LayoutGrid.module),
            bottomRight: Radius.circular(LayoutGrid.module),
          ),
        );
    }

    return GestureDetector(
      onTap: () => onTap(),
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
    if (widget.isEnable) {
      widget.onLongPress?.call();
    }
  }

  void onTap() {
    if (widget.isEnable) {
      widget.onPressed?.call();
    }
  }

  void onLongPressCancel() {
    setHighlighted(highlighted: false);
    if (widget.isEnable) {
      widget.onLongPressCancel?.call();
    }
  }
}
