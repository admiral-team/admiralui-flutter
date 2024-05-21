import 'package:admiralui_flutter/theme/app_theme.dart';

import '../screens/tabs/logo_tabs_screen.dart';
import '../screens/tabs/outline_tabs_screen.dart';
import 'package:flutter/material.dart';

import '../screens/informers/notifications_screen.dart';
import '../screens/themes/themes_screen.dart';
import '../screens/themes/theme_options_screen.dart';
import '../screens/themes/theme_colors_screen.dart';
import '../screens/themes/theme_fonts_screen.dart';
import '../screens/textfields/number_screen.dart';
import '../screens/currency/currency_screen.dart';
import '../screens/radio_button_screen.dart';
import '../screens/buttons/buttons_ghost_screen.dart';
import '../screens/buttons/buttons_primary_screen.dart';
import '../screens/buttons/buttons_secondary_screen.dart';
import '../screens/buttons/buttons_other_screen.dart';
import '../screens/buttons/buttons_screen.dart';
import '../screens/buttons/buttons_rules_screen.dart';
import '../screens/home_screen.dart';
import '../screens/badges/badges_screen.dart';
import '../screens/badges/normal_badges_screen.dart';
import '../screens/badges/small_badges_sreen.dart';
import '../screens/switcher_screen.dart';
import '../screens/tags_screen.dart';
import '../screens/informers_screen.dart';
import '../screens/big_informers_screen.dart';
import '../screens/small_informers_screen.dart';
import '../screens/links_screen.dart';
import '../screens/feedback_screen.dart';
import '../screens/text_block/accordion_screen.dart';
import '../screens/textfields/slider_textfield_screen.dart';
import '../screens/textfields_screen.dart';
import '../screens/textfields/sms_code_textfield.dart';
import '../screens/textfields/standard_textfield_screen.dart';
import '../screens/textfields/card_number_textfield_screen.dart';
import '../screens/tabs/tabs_screen.dart';
import '../screens/tabs/underlineTabs/underline_tabs_screen.dart';
import '../screens/tabs/underlineTabs/underline_center_tabs_screen.dart';
import '../screens/tabs/underlineTabs/underline_slider_tabs_screen.dart';
import '../screens/tabs/icon_tabs_screen.dart';
import '../screens/tabs/informer_tabs_screen.dart';
import '../screens/tabs/tabs_standard_screen.dart';
import '../screens/informers/toast_screen.dart';
import '../screens/checkbox_screen.dart';
import '../screens/currency/currency_icon_screen.dart';
import '../screens/currency/currency_default_screen.dart';
import '../screens/currency/currency_flags_screen.dart';
import '../screens/currency/currency_icon_flags_screen.dart';
import '../screens/textfields/pin_code_screen.dart';
import '../screens/textfields/double_textfield_screen.dart';
import '../screens/cells/base_cell_screen.dart';
import '../screens/cells/cells_screen.dart';
import '../screens/cells/center_cell_screen.dart';
import '../screens/cells/leading_cell_screen.dart';
import '../screens/spinner_screen.dart';
import '../screens/cells/trailing_cell_screen.dart';
import '../screens/alerts_screen.dart';
import '../screens/alertsOnboarding/alert_screen.dart';
import '../screens/alertsOnboarding/error_view_screen.dart';
import '../screens/alertsOnboarding/zero_screen.dart';
import '../screens/alertsOnboarding/onboarding_view_screen.dart';
import '../screens/text_block/text_block_screen.dart';
import '../screens/toolbar_screen.dart';
import '../screens/action_toast_screen.dart';
import '../screens/informers/toast_informers_screen.dart';
import '../screens/text_block/paragraph_screen.dart';
import '../screens/text_block/link_text_block_screen.dart';
import '../screens/text_block/title_text_block_screen.dart';

import '../screens/calendars_screen.dart';
import '../screens/calendar/horizontal/calendar_horizontal_screen.dart';
import '../screens/calendar/horizontal/calendar_vertical_screen.dart';
import '../screens/shimmer_screen.dart';
import '../screens/pageControls/page_controls_screen.dart';
import '../screens/pageControls/linear/page_control_linear_screen.dart';
import '../screens/pageControls/circle/page_control_circle_screen.dart';
import '../screens/cells/action_cell_screen.dart';
import '../screens/informers/toast_static.dart';
import '../screens/textfields/input_number/input_number_default_screen.dart';
import '../screens/textfields/input_number/input_number_secondary_screen.dart';

