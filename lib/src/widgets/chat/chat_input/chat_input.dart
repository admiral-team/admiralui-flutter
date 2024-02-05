import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

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
    this.hintText = '',
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onSendButtonPress,
    this.onFileButtonPress,
    this.scheme,
  });

  final TextInputState state;
  final String content;
  final bool isSendButtonDisabled;
  final String placeholder;
  final String hintText;
  final int maxLinesCount;
  final int minLinesCount;
  final bool isShowFileButton;
  final bool isTapSendButtonHidden;
  final FocusNode? focusNode;
  final TextEditingController textEditingController;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
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

  FocusNode? _focusNode;
  FocusNode get _effectiveFocusNode =>
      widget.focusNode ?? (_focusNode ??= FocusNode());
  TextInputState get _state => widget.state;

  @override
  void initState() {
    super.initState();
    _effectiveFocusNode
        .addListener(() => _onFocus(hasFocus: _effectiveFocusNode.hasFocus));
  }

  @override
  void dispose() {
    super.dispose();
    _effectiveFocusNode.removeListener(() {});
    _focusNode?.dispose();
  }

  void _onFocus({required bool hasFocus}) {
    if (!mounted) {
      return;
    }
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

    final Color fileButtonImageColor =
        scheme.fileButtonImageColor.unsafeParameter(
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
                  if (widget.isShowFileButton)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        const Spacer(),
                        SizedBox(
                          width: LayoutGrid.tripleModule,
                          height: LayoutGrid.tripleModule,
                          child: IconButton(
                            icon: const Icon(
                              AdmiralIcons.admiral_ic_attach_file_outline,
                            ),
                            color: fileButtonImageColor,
                            iconSize: LayoutGrid.tripleModule,
                            onPressed: widget.onFileButtonPress,
                          ),
                        ),
                        const SizedBox(
                          height: LayoutGrid.doubleModule,
                        ),
                      ],
                    ),
                  const SizedBox(
                    width: LayoutGrid.halfModule * 3,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: widget.textEditingController,
                      textAlign: TextAlign.left,
                      maxLines: widget.maxLinesCount,
                      minLines: widget.minLinesCount,
                      focusNode: _effectiveFocusNode,
                      keyboardType: widget.keyboardType,
                      textInputAction: widget.textInputAction,
                      decoration: InputDecoration(
                        labelText: widget.placeholder,
                        hintText: widget.hintText,
                        hintStyle: scheme.placeholderFont.toTextStyle(
                          placeHolderColor,
                        ),
                        labelStyle: scheme.placeholderFont.toTextStyle(
                          placeHolderColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          // ignore: use_named_constants
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
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
          isEnable: _state == TextInputState.normal,
          onPressed: widget.onSendButtonPress,
        ),
      ],
    );
  }
}
