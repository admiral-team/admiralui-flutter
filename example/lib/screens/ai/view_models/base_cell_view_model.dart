import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/action_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/actions/action_item_model_interface.dart';

class BaseCellViewModel with IDModelMixin, ActionModelMixin {
  BaseCellViewModel({
    this.leadingCell,
    this.centerCell,
    this.trailingCell,
    this.borderRadius,
    required this.isEnabled,
    required String id,
    this.horizontalPadding,
    List<ActionItemModelInterface>? actions,
  }) {
    this.id = id;
    this.actions = actions
        ?.where(
            (ActionItemModelInterface action) => action.actionName == 'didTap')
        .toList();
  }

  dynamic leadingCell;
  dynamic centerCell;
  dynamic trailingCell;
  double? borderRadius;
  final bool isEnabled;
  double? horizontalPadding;
}
