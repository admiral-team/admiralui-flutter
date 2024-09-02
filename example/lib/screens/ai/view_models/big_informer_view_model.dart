import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/layout_model_interface.dart';

class BigInformerViewModel with LayoutModelMixin, IDModelMixin {
  BigInformerViewModel({
    required this.title,
    required this.subtitle,
    required this.style,
    required bool this.isEnabled,
    required String id,
    this.linkText,
    double? width,
    double? height,
  }) {
    this.id = id;
    this.width = width;
    this.height = height;
  }

  final String title;
  final String subtitle;
  final String? linkText;
  final InformerStyle style;
  final bool isEnabled;
}
