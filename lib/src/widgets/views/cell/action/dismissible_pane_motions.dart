import 'package:admiralui_flutter/src/widgets/views/cell/action/controller.dart';
import 'package:admiralui_flutter/src/widgets/views/cell/action/flex_exit_transition.dart';
import 'package:admiralui_flutter/src/widgets/views/cell/action/slidable.dart';
import 'package:flutter/widgets.dart';

/// A [DismissiblePane] motion which will make the furthest action grows faster
/// as the [Slidable] dismisses.
class InversedDrawerMotion extends StatelessWidget {
  /// Creates a [InversedDrawerMotion].
  const InversedDrawerMotion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ActionPaneData paneData = ActionPane.of(context)!;
    final SlidableController controller = Slidable.of(context)!;
    final Animation<double> animation = controller.animation
        .drive(CurveTween(curve: Interval(paneData.extentRatio, 1)));

    return FlexExitTransition(
      mainAxisExtent: animation,
      initialExtentRatio: paneData.extentRatio,
      direction: paneData.direction,
      startToEnd: paneData.fromStart,
      children: paneData.children,
    );
  }
}
