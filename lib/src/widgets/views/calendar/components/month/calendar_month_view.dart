import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

/// The CalendarMonthView.
///
/// A view that display a number of days in month.
/// You can create CalendarMonthView by specifying parameters:
/// List<CalendarDayItem>? monthDays - The list of items in month.
/// ValueChanged<CalendarDayItem>? onTap - An action of tap at day view.
/// CalendarMonthViewScheme? scheme - The visual scheme of CalendarMonthView.
///
class CalendarMonthView extends StatefulWidget {
  const CalendarMonthView(
    this.monthDays, {
    this.onTap,
    this.scheme,
  });

  final List<CalendarDayItem> monthDays;
  final ValueChanged<CalendarDayItem>? onTap;
  final CalendarMonthViewScheme? scheme;

  @override
  State<StatefulWidget> createState() => _CalendarMonthViewState();
}

class _CalendarMonthViewState extends State<CalendarMonthView> {
  static const int daysInWeekCount = 7;
  late CalendarMonthViewScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? CalendarMonthViewScheme(theme: theme);
    return Row(
      children: <Widget>[
        Expanded(
          child: Table(
            children: _rows(
              widget.monthDays,
            ),
          ),
        ),
      ],
    );
  }

  List<TableRow> _rows(List<CalendarDayItem> visibleDays) {
    final int rowAmount = visibleDays.length ~/ daysInWeekCount;

    return List<int>.generate(rowAmount, (int index) => index * daysInWeekCount)
        .map(
          (int index) => TableRow(
            decoration: const BoxDecoration(),
            children: List<Widget>.generate(
              daysInWeekCount,
              (int id) => CalendarDayView(
                visibleDays[index + id],
                onPressed: () => widget.onTap?.call(visibleDays[index + id]),
                scheme: scheme.dayScheme,
              ),
            ),
          ),
        )
        .toList();
  }
}
