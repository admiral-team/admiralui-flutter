import 'package:example/screens/ai/view_models/interfaces/action_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/actions/action_item_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/container_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/layout_model_interface.dart';

class StandardTabsViewModel 
with LayoutModelMixin, IDModelMixin, ContainerModelMixin, ActionModelMixin {
  StandardTabsViewModel({
    required this.items,
    required String id,
    List<ActionItemModelInterface>? actions,
    double? width,
    double? height,
  }) {
    this.id = id;
    this.actions = actions;
    this.width = width;
    this.height = height;
  }

  final List<String> items;
}