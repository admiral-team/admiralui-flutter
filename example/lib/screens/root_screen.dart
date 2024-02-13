import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

import '../navigation/bottom_navigation.dart';
import '../navigation/tab_item.dart';
import '../navigation/tab_navigator_home.dart';
import '../navigation/tab_navigator_process.dart';
import '../navigation/tab_navigator_chat.dart';
import '../storage/app_theme_storage.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  TabItem _currentTab = TabItem.main;
  bool _appThemeButtonHidden = false;

  final AppThemeStorage appThemeButtonStorage = AppThemeStorage();

  final Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys =
      <TabItem, GlobalKey<NavigatorState>>{
    TabItem.main: GlobalKey<NavigatorState>(),
    TabItem.info: GlobalKey<NavigatorState>(),
    TabItem.chat: GlobalKey<NavigatorState>(),
    TabItem.settings: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      _navigatorKeys[tabItem]!
          .currentState!
          .popUntil((Route<dynamic> route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  void initState() {
    super.initState();
    appThemeButtonStorage.addListener(_appThemeButtonListener);
  }

  @override
  void dispose() {
    super.dispose();
    appThemeButtonStorage.removeListener(_appThemeButtonListener);
  }

  void _appThemeButtonListener() {
    setState(() {
      _appThemeButtonHidden = appThemeButtonStorage.isButtonHidden;
    });
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;

    void changeTheme() {
      setState(() {
        final AppThemeProviderWrapperState wrapper =
            AppThemeProviderWrapper.of(context);
        wrapper.updateTheme();
      });
    }

    return PopScope(
      onPopInvoked: (_) async {
        final bool isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTab]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentTab != TabItem.main) {
            _selectTab(TabItem.main);
          }
        }
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _buildOffstageNavigator(TabItem.main),
            _buildOffstageNavigator(TabItem.info),
            _buildOffstageNavigator(TabItem.chat),
            _buildOffstageNavigator(TabItem.settings),
          ],
        ),
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
        floatingActionButton: !_appThemeButtonHidden
            ? FloatingActionButton.extended(
                backgroundColor: colors.backgroundExtraSurface.color(),
                shape: CircleBorder(),
                label: Icon(
                  AdmiralIcons.admiral_ic_menu_outline,
                  color: colors.elementExtra.color(),
                ),
                onPressed: () {
                  changeTheme();
                },
              )
            : null,
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    switch (tabItem) {
      case TabItem.main:
        return Offstage(
          offstage: _currentTab != tabItem,
          child: TabNavigatorHome(navigatorKey: _navigatorKeys[tabItem]),
        );
      case TabItem.settings:
        return Offstage(
          offstage: _currentTab != tabItem,
          child: TabNavigatorProcess(navigatorKey: _navigatorKeys[tabItem]),
        );
      case TabItem.info:
        return Offstage(
          offstage: _currentTab != tabItem,
          child: TabNavigatorProcess(navigatorKey: _navigatorKeys[tabItem]),
        );
      case TabItem.chat:
        return Offstage(
          offstage: _currentTab != tabItem,
          child: TabNavigatorChat(navigatorKey: _navigatorKeys[tabItem]),
        );
    }
  }
}
