import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';

enum CalendarStyle {
  vertical,
  horizontal,
}

class CalendarViewModel with IDModelMixin {
  CalendarViewModel(
      {required String id,
      required this.style,
      this.startDate,
      this.currentDate,
      this.endDate,
      this.selectedStartDate,
      this.selectedEndDate}) {
    this.id = id;
  }

  final CalendarStyle style;
  final DateTime? startDate;
  final DateTime? currentDate;
  final DateTime? endDate;
  final DateTime? selectedStartDate;
  final DateTime? selectedEndDate;
}
