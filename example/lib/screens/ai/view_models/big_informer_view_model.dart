import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:example/screens/ai/view_models/interfaces/action_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/actions/action_item_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';

class BigInformerViewModel with IDModelMixin, ActionModelMixin {
  BigInformerViewModel({
    required String id,
    required this.isEnabled,
    required this.style,
    this.title,
    this.subtitle,
    this.linkText,
    List<ActionItemModelInterface>? actions,
  }) {
    this.id = id;
    this.actions = actions
        ?.where(
            (ActionItemModelInterface action) => action.actionName == 'didTap')
        .toList();
  }

  final String? title;
  final String? subtitle;
  final String? linkText;
  final bool isEnabled;
  final InformerStyle style;
}
