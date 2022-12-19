import 'dart:async';

import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

typedef InputNumberCallback = void Function(double rating);

class InputNuber extends StatefulWidget {
  /// Creates a SecondaryButton.
  const InputNuber({
    super.key,
    required this.onInputNumber,
    this.title = '',
    this.isEnable = true,
    this.minimumValue = 0,
    this.maximumValue = 100,
    this.stepValue = 1,
    this.style = InputNumberButtonStyle.normal,
    this.scheme,
  });

  final String title;
  final bool isEnable;
  final double minimumValue;
  final double maximumValue;
  final double stepValue;
  final InputNumberCallback onInputNumber;
  final InputNumberButtonStyle style;
  final InputNumberScheme? scheme;

  @override
  State<InputNuber> createState() => _InputNuberState();
}

class _InputNuberState extends State<InputNuber> {
  Timer? timer;
  late InputNumberScheme scheme;
  double _numberValue = 0;

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

  void minusButton() {
    setState(() {
      if (_numberValue - 1 < widget.minimumValue) {
        _numberValue = widget.minimumValue;
      } else {
        _numberValue -= 1;
      }
    });
  }

  void plusButton() {
    setState(() {
      if (_numberValue + 1 > widget.maximumValue) {
        _numberValue = widget.maximumValue;
      } else {
        _numberValue += 1;
      }
    });
  }

  void longPressPlusButton() {
    timer = Timer.periodic(const Duration(milliseconds: 250), (_) {
      plusButton();
    });
  }

  void longPressMinusButton() {
    timer = Timer.periodic(const Duration(milliseconds: 250), (_) {
      minusButton();
    });
  }

  void longPressButtonCancel() {
    timer?.cancel();
  }
}
