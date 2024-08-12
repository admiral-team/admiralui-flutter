
import 'package:example/data/repository/interface/templates_repo.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;

class TemplatesRepositoryImpl extends TemplatesRepository {

  TemplatesRepositoryImpl();

  @override
  Future<Map<String, dynamic>> getLocalTemplates() async {
        final String response =
        await rootBundle.loadString('assets/templates/templates.json');
    return await json.decode(response);
  }

  @override
  Future<http.Response> getRemoteTemplates() async {
    final Uri url =
        Uri.parse('https://admiralserver.onrender.com/v1/getTemplates');
    final Map<String, String> headers = <String, String>{'Content-Type': 'application/json'};

    return await http.get(url, headers: headers);
  }

  @override
  Future<http.Response> createRemoteTemplate(String message) async {
    final Uri url =
        Uri.parse('https://admiralserver.onrender.com/v1/aiTemplate');
    final Map<String, String> headers = <String, String>{'Content-Type': 'application/json'};
    final Map<String, String> body = <String, String>{
      'message': message
    };
    return await http.post(url, headers: headers, body: jsonEncode(body));
  }

  @override
  Future<http.Response> getRemoteTemplate(String templateName) async {
    final Uri url =
        Uri.parse('https://admiralserver.onrender.com/v1/getTemplate');
    final Map<String, String> headers = <String, String>{'Content-Type': 'application/json'};
    final Map<String, String> body = <String, String>{
      'templateName': templateName
    };
    return await http.post(url, headers: headers, body: jsonEncode(body));
  }

}