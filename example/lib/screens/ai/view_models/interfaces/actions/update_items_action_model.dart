import 'package:example/screens/ai/view_models/interfaces/actions/action_item_model_interface.dart';

class UpdateItemsActionModel extends ActionItemModelInterface {
  UpdateItemsActionModel({
    required this.items,
    required String type,
    required String actionName,
  }) : super(type: type, actionName: actionName);

  final List<dynamic> items;
}