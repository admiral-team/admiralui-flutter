import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class CalendarWeekView extends StatefulWidget {
  const CalendarWeekView({
    this.locale,
    this.scheme,
  });

  final String? locale;
  final CalendarWeekViewScheme? scheme;

  @override
  State<StatefulWidget> createState() => _CalendarWeekViewState();
}

class _CalendarWeekViewState extends State<CalendarWeekView> {
  late CalendarWeekViewScheme scheme;
  final CalendarDaysGenerator calendarDaysGenerator = CalendarDaysGenerator();

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? CalendarWeekViewScheme(theme: theme);

    return Padding(
      padding: EdgeInsets.zero,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Table(
              children: _buildWeekDay(
                CalendarDaysGenerator.getDaysOfWeek(widget.locale),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<TableRow> _buildWeekDay(List<String> weekDayList) {
    final int rowAmount = weekDayList.length ~/ 7;

    return List<int>.generate(rowAmount, (int index) => index * 7)
        .map(
          (int index) => TableRow(
            decoration: const BoxDecoration(),
            children: List<Widget>.generate(
              7,
              (int id) => SizedBox(
                width: LayoutGrid.halfModule * 9,
                height: LayoutGrid.halfModule * 9,
                child: Center(
                  child: TextView(
                    weekDayList[index + id],
                    font: scheme.titleLabelFont,
                    textColorNormal: scheme.titleLabelColor.color(),
                  ),
                ),
              ),
            ),
          ),
        )
        .toList();
  }
}
