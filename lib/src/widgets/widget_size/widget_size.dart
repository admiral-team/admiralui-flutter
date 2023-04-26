import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class WidgetSize extends StatefulWidget {
  const WidgetSize({
    required this.child,
    required this.onChange,
    super.key,
  });

  final Widget child;
  final Function onChange;

  @override
  _WidgetSizeState createState() => _WidgetSizeState();
}

class _WidgetSizeState extends State<WidgetSize> {
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback(postFrameCallback);
    return Container(
      key: widgetKey,
      child: widget.child,
    );
  }

  GlobalKey<State<StatefulWidget>> widgetKey = GlobalKey();
  Size oldSize = Size.zero;

  void postFrameCallback(_) {
    final BuildContext? context = widgetKey.currentContext;
    if (context == null) return;

    final Size? newSize = context.size;
    if (oldSize == newSize) return;

    oldSize = newSize!;
    // ignore: avoid_dynamic_calls
    widget.onChange(newSize);
  }
}
