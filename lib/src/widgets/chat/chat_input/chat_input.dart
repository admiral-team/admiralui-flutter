import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// View for chat input message and add files.
///
/// Takes TextInputState, default text and several options to setup
/// chat input actions.
///
/// You can create ChatInput by specifying following parameters:
/// state - Current state of chat input text/field
/// content - The text that the text field displays.
/// isSendButtonDisabled - Flag disabled send button.
/// isShowFileButton - Flag show file button.
/// textEditingController - TextEditingController for TextFormField.
/// maxLinesCount - Maximum number of lines availible in TextFormField.
/// minLinesCount - Minimun number of lines availible in TextFormField.
/// placeholder - The string that displays when there is no other text
/// hintText - The string that displays hint when over textfield.
/// keyboardType - Requests that a particular keyboard type
/// be displayed when a text widget
/// with the keyboard.
/// textInputAction - An action the user has requested the text
/// input control to perform.
/// onChanged - A closure that calls every time when TextFormField
/// text changes
/// onSendButtonPress - A closure that calls when send button clicked
/// onFileButtonPress - A closure that calls when file button clicked
/// scheme - The visual scheme of ChatInput
class ChatInput extends StatefulWidget {
  /// Creates an ChatInput.
  const ChatInput({
    super.key,
    required this.state,
    required this.content,
    required this.isSendButtonDisabled,
    required this.isShowFileButton,
    required this.isTapSendButtonHidden,
    required this.textEditingController,
    this.maxLinesCount = 5,
    this.minLinesCount = 1,
    this.placeholder = '',
    this.keyboardType,
    this.textInputAction,
    this.chatInputButtonKey,
    this.onChanged,
    this.onSendButtonPress,
    this.onFileButtonPress,
    this.scheme,
  });

  final TextInputState state;
  final String content;
  final bool isSendButtonDisabled;
  final String placeholder;
  final int maxLinesCount;
  final int minLinesCount;
  final bool isShowFileButton;
  final bool isTapSendButtonHidden;
  final TextEditingController textEditingController;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Key? chatInputButtonKey;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSendButtonPress;
  final VoidCallback? onFileButtonPress;
  final ChatInputScheme? scheme;

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  late ChatInputScheme scheme;
  late Icon icon;
  TextInputState get _state => widget.state;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onChanged({required String text}) {
    widget.onChanged?.call(text);
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? ChatInputScheme(theme: theme);

    final Color backgroundColor = scheme.backgroundColor.unsafeParameter(
      _state == TextInputState.disabled
          ? ControlState.disabled
          : ControlState.normal,
    );

    final Color placeHolderColor = scheme.placeHolderColor.unsafeParameter(
      _state == TextInputState.disabled
          ? ControlState.disabled
          : ControlState.normal,
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Flexible(
          child: IntrinsicHeight(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  const SizedBox(
                    width: LayoutGrid.module,
                  ),
                  if (widget.isShowFileButton)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        const Spacer(),
                        ChatInputFileButton(
                          onPressed: widget.onFileButtonPress,
                          isEnable: _state == TextInputState.normal,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  const SizedBox(
                    width: LayoutGrid.halfModule,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: widget.textEditingController,
                      textAlign: TextAlign.left,
                      maxLines: widget.maxLinesCount,
                      minLines: widget.minLinesCount,
                      keyboardType: widget.keyboardType,
                      textInputAction: widget.textInputAction,
                      style: TextStyle(color: scheme.textColor.color()),
                      decoration: InputDecoration(
                        hintText: widget.placeholder,
                        hintStyle: scheme.placeholderFont.toTextStyle(
                          placeHolderColor,
                        ),
                        labelStyle: scheme.placeholderFont.toTextStyle(
                          placeHolderColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: LayoutGrid.module,
                        ),
                        filled: true,
                        fillColor: backgroundColor,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      onChanged: (String newText) => _onChanged,
                      enabled: widget.state != TextInputState.disabled,
                      readOnly: widget.state == TextInputState.readOnly,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          width: LayoutGrid.module,
        ),
        ChatInputButton(
          key: widget.chatInputButtonKey,
          isEnable: !widget.isSendButtonDisabled,
          onPressed: widget.onSendButtonPress,
        ),
      ],
    );
  }
}
