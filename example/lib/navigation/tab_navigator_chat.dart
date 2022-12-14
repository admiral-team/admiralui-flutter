import 'package:example/screens/chat_screen.dart';
import 'package:flutter/material.dart';

enum TabNavigatorChatRoutes {
  chat('/chat');

  const TabNavigatorChatRoutes(this.value);

  final String value;
}

class TabNavigatorChat extends StatelessWidget {
  const TabNavigatorChat({
    super.key,
    required this.navigatorKey,
  });

  final GlobalKey<NavigatorState>? navigatorKey;

  void _push(BuildContext context, TabNavigatorChatRoutes route) {
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
      TabNavigatorChatRoutes.chat.value: (BuildContext context) => ChatScreen(
            title: 'Chat',
            onPush: (TabNavigatorChatRoutes route) => _push(context, route),
          ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, WidgetBuilder> routeBuilders = _routeBuilders(context);

    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorChatRoutes.chat.value,
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<Map<String, WidgetBuilder>>(
          builder: (BuildContext context) =>
              routeBuilders[routeSettings.name]!(context),
        );
      },
    );
  }
}
