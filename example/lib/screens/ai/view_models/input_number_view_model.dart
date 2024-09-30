import 'package:admiralui_flutter/admiralui_flutter.dart';

import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/layout_model_interface.dart';

class InputNumberViewModel
    with LayoutModelMixin, IDModelMixin {
  InputNumberViewModel({
    required String id,
    required this.title,
    required this.isEnabled,
    required this.minimumValue,
    required this.maximumValue,
    required this.numberValue,
    required this.stepValue,
    required this.style,
  }) {
    this.id = id;
  }

  final String title;
  final bool isEnabled;
  final double minimumValue;
  final double maximumValue;
  final double numberValue;
  final double stepValue;
  final InputNumberButtonStyle style;
}