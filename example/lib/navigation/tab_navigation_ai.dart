import 'package:example/screens/ai/template_screen.dart';
import 'package:example/screens/ai/templates_screen.dart';
import 'package:flutter/material.dart';
import '../screens/ai/ai_screen.dart';

enum TabNavigatorAIRoutes {
  home('/'),
  localTemplates('/localTemplates'),
  remoteTemplates('/remoteTemplates'),
  localTemplate('/localTemplate'),
  remoteTemplate('/remoteTemplate');

  const TabNavigatorAIRoutes(this.value);
  final String value;
}

class TabNavigatorAI extends StatelessWidget {
  const TabNavigatorAI({
    super.key,
    required this.navigatorKey,
  });

  final GlobalKey<NavigatorState>? navigatorKey;

  void _push(BuildContext context, TabNavigatorAIRoutes route,
      [Object? arguments]) {
    final Map<String, WidgetBuilder> routeBuilders = _routeBuilders(context);

    Navigator.push(
      context,
      MaterialPageRoute<Map<String, WidgetBuilder>>(
        builder: (BuildContext context) => routeBuilders[route.value]!(context),
        settings: RouteSettings(arguments: arguments)
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return <String, WidgetBuilder>{
      TabNavigatorAIRoutes.home.value: (BuildContext context) => AIScreen(
            title: 'AI',
            onPush: (TabNavigatorAIRoutes route) => _push(context, route),
          ),
      TabNavigatorAIRoutes.localTemplate.value: (BuildContext context) => 
        TemplateScreen(appBarHidden: false, 
        onPush: (TabNavigatorAIRoutes route, String templateName) => _push(
            context, route, templateName
        ),isLocal: true),
      TabNavigatorAIRoutes.remoteTemplate.value: (BuildContext context) => 
        TemplateScreen(appBarHidden: false, 
        onPush: (TabNavigatorAIRoutes route, String templateName) => _push(
            context, route, templateName
        ),isLocal: false),
      TabNavigatorAIRoutes.localTemplates.value: (BuildContext context) => 
        TemplatesScreen(
          onPush: (TabNavigatorAIRoutes route, String templateName) => _push(
            context, route, templateName
        )
      ),
      TabNavigatorAIRoutes.remoteTemplates.value: (BuildContext context) => 
        TemplatesScreen(
          onPush: (TabNavigatorAIRoutes route, String templateName) => _push(
            context, route, templateName
        ),
        isLocal: false,
      )
    };
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, WidgetBuilder> routeBuilders = _routeBuilders(context);

    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorAIRoutes.home.value,
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<Map<String, WidgetBuilder>>(
          builder: (BuildContext context) =>
              routeBuilders[routeSettings.name]!(context),
        );
      },
    );
  }
}
