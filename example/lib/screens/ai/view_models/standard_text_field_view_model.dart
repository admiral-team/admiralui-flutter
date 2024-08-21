import 'package:admiralui_flutter/admiralui_flutter.dart';

import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/layout_model_interface.dart';
import 'package:flutter/material.dart';

class StandardTextFieldViewModel
    with LayoutModelMixin, IDModelMixin {
  StandardTextFieldViewModel({
    required String id,
    required this.controller,
    this.labelText = '',
    this.placeHolderText = '',
    this.informerText,
    this.state = TextInputState.normal,
    this.isSecure = false,
    this.numberOfLines = 1,
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
  final bool isSecure;
  final int? numberOfLines;
}
