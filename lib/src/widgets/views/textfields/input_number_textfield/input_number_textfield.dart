import 'dart:async';

import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputNumberTextField extends StatefulWidget {
  /// Creates a InputNumberTextField.
  const InputNumberTextField(
    this.controller,
    this.onChangedValue, {
    this.state = TextInputState.normal,
    this.focusNode,
    this.keyboardType = TextInputType.number,
    this.title = '',
    this.placeHolderText = '',
    this.minimumValue = 0,
    this.maximumValue = 100,
    this.currentValue = 0,
    this.stepValue = 1,
    this.onChanged,
    this.style = InputNumberButtonStyle.normal,
    this.scheme,
  });

  final TextEditingController controller;
  final TextInputState state;
  final String title;
  final String placeHolderText;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final double minimumValue;
  final double maximumValue;
  final double currentValue;
  final double stepValue;
  final InputNumberCallback? onChangedValue;
  final ValueChanged<String>? onChanged;
  final InputNumberButtonStyle style;
  final InputNumberTextfieldScheme? scheme;

  @override
  State<InputNumberTextField> createState() => _InputNumberTextfieldState();
}

class _InputNumberTextfieldState extends State<InputNumberTextField> {
  FocusNode? _focusNode;
  FocusNode get _effectiveFocusNode =>
      widget.focusNode ?? (_focusNode ??= FocusNode());
  double countTick = 0.25;
  double firstStepMultiplier = 5;
  double secondStepMultiplier = 10;
  double thirdStepMultiplier = 100;

  double runCount = 0;
  double inputStepValue = 1;
  Timer? timer;
  late InputNumberTextfieldScheme scheme;
  double _currentValue = 0;

  String get _placeHolderText =>
      widget.placeHolderText.isNotEmpty ? widget.placeHolderText : '';

  bool get _minusButtonEnabled =>
      // ignore: avoid_bool_literals_in_conditional_expressions
      widget.minimumValue >= _currentValue ? false : true;
  bool get _plusButtonEnabled =>
      // ignore: avoid_bool_literals_in_conditional_expressions
      widget.maximumValue <= _currentValue ? false : true;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.currentValue;
    _setTextfieldText(_currentValue);
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? InputNumberTextfieldScheme(theme: theme);

    final Color? textColor = scheme.inputTextColor.parameter(
      widget.state == TextInputState.normal
          ? ControlState.normal
          : ControlState.disabled,
    );

