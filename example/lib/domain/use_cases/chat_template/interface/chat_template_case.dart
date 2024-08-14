import 'package:example/models/template_model.dart';

abstract class ChatTemplateCase {
  Future<TemplateModel> createTemplate(String message);
}