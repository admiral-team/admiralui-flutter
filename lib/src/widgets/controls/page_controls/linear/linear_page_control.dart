import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

/// A linear page control widget for indicating the
/// progress or steps in a linear process.
///
/// Constructor:
/// ```
/// LinearPageControl(
///   int steps,
///   int currentStep,
///   int displayedItems, {
///     ValueNotifier<int>? stepNotifier,
///     LinearPageControlScheme? scheme,
///     Key? key,
///   }
/// )
/// ```
///
/// Parameters:
/// - `steps`: The total number of steps in the linear process.
/// - `currentStep`: The index of the current step in the linear process.
/// - `displayedItems`: The number of page control items to be
/// displayed simultaneously.
/// - `stepNotifier`: A [ValueNotifier] that, when provided, allows external
/// control of the current step.
/// - `scheme`: An optional scheme defining the appearance of the
/// linear page control.
/// - `key`: An optional key to uniquely identify this widget.
///
/// Example usage:
/// ```dart
/// LinearPageControl(
///   steps: 5,
///   currentStep: 2,
///   displayedItems: 3
/// )
/// ```
///
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
  final ItemScrollController _scrollController = ItemScrollController();
  final double width = LayoutGrid.doubleModule;
  final double height = LayoutGrid.halfModule;
  final double paddingRight = LayoutGrid.module;

  int get _stepNofifierValue =>
      widget.stepNotifier?.value ?? widget.currentStep;

  @override
  void initState() {
    super.initState();

    widget.stepNotifier?.addListener(() {
      setState(() {
        if (_stepNofifierValue < widget.steps - (widget.displayedItems - 1)) {
          _scrollController.scrollTo(
            index: _stepNofifierValue,
            duration: const Duration(milliseconds: 500),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.stepNotifier?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? LinearPageControlScheme(theme: theme);

    return SizedBox(
      height: LayoutGrid.halfModule,
      width: _calculateWidth(),
      child: ScrollablePositionedList.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemScrollController: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.steps,
        itemBuilder: (_, int index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
              0,
              0,
              index == widget.steps - 1 ? 0 : paddingRight,
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

  double _calculateWidth() {
    if (widget.displayedItems == 1) {
      return widget.displayedItems * width;
    } else if (widget.displayedItems < 1) {
      return 0.0;
    } else if (widget.displayedItems < widget.steps) {
      return (widget.displayedItems * width) +
          ((widget.displayedItems - 1) * paddingRight);
    } else {
      return (widget.steps * width) + ((widget.steps - 1) * paddingRight);
    }
  }
}
