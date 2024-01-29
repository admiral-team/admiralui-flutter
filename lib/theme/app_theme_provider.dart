import 'package:admiralui_flutter/theme/app_theme.dart';
import 'package:flutter/widgets.dart';

class AppThemeProvider extends InheritedWidget {
  const AppThemeProvider({
    super.key,
    required super.child,
    required this.data,
    required this.theme,
  });

  final AppTheme theme;
  final AppThemeProviderWrapperState data;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static AppTheme of(BuildContext context) {
    final AppTheme? theme2 =
        context.dependOnInheritedWidgetOfExactType<AppThemeProvider>()?.theme;
    final AppTheme appTheme = theme2 ?? lightTheme;
    return appTheme;
  }
}

class AppThemeProviderWrapper extends StatefulWidget {
  const AppThemeProviderWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  static AppThemeProviderWrapperState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppThemeProvider>()!
        .data;
  }

  @override
  AppThemeProviderWrapperState createState() => AppThemeProviderWrapperState();
}

class AppThemeProviderWrapperState extends State<AppThemeProviderWrapper> {
  AppTheme _theme = lightTheme;

  void updateTheme() {
    setState(() {
      if (_theme == lightTheme) {
        _theme = darkTheme;
      } else {
        _theme = lightTheme;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppThemeProvider(
      data: this,
      theme: _theme,
      child: widget.child,
    );
  }
}
