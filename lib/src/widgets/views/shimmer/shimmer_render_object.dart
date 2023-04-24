import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

@immutable
class ShimmeRenderObject extends SingleChildRenderObjectWidget {
  const ShimmeRenderObject({
    required this.percent,
    required this.direction,
    required this.gradient,
    required Widget child,
  }) : super(child: child);
  final double percent;
  final ShimmerDirection direction;
  final Gradient gradient;

  @override
  ShimmerFilter createRenderObject(BuildContext context) {
    return ShimmerFilter(percent, direction, gradient);
  }

  @override
  void updateRenderObject(BuildContext context, ShimmerFilter shimmer) {
    shimmer.percent = percent;
    shimmer.gradient = gradient;
    shimmer.direction = direction;
  }
}
