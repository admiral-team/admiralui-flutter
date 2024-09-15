import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:example/screens/ai/view_models/interfaces/action_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';
import 'package:flutter/widgets.dart';

class ParagraphViewModel with IDModelMixin, ActionModelMixin {
  ParagraphViewModel({
    required String id,
    required this.paragraphStyle,
    required this.isEnabled,
    this.title,
    this.paragraphImageType,
    this.trailingIcon,
    this.textAligment,
  }) {
    this.id = id;
  }

  final String? title;
  ParagraphLeadingImageType? paragraphImageType;
  IconData? trailingIcon;
  TextAlign? textAligment;
  ParagraphStyle paragraphStyle;
  bool isEnabled;
}
