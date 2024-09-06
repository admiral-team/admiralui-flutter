import 'package:example/screens/ai/view_models/interfaces/action_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/actions/action_item_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';

class ButtonDropDownViewModel with IDModelMixin, ActionModelMixin {
  ButtonDropDownViewModel({
    this.buttonTitle,
    required this.isEnabled,
    required String id,
    List<ActionItemModelInterface>? actions,
  }) {
    this.id = id;
    this.actions = actions
        ?.where(
            (ActionItemModelInterface action) => action.actionName == 'didTap')
        .toList();
  }
  final String? buttonTitle;
  final bool isEnabled;
}
