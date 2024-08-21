import 'package:example/screens/ai/view_models/interfaces/container_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';

class ExpandedViewModel with IDModelMixin, ContainerModelMixin {
  ExpandedViewModel({
    required this.child,
    required String id,
  }) {
    this.id = id;
  }

  final dynamic child;
}
