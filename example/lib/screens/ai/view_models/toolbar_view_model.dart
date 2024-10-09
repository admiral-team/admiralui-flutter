import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:example/screens/ai/view_models/interfaces/action_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/actions/action_item_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';

class ToolbarViewModel with IDModelMixin, ActionModelMixin {
  ToolbarViewModel({
    required String id,
    required this.items,
    required this.selectedIndex,
    List<ActionItemModelInterface>? actions,
  }) {
    this.id = id;
    this.actions = actions
        ?.where(
            (ActionItemModelInterface action) => action.actionName == 'didTap')
        .toList();
  }

  final List<ToolbarItem> items;
  final int selectedIndex;
}
