import 'package:flutter/material.dart';

import '../screens/buttons/buttons_ghost_screen.dart';
import '../screens/buttons/buttons_primary_screen.dart';
import '../screens/buttons/buttons_secondary_screen.dart';
import '../screens/buttons/buttons_screen.dart';
import '../screens/home_screen.dart';
import '../screens/badges_screen.dart';
import '../screens/normal_badges_screen.dart';
import '../screens/small_badges_sreen.dart';
import '../screens/switcher_screen.dart';
import '../screens/tags_screen.dart';
import '../screens/links_screen.dart';
import '../screens/feedback_screen.dart';
import '../screens/textfields_screen.dart';
import '../screens/tabs_screen.dart';
import '../screens/undeline_tabs.dart';

enum TabNavigatorRoutes {
  home('/'),
  textfields('/textfields'),
  feedback('/textfields/feedback'),
  switcher('/switcher'),
  tabs('/tabs'),
  underlineTabs('/underlineTabs'),
  buttons('/buttons'),
  buttonsPrimary('/buttons/primary'),
  buttonsSecondary('/buttons/secondary'),
  buttonsGhost('/buttons/ghost'),
  tags('/tags'),
  links('/links'),
  badges('/badges'),
  normalBadges('/normalBadges'),
  smallBadges('/smallBadges'),
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
      TabNavigatorRoutes.buttons.value: (BuildContext context) => ButtonsScreen(
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
      TabNavigatorRoutes.badges.value: (BuildContext context) => BadgesScreen(
            title: 'Badges',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.smallBadges.value: (BuildContext context) =>
          const SmallBadgesScreen(title: 'Small Badges'),
      TabNavigatorRoutes.normalBadges.value: (BuildContext context) =>
          const NormalBadgesScreen(title: 'Normal Badges'),
      TabNavigatorRoutes.buttons.value: (BuildContext context) => ButtonsScreen(
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.buttonsPrimary.value: (BuildContext context) =>
          ButtonsPrimaryScreen(),
      TabNavigatorRoutes.buttonsSecondary.value: (BuildContext context) =>
          ButtonsSecondaryScreen(),
      TabNavigatorRoutes.buttonsGhost.value: (BuildContext context) =>
          ButtonsGhostScreen(),
      TabNavigatorRoutes.tags.value: (BuildContext context) =>
          const TagsScreen(),
      TabNavigatorRoutes.switcher.value: (BuildContext context) =>
          const SwitcherScreen(),
      TabNavigatorRoutes.tabs.value: (BuildContext context) => TabsScreen(
            title: 'Tabs',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.underlineTabs.value: (BuildContext context) =>
          UnderlineTabsScreen(
            title: 'Underline Tabs',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.links.value: (BuildContext context) =>
          const LinksScreen(),
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
