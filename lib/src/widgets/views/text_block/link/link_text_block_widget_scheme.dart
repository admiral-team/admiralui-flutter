import 'package:admiralui_flutter/admiralui_flutter.dart';

class LinkTextBlockWidgetScheme {
  LinkTextBlockWidgetScheme({
    this.theme = lightTheme,
  }) {
    linkScheme = LinkControlScheme(theme: theme);
  }

  AppTheme theme;
  late LinkControlScheme linkScheme;
}
