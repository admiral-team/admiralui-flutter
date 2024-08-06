import 'package:example/screens/ai/view_models/interfaces/container_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/layout_model_interface.dart';

class RowViewModel with LayoutModelMixin, IDModelMixin, ContainerModelMixin {
  RowViewModel({
    required this.items,
    required String id,
    double? width,
    double? height,
  }) {
    this.id = id;
    this.width = width;
    this.height = height;
  }

  final List<dynamic> items;
}