import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/widgets.dart';

class CalendarPageView extends StatefulWidget {
  const CalendarPageView({
    required this.itemBuilder,
    required this.itemCount,
    required this.controller,
    required this.onPageChanged,
    this.physics,
    this.scrollDirection = Axis.horizontal,
    this.reverse = false,
    this.pageSnapping = true,
  });

  final Axis scrollDirection;
  final ScrollPhysics? physics;
  final bool pageSnapping;
  final ValueChanged<int> onPageChanged;
  final bool reverse;
  final IndexedWidgetBuilder itemBuilder;
  final CalendartPageController controller;
  final int itemCount;

  @override
  State<StatefulWidget> createState() => _CalendarPageViewState();
}

class _CalendarPageViewState extends State<CalendarPageView> {
  late CalendartPageController controller;

  void _onPageChange(int realIndex) {
    widget.controller.realIndex = realIndex;
    widget.onPageChanged(widget.controller.page);
  }

  Widget _itemBuild(BuildContext context, int index) {
    final int contIndex = controller.calculateIndex(index);
    return widget.itemBuilder(context, contIndex);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      key: widget.key,
      scrollDirection: widget.scrollDirection,
      reverse: widget.reverse,
      controller: controller.pageController,
      physics: widget.physics,
      pageSnapping: widget.pageSnapping,
      onPageChanged: _onPageChange,
      itemBuilder: _itemBuild,
      itemCount: kMaxValue,
    );
  }

  @override
  void initState() {
    controller = widget.controller;
    controller.itemCount = widget.itemCount;
    super.initState();
  }

  @override
  void didUpdateWidget(CalendarPageView oldWidget) {
    if (widget.controller != controller) {
      controller = widget.controller;
    }
    controller.itemCount = widget.itemCount;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    if (controller != widget.controller) {
      controller.dispose();
    }
    super.dispose();
  }
}
