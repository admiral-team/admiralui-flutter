import 'package:flutter/material.dart';

import '../screens/buttons_screen.dart';
import '../screens/home_screen.dart';
import '../screens/tags_screen.dart';
import '../screens/informers_screen.dart';
import '../screens/big_informers_screen.dart';
import '../screens/small_informers_screen.dart';

enum TabNavigatorRoutes {
  home('/'),
  buttons('/buttons'),
  informers('/informers'),
  smallInformers('/smallInformers'),
  bigInformers('/bigInformers'),
  tags('/tags');

  const TabNavigatorRoutes(this.value);

  final String value;
}

class TabNavigatorHome extends StatelessWidget {
  const TabNavigatorHome({
    super.key,
    required this.navigatorKey,
  });

  final GlobalKey<NavigatorState>? navigatorKey;

  void _push(BuildContext context, TabNavigatorRoutes route) {
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
      TabNavigatorRoutes.home.value: (BuildContext context) => HomeScreen(
            title: 'Дизайн-система\n«Адмирал»',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.buttons.value: (BuildContext context) =>
          const ButtonsScreen(),
      TabNavigatorRoutes.tags.value: (BuildContext context) =>
          const TagsScreen(),
      TabNavigatorRoutes.informers.value: (BuildContext context) =>
          InformersScreen(
            title: 'Informers',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.bigInformers.value: (BuildContext context) =>
          const BigInformersScreen(title: 'Big Informers'),
      TabNavigatorRoutes.smallInformers.value: (BuildContext context) =>
          const SmallInformersScreen(title: 'Small Informers'),
    };
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, WidgetBuilder> routeBuilders = _routeBuilders(context);

    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.home.value,
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<Map<String, WidgetBuilder>>(
          builder: (BuildContext context) =>
              routeBuilders[routeSettings.name]!(context),
        );
      },
    );
  }
}
