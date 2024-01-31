import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

enum TextInputState { normal, error, disabled, readOnly }

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(
    this.controller, {
    this.state = TextInputState.normal,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.labelText = '',
    this.informerText,
    this.placeHolderText = '',
    this.hasSecure,
    this.trailingIcon,
    this.bottomWidget,
    this.onTrailingTap,
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
  final String labelText;
  final String? informerText;
  final String placeHolderText;
  final bool? hasSecure;
  final Icon? trailingIcon;
  final Widget? bottomWidget;

  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onTrailingTap;
  final TextFieldScheme? scheme;

  @override
  State<StatefulWidget> createState() => _TextFieldState();
}

class _TextFieldState extends State<TextFieldWidget>
    with SingleTickerProviderStateMixin {
  FocusNode? _focusNode;
  FocusNode get _effectiveFocusNode =>
      widget.focusNode ?? (_focusNode ??= FocusNode());
  bool _hasFocus = false;
  bool _isSecure = false;

  String get _textFieldText => widget.controller.text;
  String get _labelText => widget.labelText;
  String get _placeHolderText =>
      _isTextFieldActive && widget.placeHolderText.isNotEmpty
          ? widget.placeHolderText
          : '';

  bool get _isTextFieldActive => _hasFocus || _textFieldText.isNotEmpty;
  bool get _isLabelVisible => widget.labelText.isNotEmpty;

  late TextFieldScheme scheme;

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
    });
  }

  void _onChanged({required String text}) {
    setState(() {});
    widget.onChanged?.call(text);
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? TextFieldScheme(theme: theme);
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
                        obscureText: _isSecure,
                        controller: widget.controller,
                        focusNode: _effectiveFocusNode,
                        textAlign: TextAlign.left,
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
                  if (_isLabelVisible)
                    TextFieldAnimatedLabel(
                      widget.state,
                      _effectiveFocusNode,
                      _labelText,
                      isTextFieldActive: _isTextFieldActive,
                      hasFocus: _hasFocus,
                    ),
                ],
              ),
            ),
            if (widget.hasSecure == true)
              AbsorbPointer(
                absorbing: widget.state == TextInputState.disabled,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isSecure = !_isSecure;
                    });
                  },
                  child: SizedBox(
                    height: LayoutGrid.quadrupleModule,
                    width: LayoutGrid.quadrupleModule,
                    child: _isSecure
                        ? Icon(
                            AdmiralIcons.admiral_ic_eye_close_outline,
                            color:
                                scheme.iconColor.unsafeParameter(widget.state),
                          )
                        : Icon(
                            AdmiralIcons.admiral_ic_eye_outline,
                            color:
                                scheme.iconColor.unsafeParameter(widget.state),
                          ),
                  ),
                ),
              ),
            if (widget.trailingIcon != null)
              AbsorbPointer(
                absorbing: widget.state == TextInputState.disabled,
                child: GestureDetector(
                  onTap: () {
                    widget.onTrailingTap?.call();
                  },
                  child: SizedBox(
                    height: LayoutGrid.quadrupleModule,
                    width: LayoutGrid.quadrupleModule,
                    child: Icon(
                      widget.trailingIcon?.icon,
                      color: scheme.iconColor.unsafeParameter(widget.state),
                    ),
                  ),
                ),
              ),
          ],
        ),
        TextFieldSeparator(
          widget.state,
          isEditing: _hasFocus,
        ),
        if (widget.bottomWidget != null)
          const SizedBox(height: LayoutGrid.module),
        Container(child: widget.bottomWidget),
        const SizedBox(height: LayoutGrid.module),
        if (widget.informerText != null &&
            widget.informerText?.isEmpty == false)
          TextView(
            widget.informerText!,
            font: scheme.informerFont,
            textColorNormal:
                scheme.infomerLabelColor.unsafeParameter(widget.state),
          ),
      ],
    );
  }
}
