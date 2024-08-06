

import 'package:example/data/repository/impl/templates_repo_impl.dart';
import 'package:example/domain/use_cases/template/impl/template_impl.dart';
import 'package:example/domain/use_cases/template/interface/template_case.dart';
import 'package:example/domain/use_cases/templates/impl/templates_impl.dart';
import 'package:example/domain/use_cases/templates/interface/templates_case.dart';

class DI {

  DI._();
  static DI? instance;

  late TemplatesCase templatesCase;
  late TemplateCase templateCase;

  static DI getInstance() {
    return instance ?? (instance = DI._());
  }

  Future<void> init() async {
    final TemplatesRepositoryImpl 
    templatesRepository = TemplatesRepositoryImpl();
    templateCase = TemplateCaseImpl(templatesRepository);
    templatesCase = TemplatesCaseImpl(templatesRepository);
  }

}