import 'dart:ui';

import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/layout_model_interface.dart';

class TitleHeaderWidgetViewModel with LayoutModelMixin, IDModelMixin {
    TitleHeaderWidgetViewModel({
    required String id,
    required this.text,
    required this.style,
    required this.textAlign,
    double? width,
    double? height,
  }) {
    this.id = id;
    this.width = width;
    this.height = height;
  }
  final String text;
  final TitleHeaderStyle style;
  final TextAlign textAlign;
}