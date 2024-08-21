import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/layout_model_interface.dart';

class TextViewModel with LayoutModelMixin, IDModelMixin {
  TextViewModel({
    required this.text,
    required String id,
    double? width,
    double? height,
  }) {
    this.id = id;
    this.width = width;
    this.height = height;
  }

  final String text;
}
