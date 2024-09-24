import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';

class BadgeViewModel with IDModelMixin {
  BadgeViewModel({
    required String id,
    this.isEnabled = true,
    this.title,
    this.style = BadgeStyle.normal,
  }) {
    this.id = id;
  }

  bool isEnabled;
  String? title;
  BadgeStyle style;
}
