import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// The CalendarVerticalPageView.
///
/// A view that display a number of days in month with separator
/// and month day label.
/// You can create CalendarVerticalPageView by specifying parameters:
/// List<CalendarDayItem>? monthDays - The list of items in month.
/// String locale - Localization
/// ValueChanged<CalendarDayItem>? onTap - An action of tap at day view.
/// CalendarVerticalPageViewScheme? scheme - The visual scheme
/// of CalendarVerticalPageView.
///
class CalendarVerticalPageView extends StatefulWidget {
  const CalendarVerticalPageView(
    this.monthDays,
    this.locale, {
    this.onTap,
    this.scheme,
  });

  final List<CalendarDayItem> monthDays;
  final ValueChanged<DateTime?>? onTap;
  final CalendarVerticalPageViewScheme? scheme;
  final String locale;

  @override
  State<StatefulWidget> createState() => _CalendaVerticalPageViewState();
}

class _CalendaVerticalPageViewState extends State<CalendarVerticalPageView> {
  late CalendarVerticalPageViewScheme scheme;
  static const String dateLocaleFormat = 'LLLL yyyy';

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? CalendarVerticalPageViewScheme(theme: theme);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: LayoutGrid.halfModule * 5,
        ),
        if (_getMonthDayName() != null)
          TextView(
            _getMonthDayName()!,
            font: scheme.monthLabelFont,
            textColorNormal: scheme.monthLabelColor.color(),
            textColorDisabled: scheme.monthLabelColor.colorWithOpacity(),
          ),
        const SizedBox(
          height: 22,
        ),
        CalendarWeekView(
          locale: widget.locale,
          scheme: scheme.weekScheme,
        ),
        const SizedBox(
          height: LayoutGrid.doubleModule,
        ),
        CalendarMonthView(
          widget.monthDays,
          onTap: (CalendarDayItem dayItem) {
            widget.onTap?.call(dayItem.date);
          },
          scheme: scheme.monthScheme,
        ),
        const SizedBox(
          height: 7 * (LayoutGrid.halfModule / 2),
        ),
        Container(
          color: scheme.dividerColor.color(),
          height: 1.0,
          width: double.infinity,
        ),
        const SizedBox(
          height: LayoutGrid.halfModule * 5,
        ),
      ],
    );
  }

  String? _getMonthDayName() {
    final DateFormat formatter = DateFormat(dateLocaleFormat, widget.locale);
    final DateTime? monthDay = widget.monthDays
        .where(
          (CalendarDayItem day) => day.state != CalendarDayItemState.notVisible,
        )
        .first
        .date;

    if (monthDay != null) {
      final String formatted = formatter.format(monthDay);
      return formatted.capitalize();
    } else {
      return null;
    }
  }
}
