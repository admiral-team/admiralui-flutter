import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/theme/admiral_color.dart';

class UploadingPhotoViewScheme {
  UploadingPhotoViewScheme({required this.theme}) {
    textColor = theme.colors.textStaticWhite;
    textFont = theme.fonts.caption1;
    circleColor = theme.colors.textStaticWhite;
  }

  AppTheme theme;
  late AColor textColor;
  late AFont textFont;
  late AColor circleColor;
}
