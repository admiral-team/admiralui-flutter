import 'package:example/screens/ai/view_models/interfaces/actions/action_item_model_interface.dart';

abstract class ActionModelInterface {
  ActionModelInterface({
    this.actions
  });

  final List<ActionItemModelInterface>? actions;
}

mixin ActionModelMixin implements ActionModelInterface {
  @override
  late final List<ActionItemModelInterface>? actions;
}