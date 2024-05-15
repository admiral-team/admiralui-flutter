import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// The CalendarDayView.
///
/// A view that dispay a day.
/// You can create CalendarDayView by specifying parameters:
/// CalendarDayItem day - The item of day.
/// VoidCallback? onPressed - An action of tap at day view.
/// CalendarDayViewScheme? scheme - The visual scheme of CalendarDayView.
///
class CalendarDayView extends StatefulWidget {
  const CalendarDayView(
    this.day, {
    this.onPressed,
    this.scheme,
    super.key,
  });

  final CalendarDayItem day;
  final VoidCallback? onPressed;
  final CalendarDayViewScheme? scheme;

  @override
  State<StatefulWidget> createState() => _CalendarDayViewViewState();
}

class _CalendarDayViewViewState extends State<CalendarDayView> {
  late CalendarDayViewScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? CalendarDayViewScheme(theme: theme);
    return GestureDetector(
      onTap: () => _onTap(),
      child: SizedBox(
        width: LayoutGrid.halfModule * 9,
        height: (LayoutGrid.module - 2) * 9,
        child: Column(
          children: <Widget>[
            if (widget.day.state == CalendarDayItemState.notVisible)
              const SizedBox(
                width: LayoutGrid.halfModule * 9,
                height: LayoutGrid.halfModule * 9,
              ),
            if (widget.day.state != CalendarDayItemState.notVisible)
              SizedBox(
                width: LayoutGrid.halfModule * 9,
                height: LayoutGrid.halfModule * 9,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: scheme.backgroundColor
                        .unsafeParameter(widget.day.state),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(LayoutGrid.halfModule),
                    ),
                    border: Border.all(
                      color:
                          scheme.borderColor.unsafeParameter(widget.day.state),
                      width: LayoutGrid.halfModule / 2,
                    ),
                  ),
                  child: Center(
                    child: TextView(
                      widget.day.number.toString(),
                      font: scheme.titleLabelFont,
                      textColorNormal: scheme.textColor.unsafeParameter(
                        widget.day.state,
                      ),
                    ),
                  ),
                ),
              ),
            if (widget.day.date != null)
              if (widget.day.date!.isToday())
                const SizedBox(
                  height: LayoutGrid.halfModule / 2,
                ),
            if (widget.day.date != null)
              if (widget.day.date!.isToday())
                Container(
                  width: LayoutGrid.halfModule,
                  height: LayoutGrid.halfModule,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: scheme.currentDayIndicatorColor.color(),
                  ),
                ),
          ],
        ),
      ),
    );
  }

  void _onTap() {
    if (widget.day.state != CalendarDayItemState.notVisible &&
        widget.day.state != CalendarDayItemState.inactive) {
      widget.onPressed?.call();
    }
  }
}
