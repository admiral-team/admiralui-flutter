import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

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
    final int rowAmount = visibleDays.length ~/ 7;

    return List<int>.generate(rowAmount, (int index) => index * 7)
        .map(
          (int index) => TableRow(
            decoration: const BoxDecoration(),
            children: List<Widget>.generate(
              7,
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
