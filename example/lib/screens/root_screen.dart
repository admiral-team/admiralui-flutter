import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'in_progress.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(
      title: 'Дизайн-система\n«Адмирал»',
    ),
    const InProgress(),
    const InProgress(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    void _changeTheme() {
      setState(() {
        final AppThemeProviderWrapperState wrapper =
            AppThemeProviderWrapper.of(context);
        wrapper.updateTheme();
      });
    }

    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(
          _selectedIndex,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(AdmiralIcons.admiral_ic_star_solid),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(AdmiralIcons.admiral_ic_mobile_solid),
            label: 'Инфо',
          ),
          BottomNavigationBarItem(
            icon: Icon(AdmiralIcons.admiral_ic_settings_solid),
            label: 'Настройки',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: colors.elementAccent.color(),
        unselectedItemColor: colors.elementContrast.color(),
        selectedLabelStyle:
            fonts.caption2.toTextStyle(colors.textAccent.color()),
        unselectedLabelStyle:
            fonts.caption2.toTextStyle(colors.textContrast.color()),
        onTap: _onItemTapped,
        backgroundColor: colors.backgroundAccentDark.color(),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.backgroundExtraSurface.color(),
        onPressed: _changeTheme,
        tooltip: 'Theme',
        child: Icon(
          AdmiralIcons.admiral_ic_menu_outline,
          color: colors.elementExtra.color(),
        ),
      ),
    );
  }
}
