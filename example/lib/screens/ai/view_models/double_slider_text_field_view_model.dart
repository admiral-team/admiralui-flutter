import 'package:admiralui_flutter/admiralui_flutter.dart';

import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/layout_model_interface.dart';
import 'package:flutter/material.dart';

class DoubleSliderTextFieldViewModel
    with LayoutModelMixin, IDModelMixin {
  DoubleSliderTextFieldViewModel({
    required String id,
    required this.leadingController,
    required this.trailingController,
    required this.divisions,
    required this.placeholderFrom,
    required this.placeholderTo,
    this.labelText = '',
    this.trailingText,
    this.minValue,
    this.maxValue,

    this.currentRangeValues,
    this.informerText,
    this.state = TextInputState.normal,
    double? width,
    double? height,
  }) {
    this.id = id;
    this.width = width;
    this.height = height;
  }

  final TextEditingController leadingController;
  final TextEditingController trailingController;
  final TextInputState state;
  final String labelText;
  final String? informerText;
  final String? trailingText;
  final double? minValue;
  final double? maxValue;
  final int divisions;
  final RangeValues? currentRangeValues;
  final String placeholderFrom;
  final String placeholderTo;
}
