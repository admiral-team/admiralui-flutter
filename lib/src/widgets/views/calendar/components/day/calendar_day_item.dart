enum CalendarDayItemState {
  notVisible,
  regular,
  current,
  inRange,
  selected,
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
}
