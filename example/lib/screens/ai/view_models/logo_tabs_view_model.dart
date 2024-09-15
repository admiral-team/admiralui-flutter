import 'package:example/screens/ai/view_models/interfaces/action_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/actions/action_item_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/container_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/layout_model_interface.dart';
import 'package:flutter/material.dart';

class LogoTabsViewModel
    with LayoutModelMixin, IDModelMixin, ContainerModelMixin, ActionModelMixin {
  LogoTabsViewModel({
    required this.iconsData,
    required this.isEnabled,
    required String id,
    List<ActionItemModelInterface>? actions,
  }) {
    this.id = id;
    this.actions = actions;
  }

  final List<IconData> iconsData;
  final bool isEnabled;
}
