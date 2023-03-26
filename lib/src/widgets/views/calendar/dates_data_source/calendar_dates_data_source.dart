import 'package:admiralui_flutter/admiralui_flutter.dart';

class CalendarDatesDataSource {
  CalendarDatesDataSource(
    this.startDate,
    this.endDate,
    this.currentDate,
    this.notActiveAfterDate,
  ) {
    monthList = generator.generateDataSourceByDate(
      currentDate ?? DateTime.now(),
      startDate,
      endDate,
      notActiveAfterDate,
    );
  }

  late DateTime? startDate;
  late DateTime? endDate;
  late DateTime? currentDate;
  final DateTime? notActiveAfterDate;


  late List<List<CalendarDayItem>> monthList;
  final CalendarDaysGenerator generator = CalendarDaysGenerator();

  void updateMonthList(int pageIndex) {
    currentDate = monthList[pageIndex]
        .firstWhere(
          (CalendarDayItem element) =>
              element.state != CalendarDayItemState.notVisible,
        )
        .date;

    monthList = generator.generateDataSource(
      monthList[pageIndex],
      currentDate!,
      pageIndex,
      startDate,
      endDate,
      notActiveAfterDate,
    );
  }

  void updateMonthListByCurrentDate() {
    monthList = generator.generateDataSourceByDate(
      currentDate ?? DateTime.now(),
      startDate,
      endDate,
      notActiveAfterDate,
    );
  }

  void didTapAtDate(DateTime? date) {
    if (startDate == null) {
      startDate = date;
      return;
    }

    if (startDate != null && endDate == null && date != null) {
      if (date.isAfter(startDate!)) {
        endDate = date;
        return;
      } else if (date.isBefore(startDate!)) {
        endDate = startDate;
        startDate = date;
        return;
      }
    }

    if (startDate != null && endDate != null) {
      if (date != null) {
        if (date.isDateInRange(startDate, endDate)) {
          startDate = date;
          endDate = null;
          return;
        } else if (date.isDaysEqual(startDate)) {
          startDate = date;
          endDate = null;
          return;
        } else if (date.isDaysEqual(endDate)) {
          startDate = date;
          endDate = null;
          return;
        } else {
          final int startDateDifference =
              date.difference(startDate!).inDays.abs();
          final int endDateDifference = date.difference(endDate!).inDays.abs();

          if (endDateDifference > startDateDifference) {
            startDate = date;
            return;
          }

          // ignore: invariant_booleans
          if (startDateDifference > endDateDifference) {
            endDate = date;
            return;
          }
        }
      } else {
        return;
      }
    }
  }
}
