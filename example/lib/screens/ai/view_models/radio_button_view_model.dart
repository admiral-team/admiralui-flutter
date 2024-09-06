import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:example/screens/ai/view_models/interfaces/action_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/actions/action_item_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';

class RadioButtonViewModel with IDModelMixin, ActionModelMixin {
  RadioButtonViewModel({
    this.items,
    this.selectedValues,
    this.style,
    this.isEnabled,
    this.sizeType,
    required String id,
    List<ActionItemModelInterface>? actions,
  }) {
    this.id = id;
    this.actions = actions
        ?.where(
            (ActionItemModelInterface action) => action.actionName == 'didTap')
        .toList();
  }

  final List<String>? items;
  final List<String>? selectedValues;
  final RadioButtonStyle? style;
  final bool? isEnabled;
  final ButtonSizeType? sizeType;
}
