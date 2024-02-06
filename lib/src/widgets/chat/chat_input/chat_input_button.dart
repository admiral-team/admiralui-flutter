import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// Rounded button that handles send message action in ChatInput
///
/// Takes closure, enabled flat and scheme parameter.
///
/// You can create ChatInputButton by specifying following parameters:
/// onPressed - Closure that calls when button tapped.
/// isEnable - The flag that controls enabled/disable state of button.
/// scheme - The visual scheme of ChatInputButton
class ChatInputButton extends StatefulWidget {
  /// Creates a ChatInputButton.
  const ChatInputButton({
    super.key,
    this.onPressed,
    this.isEnable = true,
    this.scheme,
  });

  final VoidCallback? onPressed;
  final bool isEnable;
  final ChatInputButtonScheme? scheme;

  @override
  State<ChatInputButton> createState() => _ChatInputButtonState();
}

class _ChatInputButtonState extends State<ChatInputButton> {
  bool _isPressed = false;
  late ChatInputButtonScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? ChatInputButtonScheme(theme: theme);

    const double buttonSize = LayoutGrid.halfModule * 10;

    final Color backgroundNormal =
        scheme.buttonColor.unsafeParameter(ControlState.normal);
    final Color backgroundHighlighted =
        scheme.buttonColor.unsafeParameter(ControlState.selected);
    final Color backgroundDisabled =
        scheme.buttonColor.unsafeParameter(ControlState.disabled);
    final Color background = widget.isEnable
        ? (_isPressed ? backgroundHighlighted : backgroundNormal)
        : backgroundDisabled;

    final Color imageColor = scheme.sendButtonColor.color();

    return GestureDetector(
      onTap: () => onTap(),
      onTapUp: (_) => setHighlighted(highlighted: false),
      onTapDown: (_) => setHighlighted(highlighted: true),
      onTapCancel: () => setHighlighted(highlighted: false),
      child: Container(
        width: buttonSize,
        height: buttonSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: background,
          borderRadius: const BorderRadius.all(
            Radius.circular(LayoutGrid.module),
          ),
        ),
        child: Icon(
          AdmiralIcons.admiral_ic_arrow_right_outline,
          color: imageColor,
        ),
      ),
    );
  }

  void setHighlighted({required bool highlighted}) {
    setState(() {
      _isPressed = highlighted;
    });
  }

  void onTap() {
    if (widget.isEnable) {
      widget.onPressed?.call();
    }
  }
}
