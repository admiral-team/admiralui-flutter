import 'package:example/domain/use_cases/template/interface/template_case.dart';
import 'package:example/models/template_details_model.dart';
import 'package:example/navigation/tab_navigation_ai.dart';
import 'package:example/screens/ai/block/template/template_screen_state.dart';
import 'package:example/screens/ai/view_models/interfaces/actions/action_item_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/actions/deeplink_action_model.dart';
import 'package:example/screens/ai/view_models/interfaces/actions/update_items_action_model.dart';
import 'package:example/screens/ai/view_models/interfaces/actions/update_page_action_model.dart';
import 'package:example/screens/ai/view_models/interfaces/container_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';
import 'package:example/shared/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TemplateScreenCubit extends Cubit<TemplateScreenState> {
  TemplateScreenCubit() : super(TemplateScreenState(template: null)) {
    emit(TemplateScreenState(template: null));
  }
  final TemplateCase templateCase = DI.getInstance().templateCase;

  Future<void> getTemplate(bool isLocal, String templateName) async {
    final TemplateDetailModel template =
        await templateCase.getTemplate(isLocal, templateName);
    emit(TemplateScreenState(template: template));
  }

  Future<void> didAction(bool isLocal, List<ActionItemModelInterface>? actions,
      Function(TabNavigatorAIRoutes route, String templateName) onPush) async {
    if (actions != null) {
      for (int index = 0; index < actions.length; index++) {
        final dynamic action = actions[index];
        switch (action.runtimeType) {
          // case 'link':
          //   break;
          case DeeplinkActionModel:
            TabNavigatorAIRoutes type = isLocal
                ? TabNavigatorAIRoutes.localTemplate
                : TabNavigatorAIRoutes.remoteTemplate;
            onPush.call(type, action.link);
            break;
          case UpdateItemsActionModel:
            final List<dynamic> currentItems =
                state.template?.items ?? <dynamic>[];

            List<dynamic> newItems = _updateItems(currentItems, action.items);
            emit(TemplateScreenState(
                template: TemplateDetailModel(items: newItems)));
            break;
          case UpdatePageActionModel:
            getTemplate(isLocal, action.link);
            break;
          default:
            break;
        }
      }
    }
    //emit(TemplateScreenState(template: template));
  }

  List<dynamic> _updateItems(
      List<dynamic> currentItems, List<dynamic> needChanhedItems) {
    List<dynamic> newItems = currentItems;
    for (int index = 0; index < currentItems.length; index++) {
      final IDModelInterface idItem = currentItems[index];
      final String currentId = idItem.id;
      for (int j = 0; j < needChanhedItems.length; j++) {
        final IDModelInterface needChanhedIdItem = needChanhedItems[j];
        if (currentId == needChanhedIdItem.id) {
          newItems[index] = needChanhedItems[j];
        }
      }
      if (currentItems[index] is ContainerModelInterface) {
        ContainerModelInterface mapItem = currentItems[index];
        List<dynamic> treeItems = mapItem.items;
        List<dynamic> newTreeItems = _updateItems(treeItems, needChanhedItems);
        mapItem.items = newTreeItems;
        newItems[index] = mapItem;
      }
    }
    return newItems;
  }
}
