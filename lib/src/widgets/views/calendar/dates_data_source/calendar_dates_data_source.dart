import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/cupertino.dart';

class CalendarDatesDataSource {
  CalendarDatesDataSource(
    this.startDate,
    this.endDate,
    this.currentDate,
    this.notActiveAfterDate,
    this.datesRangeNotifier,
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
  final ValueNotifier<List<DateTime?>> datesRangeNotifier;

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
      sendDatesChangeEvent();
      return;
    }

    if (startDate != null && endDate == null && date != null) {
      if (date.isAfter(startDate!)) {
        endDate = date;
        sendDatesChangeEvent();
        return;
      } else if (date.isBefore(startDate!)) {
        endDate = startDate;
        startDate = date;
        sendDatesChangeEvent();
        return;
      }
    }

    if (startDate != null && endDate != null) {
      if (date != null) {
        if (date.isDateInRange(startDate, endDate)) {
          startDate = date;
          endDate = null;
          sendDatesChangeEvent();
          return;
        } else if (date.isDaysEqual(startDate)) {
          startDate = date;
          endDate = null;
          sendDatesChangeEvent();
          return;
        } else if (date.isDaysEqual(endDate)) {
          startDate = date;
          endDate = null;
          sendDatesChangeEvent();
          return;
        } else {
          final int startDateDifference =
              date.difference(startDate!).inDays.abs();
          final int endDateDifference = date.difference(endDate!).inDays.abs();

          if (endDateDifference > startDateDifference) {
            startDate = date;
            sendDatesChangeEvent();
            return;
          }

          // ignore: invariant_booleans
          if (startDateDifference > endDateDifference) {
            endDate = date;
            sendDatesChangeEvent();
            return;
          }
        }
      } else {
        return;
      }
    }
  }

  void sendDatesChangeEvent() {
    datesRangeNotifier.value = <DateTime?>[startDate, endDate];
  }
}