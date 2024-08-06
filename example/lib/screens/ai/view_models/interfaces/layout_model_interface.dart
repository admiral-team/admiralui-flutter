abstract class LayoutModelInterface {
  LayoutModelInterface({
    this.width,
    this.height,
  });

  final double? width;
  final double? height;
}

mixin LayoutModelMixin implements LayoutModelInterface {
  @override
  late final double? width;
  @override
  late final double? height;
}