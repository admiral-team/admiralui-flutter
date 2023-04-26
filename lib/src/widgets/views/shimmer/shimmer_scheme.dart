import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/theme/admiral_color.dart';

class ShimmerScheme {
  ShimmerScheme({
    required this.theme,
  }) {
    shimmerColor = theme.colors.elementStaticWhite;
    backgroundShimmerColor = theme.colors.backgroundAdditionalOne;
  }

  AppTheme theme;
  late AColor shimmerColor;
  late AColor backgroundShimmerColor;
}
