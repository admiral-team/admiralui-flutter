import 'package:admiralui_flutter/admiralui_flutter.dart';

class LinkTextBlockWidgetScheme {
  LinkTextBlockWidgetScheme({
    required this.theme,
  }) {
    linkScheme = LinkControlScheme(theme: theme);
  }

  AppTheme theme;
  late LinkControlScheme linkScheme;
}
