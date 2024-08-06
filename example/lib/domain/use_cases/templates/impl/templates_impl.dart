import 'package:example/data/repository/interface/templates_repo.dart';
import 'package:example/domain/use_cases/templates/interface/templates_case.dart';
import 'package:example/models/template_model.dart';
import 'dart:convert';
import 'package:http/src/response.dart';

class TemplatesCaseImpl extends TemplatesCase {
  TemplatesCaseImpl(this._templatesRepository);
  final TemplatesRepository _templatesRepository;

  @override
  Future<List<TemplateModel>> getTemplates(bool isLocal) async {
    Map<String, dynamic> json;
    if (isLocal) {
      try {
        json = await _templatesRepository.getLocalTemplates();
        List<dynamic> jsonTemplates = json['templates'];
        List<TemplateModel> templates =
            jsonTemplates.map((dynamic s) => TemplateModel(name: s)).toList();
        return templates;
      } catch (e) {
        print('Error parsing item: $e');
        return <TemplateModel>[];
      }
    } else {
      final Response response = await _templatesRepository.getRemoteTemplates();
      if (response.statusCode == 200) {
        try {
          Map<String, dynamic> data = jsonDecode(response.body);
          Map<String, dynamic> innerData = jsonDecode(data['data']);
          List<dynamic> jsonTemplates = innerData['templates'];
          List<TemplateModel> templates =
              jsonTemplates.map((dynamic s) => TemplateModel(name: s)).toList();
          return templates;
        } catch (e) {
          print('Error parsing item: $e');
          return <TemplateModel>[];
        }
      } else {
        return <TemplateModel>[];
      }
    }
  }
}
