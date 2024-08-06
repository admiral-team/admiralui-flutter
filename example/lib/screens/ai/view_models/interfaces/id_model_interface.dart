abstract class IDModelInterface {
  IDModelInterface({
    required this.id
  });

  final String id;
}

mixin IDModelMixin implements IDModelInterface {
  @override
  late final String id;
}