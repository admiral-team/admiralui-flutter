import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:example/navigation/tab_navigation_ai.dart';
import 'package:flutter/material.dart';
import '../storage/app_theme_storage.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  bool _appThemeButtonHidden = false;

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final AppThemeStorage appThemeButtonStorage = AppThemeStorage();

  @override
  void initState() {
    super.initState();
    appThemeButtonStorage.addListener(_appThemeButtonListener);
  }

  @override
  void dispose() {
    super.dispose();
    appThemeButtonStorage.removeListener(_appThemeButtonListener);
  }

  void _appThemeButtonListener() {
    setState(() {
      _appThemeButtonHidden = appThemeButtonStorage.isButtonHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (_) async {
        return ;
      },
      child: Scaffold(
        body: TabNavigatorAI(navigatorKey: _navigatorKey),
        floatingActionButton: !_appThemeButtonHidden
            ? AdmiralFloatingButton(
                items: <String>['Light', 'Dark'],
              )
            : null,
      ),
    );
  }
}
