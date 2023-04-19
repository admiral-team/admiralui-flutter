import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../navigation/tab_navigator_home.dart';

class CalendarHorizontalScreen extends StatefulWidget {
  const CalendarHorizontalScreen({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorRoutes route) onPush;

  @override
  State<CalendarHorizontalScreen> createState() =>
      _CalendarHorizontalScreenState();
}

class _CalendarHorizontalScreenState extends State<CalendarHorizontalScreen> {
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

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
        child: CalendarHorizontalView(
          startDate: null,
          endDate: null,
          currentDate: null,
          onPageChanged: () {
            print('Calendar page did change');
          },
          onChangedRangeDates: (List<DateTime?> datesRange) {
            print('Dates range $datesRange');
          },
          locale: 'ru',
          notActiveAfterDate: DateTime.now(),
          datePickerButtonTitle: 'Выбрать',
        ),
      ),
    );
  }
}
