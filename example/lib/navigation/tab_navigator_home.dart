import 'package:flutter/material.dart';

import '../screens/currency_screen.dart';
import '../screens/radio_button_screen.dart';
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
import '../screens/informers_screen.dart';
import '../screens/big_informers_screen.dart';
import '../screens/small_informers_screen.dart';
import '../screens/links_screen.dart';
import '../screens/feedback_screen.dart';
import '../screens/textfields_screen.dart';
import '../screens/textfields/sms_code_textfield.dart';
import '../screens/standart_textfield_screen.dart';
import '../screens/tabs_screen.dart';
import '../screens/undeline_tabs.dart';
import '../screens/icon_tabs_screen.dart';
import '../screens/checkbox_screen.dart';
import '../screens/currency_icon_screen.dart';
import '../screens/currency_default_screen.dart';
import '../screens/currency_flags_screen.dart';
import '../screens/currency_icon_flags_screen.dart';
import '../screens/pin_code_screen.dart';

enum TabNavigatorRoutes {
  home('/'),
  checkbox('/checkbox'),
  textfields('/textfields'),
  feedback('/textfields/feedback'),
  standartTextfield('/textfields/standartTextfield'),
  otpTextField('/textfields/otpTextTextfield'),
  switcher('/switcher'),
  tabs('/tabs'),
  underlineTabs('/underlineTabs'),
  buttons('/buttons'),
  informers('/informers'),
  smallInformers('/smallInformers'),
  bigInformers('/bigInformers'),
  radioButtons('/radioButtons'),
  buttonsPrimary('/buttons/primary'),
  buttonsSecondary('/buttons/secondary'),
  buttonsGhost('/buttons/ghost'),
  links('/links'),
  iconTabs('/iconTabs'),
  badges('/badges'),
  normalBadges('/normalBadges'),
  smallBadges('/smallBadges'),
  currency('/currency'),
  currencyDefault('/currency/default'),
  currencyIcon('/currency/icon'),
  currencyFlags('/currency/flags'),
  currencyIconFlags('/currency/iconflags'),
  tags('/tags'),
  pinCode('/pinCode');

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
      TabNavigatorRoutes.radioButtons.value: (BuildContext context) =>
          const RadioButtonScreen(),
      TabNavigatorRoutes.textfields.value: (BuildContext context) =>
          TextfieldsScreen(
              title: 'TextFields',
              onPush: (TabNavigatorRoutes route) => _push(context, route)),
      TabNavigatorRoutes.feedback.value: (BuildContext context) =>
          const FeedbackScreen(title: 'Feedback'),
      TabNavigatorRoutes.standartTextfield.value: (BuildContext context) =>
          StandartTextFieldScreen(
            title: 'Standart Textfield',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.otpTextField.value: (BuildContext context) =>
          SMSCodeTextFieldScreen(
            title: 'SMS Code',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
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
      TabNavigatorRoutes.checkbox.value: (BuildContext context) =>
          const CheckboxScreen(),
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
      TabNavigatorRoutes.iconTabs.value: (BuildContext context) =>
          IconTabsScreen(
            title: 'Icon Tabs',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.currency.value: (BuildContext context) =>
          CurrencyScreen(
            title: 'Currency',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.currencyDefault.value: (BuildContext context) =>
          CurrencyDefaultScreen(
            title: 'Default',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.currencyIcon.value: (BuildContext context) =>
          CurrencyIconScreen(
            title: 'Icon',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.currencyFlags.value: (BuildContext context) =>
          CurrencyFlagsScreen(
            title: 'Flags',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.currencyIconFlags.value: (BuildContext context) =>
          CurrencyIconsFlagsScreen(
            title: 'Icon & Flags',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.links.value: (BuildContext context) =>
          const LinksScreen(),
      TabNavigatorRoutes.pinCode.value: (BuildContext context) =>
          const PinCodeScreen(),
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
