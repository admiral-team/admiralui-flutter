import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:example/screens/ai/view_models/interfaces/action_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/actions/action_item_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';

class UnderlineTabsViewModel with IDModelMixin, ActionModelMixin {
  UnderlineTabsViewModel({
    required this.tabs,
    required this.isEnabled,
    required this.selectedIndex,
    required String id,
    List<ActionItemModelInterface>? actions,
    this.isCenterTabs = false,
    this.horizontalPadding = 0.0,
  }) {
    this.id = id;
    this.actions = actions;
  }

  final List<UnderlineTabItem> tabs;
  final bool isEnabled;
  final int selectedIndex;
  final bool isCenterTabs;
  final double horizontalPadding;
}
