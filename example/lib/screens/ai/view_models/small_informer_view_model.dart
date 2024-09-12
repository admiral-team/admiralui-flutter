import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:example/screens/ai/view_models/interfaces/action_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/actions/action_item_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';

class SmallInformerViewModel with IDModelMixin, ActionModelMixin {
  SmallInformerViewModel({
    required String id,
    required this.style,
    required this.arrowDirectionStyle,
    required this.isEnabled,
    this.title,
    List<ActionItemModelInterface>? actions,
  }) {
    this.id = id;
    this.actions = actions
        ?.where(
            (ActionItemModelInterface action) => action.actionName == 'didTap')
        .toList();
  }

  final String? title;
  final InformerStyle style;
  final InformerDirectionStyle arrowDirectionStyle;
  final bool isEnabled;
}
