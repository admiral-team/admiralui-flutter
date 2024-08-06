import 'package:example/models/template_details_model.dart';

abstract class TemplateCase {
  Future<TemplateDetailModel> getTemplate(bool isLocal, String templateName);
}