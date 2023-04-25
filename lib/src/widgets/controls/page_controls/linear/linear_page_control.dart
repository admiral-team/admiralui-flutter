import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class LinearPageControl extends StatefulWidget {
  const LinearPageControl(
    this.steps,
    this.currentStep,
    this.displayedItems, {
    this.stepNotifier,
    this.scheme,
    super.key,
  });

  final int steps;
  final int currentStep;
  final int displayedItems;
  final ValueNotifier<int>? stepNotifier;
  final LinearPageControlScheme? scheme;

  @override
  State<LinearPageControl> createState() => _LinearPageControlState();
}

class _LinearPageControlState extends State<LinearPageControl>
    with SingleTickerProviderStateMixin {
  late LinearPageControlScheme scheme;
  final ScrollController _scrollController = ScrollController();
  final double width = LayoutGrid.doubleModule;
  final double height = LayoutGrid.halfModule;
  final double paddingLeft = LayoutGrid.module;

  int get _stepNofifierValue =>
      widget.stepNotifier?.value ?? widget.currentStep;

  @override
  void initState() {
    super.initState();

    widget.stepNotifier?.addListener(() {
      setState(() {
        _scrollToIndex();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? LinearPageControlScheme(theme: theme);

    return SizedBox(
      height: LayoutGrid.halfModule,
      width: _calculateWidth(),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.steps,
        itemBuilder: (_, int index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
              index == 0 ? 0 : paddingLeft,
              0,
              0,
              0,
            ),
            child: SizedBox(
              width: width,
              height: height,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(LayoutGrid.module),
                  color: index == widget.currentStep
                      ? scheme.backgroundColor
                          .unsafeParameter(ControlState.selected)
                      : scheme.backgroundColor
                          .unsafeParameter(ControlState.normal),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _scrollToIndex() {
    _scrollController.animateTo(
      (width * _stepNofifierValue) - _stepNofifierValue * paddingLeft,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  double _calculateWidth() {
    if (widget.displayedItems == 1) {
      return widget.displayedItems * width;
    } else if (widget.displayedItems < 1) {
      return 0.0;
    } else if (widget.displayedItems < widget.steps) {
      return (widget.displayedItems * width) +
          ((widget.displayedItems - 1) * paddingLeft);
    } else {
      return (widget.steps * width) + ((widget.steps - 1) * paddingLeft);
    }
  }
}
