import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:example/screens/ai/view_models/interfaces/action_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/actions/action_item_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/layout_model_interface.dart';
import 'package:flutter/widgets.dart';

class GhostButtonViewModel
    with LayoutModelMixin, IDModelMixin, ActionModelMixin {
  GhostButtonViewModel({
    required this.title,
    required this.isEnabled,
    required this.sizeType,
    required String id,
    List<ActionItemModelInterface>? actions,
    IconData? iconData,
    IconPosition? iconPosition,
    double? width,
    double? height,
  }) {
    this.id = id;
    this.actions = actions
        ?.where(
            (ActionItemModelInterface action) => action.actionName == 'didTap')
        .toList();
    this.width = width;
    this.height = height;
    this.iconData = iconData;
    this.iconPosition = iconPosition;
  }

  IconData? iconData;
  IconPosition? iconPosition;
  final String title;
  final bool isEnabled;
  final ButtonSizeType sizeType;
}
