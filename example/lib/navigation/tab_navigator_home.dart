import 'package:flutter/material.dart';

import '../screens/buttons_screen.dart';
import '../screens/home_screen.dart';
import '../screens/badges_screen.dart';
import '../screens/normal_badges_screen.dart';
import '../screens/small_badges_sreen.dart';
import '../screens/tags_screen.dart';

enum TabNavigatorRoutes {
  home('/'),
  buttons('/buttons'),
  badges('/badges'),
  tags('/tags'),
  normalBadges('/normalBadges'),
  smallBadges('/smallBadges');

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
      TabNavigatorRoutes.badges.value: (BuildContext context) => BadgesScreen(
            title: 'Badges',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.smallBadges.value: (BuildContext context) =>
          const SmallBadgesScreen(title: 'Small Badges'),
      TabNavigatorRoutes.normalBadges.value: (BuildContext context) =>
          const NormalBadgesScreen(title: 'Normal Badges'),
      TabNavigatorRoutes.tags.value: (BuildContext context) =>
          const TagsScreen()
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
