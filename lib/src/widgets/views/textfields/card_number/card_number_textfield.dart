import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A text field widget designed specifically for entering credit card numbers.
///
/// Constructor:
/// ```
/// CardNumberTextField(
///   this.controller, {
///   this.state = TextInputState.normal,
///   this.focusNode,
///   this.keyboardType = TextInputType.number,
///   this.textInputAction,
///   this.informerText,
///   this.placeHolderText = '',
///   this.trailingIcon,
///   this.onChanged,
///   this.onEditingComplete,
///   this.scheme,
///   Key? key,
/// })
/// ```
///
/// Parameters:
/// - `controller`: The controller for the text field.
/// - `state`: The state of the text field (e.g., normal, disabled, read-only).
/// - `focusNode`: An optional focus node to control the focus
/// behavior of the text field.
/// - `keyboardType`: The type of keyboard to display for the text field.
/// - `textInputAction`: The action button to display on the keyboard.
/// - `informerText`: Additional information text to display
/// below the text field.
/// - `placeHolderText`: Placeholder text to display when the
/// text field is empty.
/// - `trailingIcon`: An optional icon to display at the end of the text field.
/// - `onChanged`: A callback function that is called when
/// the text field's value changes.
/// - `onEditingComplete`: A callback function that is called when
/// editing is complete.
/// - `scheme`: An optional scheme to customize the appearance of the
/// text field.
/// - `key`: An optional key to identify this widget.
///
/// Example usage:
///
/// CardNumberTextField(
///   controller,
///   state: TextInputState.normal,
///   placeHolderText: 'Enter card number',
///   trailingIcon: Icons.credit_card,
///   onChanged: (text) {
///     // Handle text change
///   },
/// )
class CardNumberTextField extends StatefulWidget {
  const CardNumberTextField(
    this.controller, {
    this.state = TextInputState.normal,
    this.focusNode,
    this.keyboardType = TextInputType.number,
    this.textInputAction,
    this.informerText,
    this.placeHolderText = '',
    this.trailingIcon,
    this.onChanged,
    this.onEditingComplete,
    this.scheme,
    super.key,
  });

  final TextEditingController controller;
  final TextInputState state;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? informerText;
  final String placeHolderText;
  final IconData? trailingIcon;

  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final CardNumberTextFieldScheme? scheme;

  @override
  State<StatefulWidget> createState() => _CardNumberTextFieldState();
}

class _CardNumberTextFieldState extends State<CardNumberTextField>
    with SingleTickerProviderStateMixin {
  FocusNode? _focusNode;
  FocusNode get _effectiveFocusNode =>
      widget.focusNode ?? (_focusNode ??= FocusNode());
  bool _hasFocus = false;

  String get _placeHolderText =>
      widget.placeHolderText.isNotEmpty ? widget.placeHolderText : '';

  late CardNumberTextFieldScheme scheme;

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
    setState(() {
      _hasFocus = hasFocus;

      widget.controller.selection = TextSelection.fromPosition(
        const TextPosition(offset: 0),
      );
    });
  }

  void _onChanged({required String text}) {
    setState(() {});
    widget.onChanged?.call(text);
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? CardNumberTextFieldScheme(theme: theme);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Flexible(
              child: Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      const SizedBox(
                        height: LayoutGrid.doubleModule,
                      ),
                      TextFormField(
                        inputFormatters: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(19),
                          FilteringTextInputFormatter.digitsOnly,
                          CardNumberFormatter(),
                        ],
                        controller: widget.controller,
                        focusNode: _effectiveFocusNode,
                        style: TextStyle(
                          fontWeight: scheme.textFieldFont.fontWeight,
                          fontFamily: scheme.textFieldFont.fontFamily,
                          fontSize: scheme.textFieldFont.fontSize,
                          color: scheme.textColor.unsafeParameter(widget.state),
                        ),
                        keyboardType: widget.keyboardType,
                        decoration: InputDecoration(
                          hintText: _placeHolderText,
                          border: InputBorder.none,
                          isDense: true,
                          hintStyle: TextStyle(
                            fontWeight: scheme.placeholderFont.fontWeight,
                            fontFamily: scheme.placeholderFont.fontFamily,
                            fontStyle: FontStyle.normal,
                            fontSize: scheme.placeholderFont.fontSize,
                            color: scheme.placeholderColor,
                          ),
                        ),
                        cursorColor: scheme.cursorColor,
                        onChanged: (String text) => _onChanged(text: text),
                        enabled: widget.state != TextInputState.disabled,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: LayoutGrid.halfModule),
              child: SizedBox(
                width: LayoutGrid.halfModule * 7,
                height: LayoutGrid.halfModule * 7,
                child: Icon(
                  widget.trailingIcon,
                  color: scheme.iconColor.unsafeParameter(widget.state),
                ),
              ),
            ),
          ],
        ),
        TextFieldSeparator(
          widget.state,
          lineHeight: LayoutGrid.halfModule / 2,
          isEditing: _hasFocus,
        ),
        const SizedBox(height: LayoutGrid.module),
        if (widget.informerText != null &&
            widget.informerText?.isEmpty == false)
          Align(
            child: TextView(
              widget.informerText!,
              font: scheme.informerFont,
              textColorNormal:
                  scheme.infomerLabelColor.unsafeParameter(widget.state),
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue previousValue,
    TextEditingValue nextValue,
  ) {
    final String inputText = nextValue.text;

    if (nextValue.selection.baseOffset == 0) {
      return nextValue;
    }

    final StringBuffer bufferString = StringBuffer();
    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      final int nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != inputText.length) {
        bufferString.write(' ');
      }
    }

    final String string = bufferString.toString();
    return nextValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }
}
