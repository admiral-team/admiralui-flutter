import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:example/screens/ai/view_models/interfaces/action_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/actions/action_item_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';

class OutlineTabsViewModel with IDModelMixin, ActionModelMixin {
  OutlineTabsViewModel({
    required this.tabs,
    required this.selectedIndex,
    required this.isEnabled,
    required String id,
    List<ActionItemModelInterface>? actions,
    this.horizontalPadding = 0.0,
  }) {
    this.id = id;
    this.actions = actions;
  }

  final List<OutlineTabItem> tabs;
  final int selectedIndex;
  final bool isEnabled;
  final double horizontalPadding;
}
