import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:intl/intl.dart';

/// The CalendarDaysGenerator.
///
/// An object that defines the state of the date,
/// returns the month of List<List<CalendarDayItem>>
/// and week days.
///
class CalendarDaysGenerator {
  CalendarDaysGenerator();

  List<List<CalendarDayItem>> generateDataSource(
    List<CalendarDayItem> month,
    DateTime currentDate,
    int currentIndex,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? nonActiveDate,
  ) {
    final DateTime currentMonthDay = month
        .where(
          (CalendarDayItem day) => day.state != CalendarDayItemState.notVisible,
        )
        .toList()
        .first
        .date!;

    final List<CalendarDayItem> currentMonth = generateMonthDays(
      currentMonthDay,
      startDate,
      endDate,
      nonActiveDate,
    );

    final List<CalendarDayItem> nextMonth = getNextMonth(
      currentDate,
      startDate,
      endDate,
      nonActiveDate,
    );

    final List<CalendarDayItem> previousMonth = getPreviousMonth(
      currentDate,
      startDate,
      endDate,
      nonActiveDate,
    );
    late List<List<CalendarDayItem>> dataSource;

    if (currentIndex == 0) {
      dataSource = <List<CalendarDayItem>>[
        currentMonth,
        nextMonth,
        previousMonth
      ];
    } else if (currentIndex == 1) {
      dataSource = <List<CalendarDayItem>>[
        previousMonth,
        currentMonth,
        nextMonth
      ];
    } else if (currentIndex == 2) {
      dataSource = <List<CalendarDayItem>>[
        nextMonth,
        previousMonth,
        currentMonth
      ];
    }
    return dataSource;
  }

  List<List<CalendarDayItem>> generateDataSourceByDate(
    DateTime currentDate,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? nonActiveDate,
  ) {
    final List<CalendarDayItem> nextMonth = getNextMonth(
      currentDate,
      startDate,
      endDate,
      nonActiveDate,
    );

    final List<CalendarDayItem> previousMonth = getPreviousMonth(
      currentDate,
      startDate,
      endDate,
      nonActiveDate,
    );

    final List<CalendarDayItem> currentMonth = generateMonthDays(
      currentDate,
      startDate,
      endDate,
      nonActiveDate,
    );
    return <List<CalendarDayItem>>[previousMonth, currentMonth, nextMonth];
  }

  List<CalendarDayItem> getPreviousMonth(
    DateTime date,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? nonActiveDate,
  ) {
    final DateTime previousMonthDate =
        DateTime(date.year, date.month - 1, date.day);
    return generateMonthDays(
      previousMonthDate,
      startDate,
      endDate,
      nonActiveDate,
    );
  }

  List<CalendarDayItem> getNextMonth(
    DateTime date,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? nonActiveDate,
  ) {
    final DateTime previousMonthDate =
        DateTime(date.year, date.month + 1, date.day);
    return generateMonthDays(
      previousMonthDate,
      startDate,
      endDate,
      nonActiveDate,
    );
  }

  static List<String> getDaysOfWeek(String? locale) {
    final DateTime now = DateTime.now();
    final DateTime firstDayOfWeek =
        now.subtract(Duration(days: now.weekday - 1));
    return List<int>.generate(7, (int index) => index)
        .map(
          (int value) => DateFormat(DateFormat.ABBR_WEEKDAY, locale)
              .format(firstDayOfWeek.add(Duration(days: value))),
        )
        .toList();
  }

  List<CalendarDayItem> generateMonthDays(
    DateTime date,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? nonActiveDate,
  ) {
    final DateTime firstDayThisMonth = DateTime(
      date.year,
      date.month,
      date.day,
    );

    final DateTime firstDayNextMonth = DateTime(
      firstDayThisMonth.year,
      firstDayThisMonth.month + 1,
      firstDayThisMonth.day,
    );

    final int monthDaysCount =
        firstDayNextMonth.difference(firstDayThisMonth).inDays;

    final List<DateTime> list = List<DateTime>.generate(
      monthDaysCount,
      (int i) => DateTime(
        date.year,
        date.month,
        i + 1,
      ),
    );

    final List<CalendarDayItem> firstWeekDays = _generateFirstWeekInMonth(
      list,
      startDate,
      endDate,
      nonActiveDate,
    );

    final List<CalendarDayItem> lastWeekDays = _generateLastWeekInMonth(
      list,
      startDate,
      endDate,
      nonActiveDate,
    );

    final List<CalendarDayItem> daysBetweenLastAndFirstWeek =
        _generateDaysBetweenLastAndFirstWeek(
      list,
      firstWeekDays,
      lastWeekDays,
      startDate,
      endDate,
      nonActiveDate,
    );

    return firstWeekDays + daysBetweenLastAndFirstWeek + lastWeekDays;
  }

