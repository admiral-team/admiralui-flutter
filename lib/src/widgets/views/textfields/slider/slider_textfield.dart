import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class SliderTextField extends StatefulWidget {
  const SliderTextField(
    this.controller, {
    this.state = TextInputState.normal,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.labelText = '',
    this.trailingText = '',
    this.placeHolderText = '',
    this.minLabelText = 0,
    this.maxLabelText = 100,
    this.divisions = 100,
    this.currentValue = 0,
    this.informerText,
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
  final String trailingText;
  final String? informerText;
  final String placeHolderText;
  final double minLabelText;
  final double maxLabelText;
  final int divisions;
  final double currentValue;

  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final InputRangeTextFieldScheme? scheme;

  @override
  State<StatefulWidget> createState() => _SliderTextFieldState();
}

class _SliderTextFieldState extends State<SliderTextField>
    with SingleTickerProviderStateMixin {
  FocusNode? _focusNode;
  FocusNode get _effectiveFocusNode =>
      widget.focusNode ?? (_focusNode ??= FocusNode());
  bool _hasFocus = false;

  String get _textFieldText => widget.controller.text;
  String get _placeHolderText =>
      _isTextFieldActive && widget.placeHolderText.isNotEmpty
          ? widget.placeHolderText
          : '';
  bool get _isTextFieldActive => _hasFocus || _textFieldText.isNotEmpty;

  late double _currentSliderValue;
  late InputRangeTextFieldScheme scheme;

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
    scheme = widget.scheme ?? InputRangeTextFieldScheme(theme: theme);
    _currentSliderValue = widget.currentValue;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextView(
                    widget.labelText,
                    font: scheme.labelFont,
                    textColorNormal:
                        scheme.labelTextColor.unsafeParameter(widget.state),
                  ),
                  Row(
                    children: <Widget>[
                      IntrinsicWidth(
                        child: TextFormField(
                          controller: widget.controller,
                          focusNode: _effectiveFocusNode,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight:
                                scheme.textFieldScheme.textFieldFont.fontWeight,
                            fontFamily:
                                scheme.textFieldScheme.textFieldFont.fontFamily,
                            fontSize:
                                scheme.textFieldScheme.textFieldFont.fontSize,
                            color:
                                scheme.textColor.unsafeParameter(widget.state),
                          ),
                          keyboardType: widget.keyboardType,
                          decoration: InputDecoration(
                            hintText:
                                _textFieldText.isEmpty ? _placeHolderText : '',
                            border: InputBorder.none,
                            isDense: true,
                            hintStyle: TextStyle(
                              fontWeight: scheme
                                  .textFieldScheme.placeholderFont.fontWeight,
                              fontFamily: scheme
                                  .textFieldScheme.placeholderFont.fontFamily,
                              fontStyle: FontStyle.normal,
                              fontSize: scheme
                                  .textFieldScheme.placeholderFont.fontSize,
                              color: scheme.textFieldScheme.placeholderColor,
                            ),
                          ),
                          onChanged: (String text) => _onChanged(text: text),
                          enabled: widget.state != TextInputState.disabled,
                          readOnly: widget.state == TextInputState.readOnly,
                        ),
                      ),
                      if (_textFieldText.isNotEmpty)
                        TextView(
                          widget.trailingText,
                          font: scheme.leadingTextFont,
                          textColorNormal: scheme.leadingTextColor
                              .unsafeParameter(widget.state),
                        ),
                    ],
                  ),
                  SliderWidget(
                    isEnabled: widget.state != TextInputState.disabled,
                    min: widget.minLabelText,
                    max: widget.maxLabelText,
                    divisions: widget.divisions,
                    currentSliderValue: _currentSliderValue,
                    onChanged: (double value) =>
                        widget.controller.text = '${value.toInt()}',
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            TextView(
              widget.minLabelText.toInt().toString(),
              font: scheme.valueFont,
              textColorNormal:
                  scheme.valueTextColor.unsafeParameter(widget.state),
            ),
            const Spacer(),
            TextView(
              widget.maxLabelText.toInt().toString(),
              font: scheme.valueFont,
              textColorNormal:
                  scheme.valueTextColor.unsafeParameter(widget.state),
            ),
          ],
        ),
        const SizedBox(height: LayoutGrid.doubleModule),
        if (widget.informerText != null &&
            widget.informerText?.isEmpty == false)
          TextView(
            widget.informerText!,
            font: scheme.textFieldScheme.informerFont,
            textColorNormal: scheme.textFieldScheme.infomerLabelColor
                .unsafeParameter(widget.state),
          ),
      ],
    );
  }
}
