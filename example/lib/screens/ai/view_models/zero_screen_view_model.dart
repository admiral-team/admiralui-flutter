import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/layout_model_interface.dart';

class ZeroScreenViewModel with LayoutModelMixin, IDModelMixin {
    ZeroScreenViewModel({
    required String id,
    required this.title,
    required this.subtitle,
    required this.buttonTitle,
    required this.isEnabled,
    double? width,
    double? height,
  }) {
    this.id = id;
    this.width = width;
    this.height = height;
  }
  final String title;
  final String subtitle;
  final String buttonTitle;
  final bool isEnabled;
}