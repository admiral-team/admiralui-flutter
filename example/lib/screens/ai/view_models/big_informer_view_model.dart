import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/layout_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/action_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/actions/action_item_model_interface.dart';

class BigInformerViewModel with LayoutModelMixin, 
IDModelMixin, ActionModelMixin {
  BigInformerViewModel({
    required this.title,
    required this.subtitle,
    required this.style,
    required bool this.isEnabled,
    required String id,
    this.linkText,
    double? width,
    double? height,
    List<ActionItemModelInterface>? actions,
  }) {
    this.id = id;
    this.width = width;
    this.height = height;
        this.actions = actions
        ?.where(
            (ActionItemModelInterface action) => action.actionName == 'didTap')
        .toList();
  }

  final String title;
  final String subtitle;
  final String? linkText;
  final InformerStyle style;
  final bool isEnabled;
}
