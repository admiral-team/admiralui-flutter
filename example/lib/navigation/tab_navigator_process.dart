import 'package:flutter/material.dart';

import '../screens/in_progress_screen.dart';

class TabNavigatorRoutes {
  static const String home = '/';
}

class TabNavigatorProcess extends StatelessWidget {
  const TabNavigatorProcess({super.key, required this.navigatorKey});

  final GlobalKey<NavigatorState>? navigatorKey;

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return <String, WidgetBuilder>{
      TabNavigatorRoutes.home: (BuildContext context) =>
          const InProgressScreen(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, WidgetBuilder> routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.home,
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<Map<String, WidgetBuilder>>(
          builder: (BuildContext context) =>
              routeBuilders[routeSettings.name!]!(context),
        );
      },
    );
  }
}
