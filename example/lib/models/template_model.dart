class TemplateModel {

  factory TemplateModel.fromJson(Map<String, dynamic> json) {
    return TemplateModel(
      name: json['name']
    );
  }

  TemplateModel({required this.name});
  final String? name;
}