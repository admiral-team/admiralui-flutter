import 'package:flutter/material.dart';
import '../screens/setting_screen.dart';

enum TabNavigatorSettingRoutes {
  home('/');

  const TabNavigatorSettingRoutes(this.value);
  final String value;
}

class TabNavigatorSetting extends StatelessWidget {
  const TabNavigatorSetting({
    super.key,
    required this.navigatorKey,
  });

  final GlobalKey<NavigatorState>? navigatorKey;

  void _push(BuildContext context, TabNavigatorSettingRoutes route) {
    final Map<String, WidgetBuilder> routeBuilders = _routeBuilders(context);

    Navigator.push(
      context,
      MaterialPageRoute<Map<String, WidgetBuilder>>(
        builder: (BuildContext context) => routeBuilders[route.value]!(context),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return <String, WidgetBuilder>{
      TabNavigatorSettingRoutes.home.value: (BuildContext context) => 
      SettingScreen(
            title: 'Настройки',
            onPush: (TabNavigatorSettingRoutes route) => _push(context, route),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, WidgetBuilder> routeBuilders = _routeBuilders(context);

    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorSettingRoutes.home.value,
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<Map<String, WidgetBuilder>>(
          builder: (BuildContext context) =>
              routeBuilders[routeSettings.name]!(context),
        );
      },
    );
  }
}
