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
    this.numberValue = 0,
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
  final double numberValue;
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
  double _numberValue = 0;

  String get _placeHolderText =>
      widget.placeHolderText.isNotEmpty ? widget.placeHolderText : '';

  bool get _minusButtonEnabled =>
      // ignore: avoid_bool_literals_in_conditional_expressions
      widget.minimumValue >= _numberValue ? false : true;
  bool get _plusButtonEnabled =>
      // ignore: avoid_bool_literals_in_conditional_expressions
      widget.maximumValue <= _numberValue ? false : true;

  @override
  void initState() {
    super.initState();
    _numberValue = widget.numberValue;
  }

  void _onChanged({required String text}) {
    setState(() {});
    widget.onChanged?.call(text);
    final String str = text.replaceAll(' ', '');
    if (double.tryParse(str) != null) {
      final double textFieldValue = double.parse(str);
      // ignore: lines_longer_than_80_chars
      if (textFieldValue >= widget.minimumValue &&
          textFieldValue <= widget.maximumValue) {
        _numberValue = textFieldValue;
      } else if (textFieldValue < widget.minimumValue) {
        _numberValue = widget.minimumValue;
        widget.controller.text = _numberValue.toInt().toString();
      } else if (textFieldValue > widget.maximumValue) {
        _numberValue = widget.maximumValue;
        widget.controller.text = _numberValue.toInt().toString();
      }
    }
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
          onPressed: minusButton,
          onLongPress: longPressMinusButton,
          onLongPressCancel: longPressButtonCancel,
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
          onPressed: plusButton,
          onLongPress: longPressPlusButton,
          onLongPressCancel: longPressButtonCancel,
        ),
      ],
    );
  }

  void setStepValue() {
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

  void minusButton() {
    setState(() {
      if (_numberValue - inputStepValue < widget.minimumValue) {
        _numberValue = widget.minimumValue;
      } else {
        _numberValue -= inputStepValue;
      }
      widget.controller.text = _numberValue.toInt().toString();
    });
  }

  void plusButton() {
    setState(() {
      if (_numberValue + inputStepValue > widget.maximumValue) {
        _numberValue = widget.maximumValue;
      } else {
        _numberValue += inputStepValue;
      }
      widget.controller.text = _numberValue.toInt().toString();
    });
  }

  void longPressPlusButton() {
    timer = Timer.periodic(const Duration(milliseconds: 250), (_) {
      setStepValue();
      plusButton();
    });
  }

  void longPressMinusButton() {
    timer = Timer.periodic(const Duration(milliseconds: 250), (_) {
      setStepValue();
      minusButton();
    });
  }

  void longPressButtonCancel() {
    timer?.cancel();
    runCount = 0;
    inputStepValue = widget.stepValue;
  }
}
