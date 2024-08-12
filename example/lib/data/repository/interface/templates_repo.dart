import 'package:http/http.dart' as http;

abstract class TemplatesRepository {

  Future<Map<String, dynamic>> getLocalTemplates();
  Future<http.Response> getRemoteTemplates();
  Future<http.Response> getRemoteTemplate(String templateName);
  Future<http.Response> createRemoteTemplate(String message);

}