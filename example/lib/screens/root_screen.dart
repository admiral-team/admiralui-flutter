import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

import '../navigation/bottom_navigation.dart';
import '../navigation/tab_item.dart';
import '../navigation/tab_navigator_home.dart';
import '../navigation/tab_navigator_process.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  TabItem _currentTab = TabItem.main;
  final Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys =
      <TabItem, GlobalKey<NavigatorState>>{
    TabItem.main: GlobalKey<NavigatorState>(),
    TabItem.info: GlobalKey<NavigatorState>(),
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
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;

    void changeTheme() {
      setState(() {
        final AppThemeProviderWrapperState wrapper =
            AppThemeProviderWrapper.of(context);
        wrapper.updateTheme();
      });
    }

    return WillPopScope(
      onWillPop: () async {
        final bool isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTab]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentTab != TabItem.main) {
            _selectTab(TabItem.main);
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _buildOffstageNavigator(TabItem.main, true),
            _buildOffstageNavigator(TabItem.info, false),
            _buildOffstageNavigator(TabItem.settings, false),
          ],
        ),
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: colors.backgroundExtraSurface.color(),
          onPressed: changeTheme,
          tooltip: 'Theme',
          child: Icon(
            AdmiralIcons.admiral_ic_menu_outline,
            color: colors.elementExtra.color(),
          ),
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem, bool isFinished) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: isFinished
          ? TabNavigatorHome(
              navigatorKey: _navigatorKeys[tabItem],
            )
          : TabNavigatorProcess(
              navigatorKey: _navigatorKeys[tabItem],
            ),
    );
  }
}
