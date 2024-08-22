import 'package:admiralui_flutter/admiralui_flutter.dart';

import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/layout_model_interface.dart';
import 'package:flutter/material.dart';

class SliderTextFieldViewModel
    with LayoutModelMixin, IDModelMixin {
  SliderTextFieldViewModel({
    required String id,
    required this.controller,
    required this.divisions,
    this.labelText = '',
    this.placeHolderText = '',
    this.trailingText,
    this.minLabelText,
    this.maxLabelText,

    this.currentSliderValue,
    this.informerText,
    this.state = TextInputState.normal,
    double? width,
    double? height,
  }) {
    this.id = id;
    this.width = width;
    this.height = height;
  }

  final TextEditingController controller;
  final TextInputState state;
  final String labelText;
  final String placeHolderText;
  final String? informerText;
  final String? trailingText;
  final double? minLabelText;
  final double? maxLabelText;
  final int divisions;
  final double? currentSliderValue;
}
