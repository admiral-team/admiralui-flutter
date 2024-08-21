import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:example/screens/ai/view_models/interfaces/action_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/actions/action_item_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';
import 'package:flutter/widgets.dart';

class LinkControlViewModel with IDModelMixin, ActionModelMixin {
  LinkControlViewModel({
    required this.title,
    required this.isEnabled,
    required this.style,
    required String id,
    List<ActionItemModelInterface>? actions,
    IconData? leadingIcon,
    IconData? trailingIcon,
  }) {
    this.id = id;
    this.actions = actions
        ?.where(
            (ActionItemModelInterface action) => action.actionName == 'didTap')
        .toList();
    this.leadingIcon = leadingIcon;
    this.trailingIcon = trailingIcon;
  }

  IconData? leadingIcon;
  IconData? trailingIcon;
  final String title;
  final bool isEnabled;
  final LinkStyle style;
}