enum TabNavigatorRoutes {
  home('/'),
  themes('/themes'),
  themeOptions('/themesOption'),
  themeColors('/themeColors'),
  themeFonts('/themeFonts'),
  checkbox('/checkbox'),
  textfields('/textfields'),
  feedback('/textfields/feedback'),
  standardTextfield('/textfields/standardTextfield'),
  doubleTextField('/textfields/dobuleTextField'),
  otpTextField('/textfields/otpTextTextfield'),
  inputNumberDefault('/textfields/inputNumber/inputNumberDefault'),
  inputNumberSecondary('/textfields/inputNumber/inputNumberSecondary'),
  inputNumberTextfield('/textfields/inputNumber/inputNumberTextField'),
  sliderTextField('/textfields/sliderTextfield'),
  cardNumberTextField('/textfields/cardNumberTextfield'),
  switcher('/switcher'),
  pageControls('/pageControls'),
  pageControlLinear('/pageControls/linear/linearPageControl'),
  pageControlCicle('/pageControls/linear/circlePageControl'),
  tabs('/tabs'),
  standardTabs('/tabs/standardTabs'),
  logoTabs('/tabs/logoTabs'),
  outlineTabs('/tabs/outlineTabs'),
  calendar('/calendar'),
  calendarHorizontal('/calendar/calendarHorizontal'),
  calendarVertical('/calendar/calendarVertical'),
  underlineTabs('/underlineTabs'),
  underlineCenterTabs('/underlineTabs/underlineCenterTabs'),
  underlineSliderTabs('/underlineTabs/underlineSliderTabs'),
  informerTabs('/informerTabs'),
  buttons('/buttons'),
  informers('/informers'),
  spinner('/spinner'),
  smallInformers('/smallInformers'),
  bigInformers('/bigInformers'),
  radioButtons('/radioButtons'),
  buttonsPrimary('/buttons/primary'),
  buttonsSecondary('/buttons/secondary'),
  buttonsGhost('/buttons/ghost'),
  buttonsOther('/buttons/other'),
  buttonsRules('/buttons/rules'),
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
  pinCode('/pinCode'),
  cells('/cells'),
  baseCells('/baseCells'),
  actionCells('/actionCells'),
  centerCells('/centerCells'),
  leadingCell('/leadingCell'),
  trailingCells('/trailingCells'),
  alerts('/alerts'),
  errorView('/alertsOnboarding/errorView'),
  zeroScreen('/alertsOnboarding/zeroScreen'),
  onboarding('/alertsOnboarding/onboarding'),
  textBlock('/textBlock'),
  accordion('/accordion'),
  toolbar('/toolbar'),
  paragraph('/paragraph'),
  linkTextBlock('/linkTextBlock'),
  titleTextBlock('/titleTextBlock'),
  shimmer('/shimmer'),
  toastInformers('/toastInformers'),
  notification('/notification'),
  toast('/toast'),
  toastStatic('/toastStatic'),
  toastAction('/toastAction'),
  alert('/alert'),
  number('/number');

  const TabNavigatorRoutes(this.value);

  final String value;
}

class TabNavigatorHome extends StatelessWidget {
  const TabNavigatorHome({
    super.key,
    required this.navigatorKey,
  });

  final GlobalKey<NavigatorState>? navigatorKey;

