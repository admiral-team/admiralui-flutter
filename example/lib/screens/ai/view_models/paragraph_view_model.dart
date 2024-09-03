import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:example/screens/ai/view_models/interfaces/action_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/id_model_interface.dart';
import 'package:flutter/widgets.dart';

class ParagraphViewModel with IDModelMixin, ActionModelMixin {
  ParagraphViewModel(
      {required String id,
      this.title,
      this.paragraphImageType,
      this.trailingIcon,
      this.textAligment = TextAlign.left,
      this.paragraphStyle = ParagraphStyle.primary,
      this.isEnable = true});

  final String? title;
  final ParagraphLeadingImageType? paragraphImageType;
  final IconData? trailingIcon;
  final TextAlign textAligment;
  final ParagraphStyle paragraphStyle;
  final bool isEnable;
}
