import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:example/screens/ai/view_models/interfaces/action_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/actions/action_item_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';

class InformerTabsViewModel with IDModelMixin, ActionModelMixin {
  InformerTabsViewModel({
    required this.tabs,
    required this.isEnabled,
    required this.selectedIndex,
    required String id,
    List<ActionItemModelInterface>? actions,
    this.paddingHorizontal = 0.0,
  }) {
    this.id = id;
    this.actions = actions;
  }

  final List<InformerTabItem> tabs;
  final bool isEnabled;
  final int selectedIndex;
  final double paddingHorizontal;
}
