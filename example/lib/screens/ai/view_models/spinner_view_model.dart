import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';

class SpinnerViewModel with IDModelMixin {
    SpinnerViewModel({
    required String id,
    required this.style,
    required this.size,
  }) {
    this.id = id;
  }

   final SpinnerStyle style;
   final SpinnerSize size;

}