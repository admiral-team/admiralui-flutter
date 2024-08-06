import 'package:example/models/template_model.dart';

abstract class TemplatesCase {
  Future<List<TemplateModel>> getTemplates(bool isLocal);
}