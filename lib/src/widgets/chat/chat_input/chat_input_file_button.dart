import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// Button that handles file open action in ChatInput
///
/// This widget extends [ChatInputFileButton], allowing dynamic updates to its state.
///
/// Constructor:
/// ```
/// ChatInputFileButton(
///    onPressed: widget.onPressed,
/// )
/// ```
///
/// Parameters:
/// - `onPressed`: Closure that calls when button tapped.
/// - `isEnable`: The flag that controls enabled/disable state of button.
/// - `scheme`: The visual scheme of ChatInputFileButtonScheme
class ChatInputFileButton extends StatefulWidget {
  /// Creates a ChatInputButton.
  const ChatInputFileButton({
    super.key,
    this.onPressed,
    this.isEnable = true,
    this.scheme,
  });

  final VoidCallback? onPressed;
  final bool isEnable;
  final ChatInputFileButtonScheme? scheme;

  @override
  State<ChatInputFileButton> createState() => _ChatInputFileButtonState();
}

class _ChatInputFileButtonState extends State<ChatInputFileButton> {
  bool _isPressed = false;
  late ChatInputFileButtonScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? ChatInputFileButtonScheme(theme: theme);

    const double buttonSize = LayoutGrid.tripleModule;

    final Color backgroundNormal =
        scheme.buttonColor.unsafeParameter(ControlState.normal);
    final Color backgroundHighlighted =
        scheme.buttonColor.unsafeParameter(ControlState.selected);
    final Color backgroundDisabled =
        scheme.buttonColor.unsafeParameter(ControlState.disabled);
    final Color background = widget.isEnable
        ? (_isPressed ? backgroundHighlighted : backgroundNormal)
        : backgroundDisabled;

    return GestureDetector(
      onTap: () => onTap(),
      onTapUp: (_) => setHighlighted(highlighted: false),
      onTapDown: (_) => setHighlighted(highlighted: true),
      onTapCancel: () => setHighlighted(highlighted: false),
      child: Container(
        width: buttonSize,
        height: buttonSize,
        alignment: Alignment.center,
        child: Icon(
          AdmiralIcons.admiral_ic_attach_file_outline,
          color: background,
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
