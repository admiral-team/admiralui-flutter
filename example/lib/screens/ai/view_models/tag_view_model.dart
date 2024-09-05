import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:example/screens/ai/view_models/interfaces/action_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/actions/action_item_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/layout_model_interface.dart';
import 'package:flutter/widgets.dart';

class TagViewModel with LayoutModelMixin, IDModelMixin, ActionModelMixin {
  TagViewModel({
    required String id,
    this.isEnabled,
    this.style = TagStyle.normal,
    this.leadingText,
    this.leadingIcon,
    this.title,
    this.trailingText,
    this.trailingIcon,
    List<ActionItemModelInterface>? actions,
  }) {
    this.id = id;
    this.actions = actions
        ?.where(
            (ActionItemModelInterface action) => action.actionName == 'didTap')
        .toList();
  }

  TagStyle style;
  String? leadingText;
  IconData? leadingIcon;
  String? title;
  String? trailingText;
  IconData? trailingIcon;
  bool? isEnabled;
}
