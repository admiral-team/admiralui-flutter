import 'package:intl/intl.dart';

enum CalendarDayItemState {
  /// The cell in not visible
  notVisible,

  /// Default state.
  regular,

  /// Cell with current date.
  current,

  /// The date that located between range of dates.
  inRange,

  /// Selected.
  selected,

  /// Inactive.
  inactive,
}

class CalendarDayItem {
  const CalendarDayItem({
    required this.date,
    required this.state,
    required this.number,
  });
  final DateTime? date;
  final CalendarDayItemState state;
  final int? number;

  String? formattedDate() {
    if (date != null) {
      return DateFormat('ddMMyyyy').format(date!);
    } else {
      return null;
    }
  }
}
