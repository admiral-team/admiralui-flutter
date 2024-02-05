import 'package:flutter/material.dart';
import '../screens/chat/chat_screen.dart';
import '../screens/chat/text_operation/text_operation_screen.dart';
import '../screens/chat/input/chat_input_screen.dart';

enum TabNavigatorChatRoutes {
  home('/'),
  textOperations('/textOperations'),
  input('/input');

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
      TabNavigatorChatRoutes.home.value: (BuildContext context) => ChatScreen(
            title: 'Chat',
            onPush: (TabNavigatorChatRoutes route) => _push(context, route),
          ),
      TabNavigatorChatRoutes.textOperations.value: (BuildContext context) =>
          TextOperationScreen(
            title: 'Text Operation',
            onPush: (TabNavigatorChatRoutes route) => _push(context, route),
          ),
      TabNavigatorChatRoutes.input.value: (BuildContext context) =>
          ChatInputScreen(
            title: 'Chat Input',
            onPush: (TabNavigatorChatRoutes route) => _push(context, route),
          ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, WidgetBuilder> routeBuilders = _routeBuilders(context);

    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorChatRoutes.home.value,
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<Map<String, WidgetBuilder>>(
          builder: (BuildContext context) =>
              routeBuilders[routeSettings.name]!(context),
        );
      },
    );
  }
}
