// ignore_for_file: avoid_print

import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///  An object that displays an editable text area and slider.
///
/// Constructor:
/// ```
/// SliderTextField(
///   TextEditingController controller,
///   TextInputState state,
///   FocusNode? focusNode
///   TextInputType? keyboardType
///   TextInputAction? textInputAction
///   String labelText
///   String trailingText
///   String placeHolderText
///   double minLabelText
///   double maxLabelText
///   int divisions
///   double currentValue
///   ValueChanged<String>? onChanged
///   VoidCallback? onEditingComplete
///   InputRangeTextFieldScheme? scheme
/// )
/// ```
///
/// Parameters:
/// - `controller`: Textfield text editing controller.
/// - `state`: The current state of textfield.
/// - `focusNode`: An object that can be used by a stateful widget to obtain
/// the keyboard focus and to handle keyboard events.
/// - `keyboardType`: The type of information for which to optimize
/// the text input control.
/// - `textInputAction`: An action the user has requested the text input
/// control to perform.
/// - `labelText`: The text of the label at the left edge.
/// - `trailingText`: The text of the label at the right edge.
/// - `placeHolderText`: The placeholder of textfield.
/// - `minLabelText`:  The minimum value of slider.
/// - `maxLabelText`: The maximum value of slider.
/// - `divisions`: The number of discrete divisions.
/// - `currentValue`: The current value of slider.
/// - `onChanged`: The closure that return textfield text.
/// - `onEditingComplete`: The closure that calls when textfield text changes.
/// SliderTextField.
/// - `key`: An optional key to uniquely identify this widget.
///
/// Example usage:
/// ```dart
///SliderTextField(
///   textController,
///   state: state,
///   focusNode: focusNode,
///   labelText: 'Optional label',
///   trailingText: '₽',
///   placeHolderText: 'placeholder',
///   informerText: 'Additional text',
///   minLabelText: 0.0,
///   maxLabelText: 100.0,
///   divisions: 100,
///   currentValue: _currentSliderValue,
///),
/// ```
///
class SliderTextField extends StatefulWidget {
  const SliderTextField(
    this.controller, {
    this.state = TextInputState.normal,
    this.focusNode,
    this.keyboardType = TextInputType.number,
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

  late ValueNotifier<double> notifier;

  @override
  void initState() {
    super.initState();
    notifier = ValueNotifier<double>(widget.currentValue);
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
    try {
      if (text.isNotEmpty) {
        final double currentTextValue = double.parse(text);
        if (currentTextValue >= widget.minLabelText &&
            currentTextValue <= widget.maxLabelText) {
          setState(() {
            _currentSliderValue = currentTextValue;
          });

          notifier.value = currentTextValue;
          widget.onChanged?.call(text);
        } else if (currentTextValue > widget.maxLabelText) {
          setState(() {
            _currentSliderValue = widget.maxLabelText;
            notifier.value = widget.maxLabelText;
            widget.controller.text = '${widget.maxLabelText.toInt()}';
          });
        } else if (currentTextValue < widget.minLabelText) {
          setState(() {
            _currentSliderValue = widget.minLabelText;
            notifier.value = widget.minLabelText;
            widget.controller.text = '${widget.minLabelText.toInt()}';
          });
        }
      }
    } catch (e) {
      print('Invalid input string $text');
    }
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
                        child: TextField(
                          controller: widget.controller,
                          focusNode: _effectiveFocusNode,
                          textAlign: TextAlign.left,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d*'),
                            ),
                          ],
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
                          keyboardType: const TextInputType.numberWithOptions(
                            signed: true,
                            decimal: true,
                          ),
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
                      if (widget.trailingText.isNotEmpty)
                        Container(
                          padding: const EdgeInsets.only(
                            top: LayoutGrid.halfModule / 2,
                          ),
                          child: TextView(
                            widget.trailingText,
                            font: scheme.leadingTextFont,
                            textColorNormal: scheme.leadingTextColor
                                .unsafeParameter(widget.state),
                            textColorDisabled: scheme.leadingTextColor
                                .unsafeParameter(widget.state),
                          ),
                        ),
                      const Spacer(),
                      Icon(
                        AdmiralIcons.admiral_ic_info_outline,
                        size: LayoutGrid.halfModule * 7,
                        color: scheme.iconColor.color(),
                      ),
                    ],
                  ),
                  SliderWidget(
                    isEnabled: widget.state != TextInputState.disabled,
                    min: widget.minLabelText,
                    max: widget.maxLabelText,
                    divisions: widget.divisions,
                    currentSliderValue: _currentSliderValue,
                    textFieldChange: notifier,
                    onChanged: (double value) => setState(() {
                      _currentSliderValue = value;
                      widget.controller.text = '${value.toInt()}';
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: LayoutGrid.module),
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
        const SizedBox(height: LayoutGrid.halfModule * 3),
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
