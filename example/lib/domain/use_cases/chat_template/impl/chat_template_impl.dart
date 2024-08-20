import 'package:example/data/repository/interface/templates_repo.dart';
import 'package:example/domain/use_cases/chat_template/interface/chat_template_case.dart';
import 'package:example/models/template_model.dart';
import 'dart:convert';
import 'package:http/src/response.dart';

class ChatTemplateCaseImpl extends ChatTemplateCase {
  ChatTemplateCaseImpl(this._templatesRepository);
  final TemplatesRepository _templatesRepository;

  @override
  Future<TemplateModel> createTemplate(String message) async {
      final Response response = await _templatesRepository.createRemoteTemplate(
        message
      );
      if (response.statusCode == 200) {
        try {
          Map<String, dynamic> data = jsonDecode(response.body);
          return TemplateModel(name: data['data']['fileName']);
        } catch (e) {
          print('Error parsing item: $e');
          return TemplateModel(name: null);
        }
      } else {
        return TemplateModel(name: null);
      }
  }
}
