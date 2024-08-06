abstract class ContainerModelInterface {
  ContainerModelInterface({
    required this.items
  });

  List<dynamic> items;
}

mixin ContainerModelMixin implements ContainerModelInterface {
  @override
  late List<dynamic> items;
}