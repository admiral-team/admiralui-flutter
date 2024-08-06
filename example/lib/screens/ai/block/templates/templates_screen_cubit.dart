import 'package:example/domain/use_cases/templates/interface/templates_case.dart';
import 'package:example/models/template_model.dart';
import 'package:example/screens/ai/block/templates/templates_screen_state.dart';
import 'package:example/shared/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TemplatesScreenCubit extends Cubit<TemplatesScreenState> {

  TemplatesScreenCubit() : super(const TemplatesScreenState(
    templates: <TemplateModel>[]
  )) {
    emit(TemplatesScreenState(templates: <TemplateModel>[]));
  }
  final TemplatesCase templatesCase = DI.getInstance().templatesCase;

  Future<void> getTemplates(bool isLocal) async {
    final List<TemplateModel> templates =
     await templatesCase.getTemplates(isLocal);
    emit(TemplatesScreenState(templates: templates));
  }

}