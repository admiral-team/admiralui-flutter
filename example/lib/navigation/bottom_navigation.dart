import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

import 'tab_item.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.currentTab,
    required this.onSelectTab,
  });

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    return BottomNavigationBar(
      selectedItemColor: colors.elementAccent.color(),
      unselectedItemColor: colors.elementContrast.color(),
      selectedLabelStyle: fonts.caption2.toTextStyle(colors.textAccent.color()),
      unselectedLabelStyle:
          fonts.caption2.toTextStyle(colors.textContrast.color()),
      backgroundColor: colors.backgroundAccentDark.color(),
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        _buildItem(TabItem.main),
        _buildItem(TabItem.info),
        _buildItem(TabItem.settings),
      ],
      onTap: (int index) => onSelectTab(
        TabItem.values[index],
      ),
      currentIndex: currentTab.index,
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    return BottomNavigationBarItem(
      icon: tabItem.icon,
      label: tabItem.title,
    );
  }
}