  void _push(BuildContext context, TabNavigatorRoutes route,
      [Object? arguments]) {
    final Map<String, WidgetBuilder> routeBuilders = _routeBuilders(context);

    Navigator.push(
      context,
      MaterialPageRoute<Map<String, WidgetBuilder>>(
          builder: (BuildContext context) =>
              routeBuilders[route.value]!(context),
          settings: RouteSettings(arguments: arguments)),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return <String, WidgetBuilder>{
      TabNavigatorRoutes.home.value: (BuildContext context) => HomeScreen(
            title: 'Дизайн-система\n«Адмирал»',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.themes.value: (BuildContext context) => ThemesScreen(
            onPush: (TabNavigatorRoutes route, AppTheme theme) =>
                _push(context, route, theme),
          ),
      TabNavigatorRoutes.themeOptions.value: (BuildContext context) =>
          ThemeOptionsScreen(
            onPush: (TabNavigatorRoutes route, AppTheme theme) =>
                _push(context, route, theme),
          ),
      TabNavigatorRoutes.themeColors.value: (BuildContext context) =>
          ThemeColorsScreen(),
      TabNavigatorRoutes.themeFonts.value: (BuildContext context) =>
          ThemeFontsScreen(),
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
      TabNavigatorRoutes.standardTextfield.value: (BuildContext context) =>
          StandardTextFieldScreen(
            title: 'Standard Textfield',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.doubleTextField.value: (BuildContext context) =>
          DoubleTextFieldScreen(
            title: 'Dobule Textfield',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.otpTextField.value: (BuildContext context) =>
          SMSCodeTextFieldScreen(
            title: 'SMS Code',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.cardNumberTextField.value: (BuildContext context) =>
          CardNumberTextFieldScreen(
            title: 'Card Number',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.inputNumberDefault.value: (BuildContext context) =>
          InputNumberDefaultScreen(
            title: 'Default',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.inputNumberSecondary.value: (BuildContext context) =>
          InputNumberSecondaryScreen(
            title: 'Secondary',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.spinner.value: (BuildContext context) => SpinnerScreen(
            title: 'Spinner',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.shimmer.value: (BuildContext context) => ShimmerScreen(
            title: 'Shimmers',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.sliderTextField.value: (BuildContext context) =>
          SliderTextFieldScreen(
            title: 'Slider',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.calendar.value: (BuildContext context) =>
          CalendarsScreen(
            title: 'Calendar',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.calendarHorizontal.value: (BuildContext context) =>
          const CalendarHorizontalScreen(title: 'Horizontal'),
      TabNavigatorRoutes.calendarVertical.value: (BuildContext context) =>
          const CalendarVerticalScreen(title: 'Vertical'),
      TabNavigatorRoutes.pageControls.value: (BuildContext context) =>
          PageControlsScreen(
            title: 'Page Controls',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.pageControlLinear.value: (BuildContext context) =>
          PageControlLinearScreen(
            title: 'Liner',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.pageControlCicle.value: (BuildContext context) =>
          PageControlCircleScreen(
            title: 'Circle',
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
      TabNavigatorRoutes.buttonsOther.value: (BuildContext context) =>
          ButtonsOtherScreen(),
      TabNavigatorRoutes.buttonsRules.value: (BuildContext context) =>
          ButtonsRulesScreen(),
      TabNavigatorRoutes.checkbox.value: (BuildContext context) =>
          const CheckboxScreen(),
      TabNavigatorRoutes.tags.value: (BuildContext context) =>
          const TagsScreen(),
      TabNavigatorRoutes.alerts.value: (BuildContext context) => AlertsScreen(
            title: 'Alerts',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.onboarding.value: (BuildContext context) =>
          OnboardingViewScreen(title: 'Onboarding'),
      TabNavigatorRoutes.errorView.value: (BuildContext context) =>
          ErrorViewScreen(
            title: 'ErrorView',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.alert.value: (BuildContext context) => AlertViewScreen(
            title: 'Alert',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.zeroScreen.value: (BuildContext context) => ZeroScreen(
            title: 'ZeroScreen',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
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
      TabNavigatorRoutes.underlineCenterTabs.value: (BuildContext context) =>
          UnderlineCenterTabsScreen(),
      TabNavigatorRoutes.underlineSliderTabs.value: (BuildContext context) =>
          UnderlineSliderTabsScreen(),
      TabNavigatorRoutes.iconTabs.value: (BuildContext context) =>
          IconTabsScreen(
            title: 'Icon Tabs',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.informerTabs.value: (BuildContext context) =>
          InformerTabsScreen(
            title: 'Informer Tabs',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.currency.value: (BuildContext context) =>
          CurrencyScreen(
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
      TabNavigatorRoutes.number.value: (BuildContext context) => NumberScreen(
            title: 'Number',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.links.value: (BuildContext context) =>
          const LinksScreen(),
      TabNavigatorRoutes.pinCode.value: (BuildContext context) => PinCodeScreen(
            title: 'Number',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.cells.value: (BuildContext context) => CellsScreen(
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.baseCells.value: (BuildContext context) =>
          BaseCellsScreen(
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.centerCells.value: (BuildContext context) =>
          const CenterCellsScreen(),
      TabNavigatorRoutes.leadingCell.value: (BuildContext context) =>
          const LeadingCellsScreen(),
      TabNavigatorRoutes.trailingCells.value: (BuildContext context) =>
          const TrailingCellsScreen(),
      TabNavigatorRoutes.textBlock.value: (BuildContext context) =>
          TextBlockScreen(
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.accordion.value: (BuildContext context) =>
          const AccordionScreen(),
      TabNavigatorRoutes.toolbar.value: (BuildContext context) =>
          const ToolbarScreen(title: 'Toolbar'),
      TabNavigatorRoutes.paragraph.value: (BuildContext context) =>
          const ParagraphScreen(),
      TabNavigatorRoutes.linkTextBlock.value: (BuildContext context) =>
          const LinkTextBlockScreen(),
      TabNavigatorRoutes.titleTextBlock.value: (BuildContext context) =>
          const TitleTextBlockScreen(),
      TabNavigatorRoutes.actionCells.value: (BuildContext context) =>
          const ActionCellsScreen(),
      TabNavigatorRoutes.toastInformers.value: (BuildContext context) =>
          ToastInformersScreen(
            title: 'Informers & Notifications',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.notification.value: (BuildContext context) =>
          NotificationScreen(
            title: 'Notifications',
            onPush: (TabNavigatorRoutes route) => _push(context, route),
          ),
      TabNavigatorRoutes.toast.value: (BuildContext context) =>
          const ToastScreen(),
      TabNavigatorRoutes.toastStatic.value: (BuildContext context) =>
          const ToastStaticScreen(),
      TabNavigatorRoutes.toastAction.value: (BuildContext context) =>
          const ActionToastScreen(),
      TabNavigatorRoutes.standardTabs.value: (BuildContext context) =>
          const TabStandardScreen(),
      TabNavigatorRoutes.logoTabs.value: (BuildContext context) =>
          const LogoTabsScreen(),
      TabNavigatorRoutes.outlineTabs.value: (BuildContext context) =>
          const OutlineTabsScreen()
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
