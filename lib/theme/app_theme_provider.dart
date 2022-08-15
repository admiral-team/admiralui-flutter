import 'package:admiralui_flutter/theme/app_theme.dart';
import 'package:flutter/widgets.dart';

class AppThemeProvider extends InheritedWidget {
  final AppTheme theme;
  final AppThemeProviderWrapperState data;

  const AppThemeProvider({
    Key? key,
    required Widget child,
    required this.data,
    required this.theme,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static AppTheme of(BuildContext context) {
    return context
            .dependOnInheritedWidgetOfExactType<AppThemeProvider>()
            ?.theme ??
        AppTheme.defaultTheme;
  }
}

class AppThemeProviderWrapper extends StatefulWidget {
  final Widget child;

  const AppThemeProviderWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  static AppThemeProviderWrapperState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<AppThemeProvider>())!
        .data;
  }

  @override
  AppThemeProviderWrapperState createState() => AppThemeProviderWrapperState();
}

class AppThemeProviderWrapperState extends State<AppThemeProviderWrapper> {
  AppTheme _theme = AppTheme.defaultTheme;

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
      child: widget.child,
      data: this,
      theme: _theme,
    );
  }
}
