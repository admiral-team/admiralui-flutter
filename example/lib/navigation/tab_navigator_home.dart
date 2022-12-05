import 'package:flutter/material.dart';

import '../screens/buttons_screen.dart';
import '../screens/home_screen.dart';
import '../screens/tags_screen.dart';
import '../screens/feedback_screen.dart';
import '../screens/textfields_screen.dart';

enum TabNavigatorRoutes {
  home('/'),
  textfields('/textfields'),
  feedback('/textfields/feedback'),
  buttons('/buttons'),
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
      TabNavigatorRoutes.textfields.value: (BuildContext context) =>
          TextfieldsScreen(
            title: 'TextFields',
             onPush: (TabNavigatorRoutes route) => _push(context, route)),
      TabNavigatorRoutes.feedback.value: (BuildContext context) =>
          const FeedbackScreen(title: 'Feedback'),
      TabNavigatorRoutes.tags.value: (BuildContext context) =>
          const TagsScreen(),
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
