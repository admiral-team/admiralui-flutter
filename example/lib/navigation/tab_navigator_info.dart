import 'package:flutter/material.dart';

import '../screens/info/info_screen.dart';

enum TabNavigatorInfoRoutes {
  home('/');

  const TabNavigatorInfoRoutes(this.value);
  final String value;
}

class TabNavigatorInfo extends StatelessWidget {
  const TabNavigatorInfo({
    super.key,
    required this.navigatorKey,
  });

  final GlobalKey<NavigatorState>? navigatorKey;

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return <String, WidgetBuilder>{
      TabNavigatorInfoRoutes.home.value: (BuildContext context) => InfoScreen(
            title: 'Info',
            onPush: (TabNavigatorInfoRoutes route) {},
          ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, WidgetBuilder> routeBuilders = _routeBuilders(context);

    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorInfoRoutes.home.value,
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<Map<String, WidgetBuilder>>(
          builder: (BuildContext context) =>
              routeBuilders[routeSettings.name]!(context),
        );
      },
    );
  }
}
