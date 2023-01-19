import 'dart:async';

import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

typedef InputNumberCallback = void Function(double value);

class InputNumber extends StatefulWidget {
  /// Creates a SecondaryButton.
  const InputNumber({
    super.key,
    this.onChangedValue,
    this.title = '',
    this.isEnable = true,
    this.minimumValue = 0,
    this.maximumValue = 100,
    this.numberValue = 0,
    this.stepValue = 1,
    this.style = InputNumberButtonStyle.normal,
    this.scheme,
  });

  final String title;
  final bool isEnable;
  final double minimumValue;
  final double maximumValue;
  final double numberValue;
  final double stepValue;
  final InputNumberCallback? onChangedValue;
  final InputNumberButtonStyle style;
  final InputNumberScheme? scheme;

  @override
  State<InputNumber> createState() => _InputNumberState();
}

class _InputNumberState extends State<InputNumber> {
  double countTick = 0.25;
  double firstStepMultiplier = 5;
  double secondStepMultiplier = 10;
  double thirdStepMultiplier = 100;

  double runCount = 0;
  double inputStepValue = 1;
  Timer? timer;
  late InputNumberScheme scheme;
  double _numberValue = 0;

  @override
  void initState() {
    super.initState();
    _numberValue = widget.numberValue;
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? InputNumberScheme(theme: theme);

    final Color? textColor = scheme.inputTextColor.parameter(
      widget.isEnable ? ControlState.normal : ControlState.disabled,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextView(
          widget.title,
          font: scheme.font,
          textColorNormal: textColor,
          textColorDisabled: textColor,
          maxLines: 1,
        ),
        const Spacer(),
        InputNumberButton(
          isEnable: widget.isEnable,
          image: AdmiralIcons.admiral_ic_minus_outline,
          style: widget.style,
          onPressed: minusButton,
          onLongPress: longPressMinusButton,
          onLongPressCancel: longPressButtonCancel,
        ),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: LayoutGrid.doubleModule),
          child: TextView(
            _numberValue.toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), ''),
            font: scheme.font,
            textColorNormal: textColor,
            textColorDisabled: textColor,
            maxLines: 1,
          ),
        ),
        InputNumberButton(
          isEnable: widget.isEnable,
          image: AdmiralIcons.admiral_ic_plus_outline,
          style: widget.style,
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
      widget.onChangedValue?.call(_numberValue);
    });
  }

  void plusButton() {
    setState(() {
      if (_numberValue + inputStepValue > widget.maximumValue) {
        _numberValue = widget.maximumValue;
      } else {
        _numberValue += inputStepValue;
      }
      widget.onChangedValue?.call(_numberValue);
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
