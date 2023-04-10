import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

// OTPTextField - An object that displays an
// editable text area for enter sms code.
class OTPTextField extends StatefulWidget {
  const OTPTextField(
    this.controller, {
    this.state = TextInputState.normal,
    this.focusNode,
    this.keyboardType = TextInputType.number,
    this.textInputAction,
    this.informerText,
    this.placeHolderText = '',
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

  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final OTPTextFieldScheme? scheme;

  @override
  State<StatefulWidget> createState() => _OTPTextFieldState();
}

class _OTPTextFieldState extends State<OTPTextField>
    with SingleTickerProviderStateMixin {
  FocusNode? _focusNode;
  FocusNode get _effectiveFocusNode =>
      widget.focusNode ?? (_focusNode ??= FocusNode());
  bool _hasFocus = false;

  String get _placeHolderText =>
      widget.placeHolderText.isNotEmpty ? widget.placeHolderText : '';

  late OTPTextFieldScheme scheme;

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
    scheme = widget.scheme ?? OTPTextFieldScheme(theme: theme);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
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
                        controller: widget.controller,
                        focusNode: _effectiveFocusNode,
                        textAlign: TextAlign.center,
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
                        onChanged: (String text) => _onChanged(text: text),
                        enabled: widget.state != TextInputState.disabled,
                        readOnly: widget.state == TextInputState.readOnly,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        TextFieldSeparator(
          widget.state,
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
