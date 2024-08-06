import 'package:example/screens/ai/view_models/interfaces/actions/action_item_model_interface.dart';

class DeeplinkActionModel extends ActionItemModelInterface {
  DeeplinkActionModel({
    required this.link,
    required String type,
    required String actionName,
  }) : super(type: type, actionName: actionName);

  final String link;
}