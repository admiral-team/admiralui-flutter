import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';
import 'package:flutter/material.dart';

class IconViewModel with IDModelMixin {
  IconViewModel({
    required String id,
    IconData? iconData,
    double? size,
    Color? color,
  }) {
    this.id = id;
    this.iconData = iconData;
    this.size = size;
    this.color = color;
  }

  IconData? iconData;
  double? size;
  Color? color;
}
