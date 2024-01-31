import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/theme/admiral_color.dart';

class InformerTabsScheme {
  InformerTabsScheme({
    required this.theme,
  }) {
    backgroundColor = theme.colors.backgroundBasic;
    informerTabItemScheme = InformerTabItemScheme(theme: theme);
    arrowSliderColor = theme.colors.backgroundAdditionalOne;
  }

  AppTheme theme;
  late AColor backgroundColor;
  late InformerTabItemScheme informerTabItemScheme;
  late AColor arrowSliderColor;
}
