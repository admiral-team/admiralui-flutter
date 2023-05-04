import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalendarVerticalScreen extends StatefulWidget {
  const CalendarVerticalScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<CalendarVerticalScreen> createState() => _CalendarVerticalScreenState();
}

class _CalendarVerticalScreenState extends State<CalendarVerticalScreen> {
  final DateTime currentDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    final DateTime nowDate = DateTime.now();

    return Scaffold(
      backgroundColor: colors.backgroundBasic.color(),
      appBar: AppBar(
        centerTitle: true,
        leading: CupertinoButton(
          child: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: colors.backgroundBasic.color(),
        title: TextView(
          widget.title,
          font: fonts.subtitle2,
          textColorNormal: colors.textPrimary.color(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: LayoutGrid.doubleModule,
        ),
        child: Column(
          children: <Widget>[
            CalendarVerticalView(
              selectedEndDate: DateTime(
                nowDate.year,
                nowDate.month - 1,
                nowDate.day + 10,
              ),
              selectedStartDate: DateTime(
                nowDate.year,
                nowDate.month - 1,
                nowDate.day,
              ),
              startDate: null,
              currentDate: nowDate,
              endDate: null,
              onChangedRangeDates: (List<DateTime?> datesRange) {
                print('Dates range $datesRange');
              },
              locale: 'ru',
              notActiveAfterDate: DateTime.now(),
            ),
          ],
        ),
      ),
    );
  }
}
