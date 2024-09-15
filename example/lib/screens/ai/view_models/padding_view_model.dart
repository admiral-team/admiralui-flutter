import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';

class PaddingWidgetViewModel with IDModelMixin {
  PaddingWidgetViewModel({
    required this.style,
    required String id,
  }) {
    this.id = id;
  }
  final PaddingStyle style;
}
