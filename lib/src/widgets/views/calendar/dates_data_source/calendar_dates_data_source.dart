import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/cupertino.dart';

/// The CalendarDatesDataSource.
///
/// An object that store dates generator and
/// sets start, end, current date depending on the state of the calendar.
///
class CalendarDatesDataSource {
  CalendarDatesDataSource(
    this.startDate,
    this.endDate,
    this.currentDate,
    this.notActiveAfterDate,
    this.datesRangeNotifier,
    this.selectedStartDate,
    this.selectedEndDate,
  ) {
    monthList = generator.generateDataSourceByDate(
      currentDate ?? DateTime.now(),
      startDate,
      endDate,
      notActiveAfterDate,
    );
    _setScrollState();
  }

  late DateTime? startDate;
  late DateTime? endDate;
  late DateTime? currentDate;
  final DateTime? notActiveAfterDate;
  final ValueNotifier<List<DateTime?>> datesRangeNotifier;
  late DateTime? selectedStartDate;
  late DateTime? selectedEndDate;

  late List<List<CalendarDayItem>> monthList;
  late CalendarScrollState scrollState;
  final CalendarDaysGenerator generator = CalendarDaysGenerator();

  void _setScrollState() {
    if (startDate != null && endDate != null) {
      scrollState = CalendarScrollState.fixed;
    }

    if (startDate == null && endDate == null) {
      scrollState = CalendarScrollState.inifinity;
    }

    if (startDate != null && endDate == null) {
      scrollState = CalendarScrollState.fixedStart;
    }

    if (startDate == null && endDate != null) {
      scrollState = CalendarScrollState.fixedEnd;
    }
  }

  void updateMonthList(int pageIndex) {
    final DateTime? currentDate_ = monthList[pageIndex]
        .firstWhere(
          (CalendarDayItem element) =>
              element.state != CalendarDayItemState.notVisible,
        )
        .date;

    currentDate = currentDate_;

    if (currentDate_ != null) {
      monthList = generator.generateDataSource(
        monthList[pageIndex],
        currentDate_,
        pageIndex,
        selectedStartDate,
        selectedEndDate,
        notActiveAfterDate,
      );
    }
  }

  int getDayMonthDifferenceCount(DateTime date, DateTime? secondDate) {
    final int days = date.difference(secondDate ?? DateTime.now()).inDays;
    final int months = days ~/ 28;
    return months.abs();
  }

  List<CalendarDayItem> getMonthInRangeOfStatedEndDate(int index) {
    final DateTime priorityDate =
        startDate!.isAfter(endDate!) ? endDate! : startDate!;
    final DateTime nextMonthDate = DateTime(
      priorityDate.year,
      priorityDate.month + index,
      priorityDate.day,
    );

    return generator.generateMonthDays(
      nextMonthDate,
      selectedStartDate,
      selectedEndDate,
      notActiveAfterDate,
    );
  }

  List<CalendarDayItem> getMonth(int index) {
    final DateTime currentDate_ = currentDate ?? DateTime.now();
    final DateTime nextMonthDate = DateTime(
      currentDate_.year,
      currentDate_.month + index,
      currentDate_.day,
    );
    return generator.generateMonthDays(
      nextMonthDate,
      selectedStartDate,
      selectedEndDate,
      notActiveAfterDate,
    );
  }

  void updateMonthListByCurrentDate() {
    monthList = generator.generateDataSourceByDate(
      currentDate ?? DateTime.now(),
      selectedStartDate,
      selectedEndDate,
      notActiveAfterDate,
    );
  }

  void didTapAtDate(DateTime? date) {
    if (selectedStartDate == null) {
      selectedStartDate = date;
      sendDatesChangeEvent();
      return;
    }

    if (selectedStartDate != null && selectedEndDate == null && date != null) {
      if (date.isAfter(selectedStartDate!)) {
        selectedEndDate = date;
        sendDatesChangeEvent();
        return;
      } else if (date.isBefore(selectedStartDate!)) {
        selectedEndDate = selectedStartDate;
        selectedStartDate = date;
        sendDatesChangeEvent();
        return;
      }
    }

    if (selectedStartDate != null && selectedEndDate != null) {
      if (date != null) {
        if (date.isDateInRange(selectedStartDate, selectedEndDate)) {
          selectedStartDate = date;
          selectedEndDate = null;
          sendDatesChangeEvent();
          return;
        } else if (date.isDaysEqual(selectedStartDate)) {
          selectedStartDate = date;
          selectedEndDate = null;
          sendDatesChangeEvent();
          return;
        } else if (date.isDaysEqual(selectedEndDate)) {
          selectedStartDate = date;
          selectedEndDate = null;
          sendDatesChangeEvent();
          return;
        } else {
          final int startDateDifference =
              date.difference(selectedStartDate!).inDays.abs();
          final int endDateDifference =
              date.difference(selectedEndDate!).inDays.abs();

          if (endDateDifference > startDateDifference) {
            selectedStartDate = date;
            sendDatesChangeEvent();
            return;
          }

          // ignore: invariant_booleans
          if (startDateDifference > endDateDifference) {
            selectedEndDate = date;
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
    datesRangeNotifier.value = <DateTime?>[selectedStartDate, selectedEndDate];
  }
}
