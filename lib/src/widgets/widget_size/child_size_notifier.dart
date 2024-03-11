import 'package:flutter/material.dart';

class ChildSizeNotifier extends StatelessWidget {
  const ChildSizeNotifier({
    required this.notifier,
    required this.builder,
  });
  final ValueNotifier<Size> notifier;
  final Widget Function(BuildContext context, Size size, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        notifier.value = (context.findRenderObject()! as RenderBox).size;
      },
    );
    return ValueListenableBuilder<Size>(
      valueListenable: notifier,
      builder: builder,
    );
  }
}