  List<CalendarDayItem> _generateDaysBetweenLastAndFirstWeek(
    List<DateTime> monthDatesList,
    List<CalendarDayItem> firstWeekDays,
    List<CalendarDayItem> lastWeekDays,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? nonActiveDate,
  ) {
    final List<DateTime> daysBetweenLastAndFirstWeekList = monthDatesList;
    final int firstWeekDaysWithoutEmptyDaysCount = firstWeekDays
        .where(
          (CalendarDayItem day) => day.state != CalendarDayItemState.notVisible,
        )
        .toList()
        .length;

    final int lastWeekDaysWithoutEmptyDaysCount = lastWeekDays
        .where(
          (CalendarDayItem day) => day.state != CalendarDayItemState.notVisible,
        )
        .toList()
        .length;

    daysBetweenLastAndFirstWeekList.removeRange(
      0,
      firstWeekDaysWithoutEmptyDaysCount,
    );

    daysBetweenLastAndFirstWeekList.removeRange(
      monthDatesList.length - lastWeekDaysWithoutEmptyDaysCount,
      monthDatesList.length,
    );

    final List<CalendarDayItem> calendarDaysBetweenLastAndFirstWeek =
        daysBetweenLastAndFirstWeekList
            .map(
              (DateTime item) => CalendarDayItem(
                date: item,
                state: _getDayState(
                  item,
                  startDate,
                  endDate,
                  nonActiveDate,
                ),
                number: item.day,
              ),
            )
            .toList();

    return calendarDaysBetweenLastAndFirstWeek;
  }

  List<CalendarDayItem> _generateLastWeekInMonth(
    List<DateTime> list,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? nonActiveDate,
  ) {
    final DateTime lastDateInMonth = list.last;
    final int lastWeekVisibleDaysCount =
        Iterable<int>.generate(lastDateInMonth.weekday).toList().length;
    final int lastWeekEmptyDaysCount = 7 - lastWeekVisibleDaysCount;

    final List<CalendarDayItem> lastWeekVisibleDaysList = list
        .sublist(list.length - lastWeekVisibleDaysCount, list.length)
        .map(
          (DateTime item) => CalendarDayItem(
            date: item,
            state: _getDayState(
              item,
              startDate,
              endDate,
              nonActiveDate,
            ),
            number: item.day,
          ),
        )
        .toList();

    final List<CalendarDayItem> emptyDaysList = List<CalendarDayItem>.generate(
      lastWeekEmptyDaysCount,
      (int index) => const CalendarDayItem(
        date: null,
        state: CalendarDayItemState.notVisible,
        number: null,
      ),
    );

    return lastWeekVisibleDaysList + emptyDaysList;
  }

  List<CalendarDayItem> _generateFirstWeekInMonth(
    List<DateTime> list,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? nonActiveDate,
  ) {
    final DateTime firstDateInMonth = list.first;
    final int firstWeekDaysCount =
        (7 - Iterable<int>.generate(firstDateInMonth.weekday).toList().length) +
            1;
    final List<DateTime> firstWeekDaysList =
        list.sublist(0, firstWeekDaysCount);

    final int dayDifference = 7 - firstWeekDaysList.length;

    final List<CalendarDayItem> visibleDays = firstWeekDaysList
        .map(
          (DateTime item) => CalendarDayItem(
            date: item,
            state: _getDayState(
              item,
              startDate,
              endDate,
              nonActiveDate,
            ),
            number: item.day,
          ),
        )
        .toList();

    if (dayDifference != 7) {
      final List<CalendarDayItem> emptyDays = List<CalendarDayItem>.generate(
        dayDifference,
        (int index) => const CalendarDayItem(
          date: null,
          state: CalendarDayItemState.notVisible,
          number: null,
        ),
      );

      return emptyDays + visibleDays;
    } else {
      return visibleDays;
    }
  }

  CalendarDayItemState _getDayState(
    DateTime generatedDate,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? nonActiveDate,
  ) {
    if (generatedDate.isToday() &&
        !generatedDate._isEqualToDates(startDate, endDate)) {
      return CalendarDayItemState.current;
    }

    if (nonActiveDate != null && generatedDate.isAfter(nonActiveDate)) {
      return CalendarDayItemState.inactive;
    }

    if (generatedDate.isToday() &&
        generatedDate._isEqualToDates(startDate, endDate)) {
      return CalendarDayItemState.selected;
    }

    if (!generatedDate.isToday() &&
        generatedDate._isEqualToDates(startDate, endDate)) {
      return CalendarDayItemState.selected;
    }

    if (generatedDate.isDateInRange(startDate, endDate)) {
      return CalendarDayItemState.inRange;
    }

    return CalendarDayItemState.regular;
  }
}

extension DateTimeExenstion on DateTime {
  bool isToday() {
    final DateTime nowDate = DateTime.now();
    return day == nowDate.day && month == nowDate.month && year == nowDate.year;
  }

  bool _isEqualToDates(
    DateTime? startDate,
    DateTime? endDate,
  ) {
    return isDaysEqual(startDate) || isDaysEqual(endDate);
  }

  bool isDateInRange(
    DateTime? startDate,
    DateTime? endDate,
  ) {
    if (!isDaysEqual(startDate) && !isDaysEqual(endDate)) {
      if (startDate != null && endDate != null) {
        // ignore: no_leading_underscores_for_local_identifiers
        late DateTime _startDate = startDate;
        // ignore: no_leading_underscores_for_local_identifiers
        late DateTime _endDate = endDate;

        if (startDate.isAfter(endDate)) {
          _startDate = endDate;
          _endDate = startDate;
        }

        if (startDate.isBefore(endDate)) {
          _startDate = startDate;
          _endDate = endDate;
        }

        if (isBefore(_endDate) && isAfter(_startDate)) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  bool isDaysEqual(DateTime? date) {
    if (date != null) {
      return day == date.day && month == date.month && year == date.year;
    } else {
      return false;
    }
  }
}