    return Row(
      children: <Widget>[
        TextView(
          widget.title,
          font: scheme.font,
          textColorNormal: textColor,
          textColorDisabled: textColor,
          maxLines: 1,
        ),
        const Spacer(),
        InputNumberTextFieldButton(
          // ignore: avoid_bool_literals_in_conditional_expressions
          isEnable: widget.state == TextInputState.disabled
              ? false
              : _minusButtonEnabled,
          image: AdmiralIcons.admiral_ic_minus_outline,
          onPressed: _minusButton,
          onLongPress: _longPressMinusButton,
          onLongPressCancel: _longPressButtonCancel,
        ),
        const SizedBox(
          width: LayoutGrid.halfModule / 2,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 48.0, maxWidth: 102),
          child: IntrinsicWidth(
            child: TextFormField(
              controller: widget.controller,
              focusNode: _effectiveFocusNode,
              textAlign: TextAlign.center,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(
                  RegExp('[0-9]'),
                ),
              ],
              style: TextStyle(
                fontWeight: scheme.textFieldScheme.textFieldFont.fontWeight,
                fontFamily: scheme.textFieldScheme.textFieldFont.fontFamily,
                fontSize: scheme.textFieldScheme.textFieldFont.fontSize,
                color: scheme.textFieldScheme.textColor
                    .unsafeParameter(widget.state),
              ),
              keyboardType: widget.keyboardType,
              decoration: InputDecoration(
                hintText: _placeHolderText,
                border: InputBorder.none,
                isDense: true,
                fillColor: scheme.textFieldBackground.parameter(widget.state),
                filled: true,
                hintStyle: TextStyle(
                  fontWeight: scheme.textFieldScheme.placeholderFont.fontWeight,
                  fontFamily: scheme.textFieldScheme.placeholderFont.fontFamily,
                  fontStyle: FontStyle.normal,
                  fontSize: scheme.textFieldScheme.placeholderFont.fontSize,
                  color: scheme.textFieldScheme.placeholderColor,
                ),
              ),
              onChanged: (String text) => _onChanged(text: text),
              enabled: widget.state != TextInputState.disabled,
              readOnly: widget.state == TextInputState.readOnly,
            ),
          ),
        ),
        const SizedBox(
          width: LayoutGrid.halfModule / 2,
        ),
        InputNumberTextFieldButton(
          // ignore: avoid_bool_literals_in_conditional_expressions
          isEnable: widget.state == TextInputState.disabled
              ? false
              : _plusButtonEnabled,
          image: AdmiralIcons.admiral_ic_plus_outline,
          style: InputNumberTextfieldButtonStyle.right,
          onPressed: _plusButton,
          onLongPress: _longPressPlusButton,
          onLongPressCancel: _longPressButtonCancel,
        ),
      ],
    );
  }

  void _onChanged({required String text}) {
    widget.onChanged?.call(text);
    final String formatedString = text.replaceAll(' ', '');
    if (double.tryParse(formatedString) != null) {
      final double textFieldDoubleValue = double.parse(formatedString);
      if (textFieldDoubleValue >= widget.minimumValue &&
          textFieldDoubleValue <= widget.maximumValue) {
        _setTextfieldText(textFieldDoubleValue);
      } else if (textFieldDoubleValue < widget.minimumValue) {
        _setTextfieldText(widget.minimumValue);
      } else if (textFieldDoubleValue > widget.maximumValue) {
        _setTextfieldText(widget.maximumValue);
      }
      _setTextFieldCursor();
    }
  }

  void _setTextfieldText(double formatedValue) {
    _currentValue = formatedValue;
    widget.controller.text =
        _getFormatedValue(formatedValue.toInt().toString());
  }

  void _setTextFieldCursor() {
    widget.controller.selection = TextSelection.fromPosition(
      TextPosition(offset: widget.controller.text.length),
    );
  }

  String _getFormatedValue(String textValue) {
    final List<String> chars = textValue.split('');
    const String separator = ' ';
    String newString = '';
    if (textValue.endsWith(separator)) {
      newString = textValue.substring(0, textValue.length - 1);
    }

    for (int i = chars.length - 1; i >= 0; i--) {
      if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1) {
        newString = separator + newString;
      }
      newString = chars[i] + newString;
    }
    return newString;
  }

  void _setStepValue() {
    runCount += countTick;
    if (runCount < countTick * 5) {
      inputStepValue = widget.stepValue;
    } else if (runCount >= countTick * 5 && runCount < countTick * 12) {
      inputStepValue = widget.stepValue * firstStepMultiplier;
    } else if (runCount >= countTick * 12 && runCount < countTick * 20) {
      inputStepValue = widget.stepValue + secondStepMultiplier;
    } else {
      inputStepValue = widget.stepValue * thirdStepMultiplier;
    }
  }

  void _minusButton() {
    setState(() {
      if (_currentValue - inputStepValue < widget.minimumValue) {
        _currentValue = widget.minimumValue;
      } else {
        _currentValue -= inputStepValue;
      }
      _setTextfieldText(_currentValue);
      _setTextFieldCursor();
    });
  }

  void _plusButton() {
    setState(() {
      if (_currentValue + inputStepValue > widget.maximumValue) {
        _currentValue = widget.maximumValue;
      } else {
        _currentValue += inputStepValue;
      }
      _setTextfieldText(_currentValue);
      _setTextFieldCursor();
    });
  }

  void _longPressPlusButton() {
    timer = Timer.periodic(const Duration(milliseconds: 250), (_) {
      _setStepValue();
      _plusButton();
    });
  }

  void _longPressMinusButton() {
    timer = Timer.periodic(const Duration(milliseconds: 250), (_) {
      _setStepValue();
      _minusButton();
    });
  }

  void _longPressButtonCancel() {
    timer?.cancel();
    runCount = 0;
    inputStepValue = widget.stepValue;
  }
}
