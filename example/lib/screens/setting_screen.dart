import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import '../navigation/tab_navigation_setting.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorSettingRoutes route) onPush;

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    return Scaffold(
      backgroundColor: colors.backgroundBasic.color(),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: LayoutGrid.module * 10,
        backgroundColor: colors.backgroundBasic.color(),
        title: Text(
          widget.title,
          style: fonts.largeTitle1.toTextStyle(
            colors.textPrimary.color(),
          ),
        ),
      ),
      body: Container(
        color: colors.backgroundBasic.color(),
        child: Material(
            color: colors.backgroundBasic.color(),
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BaseCellWidget(
                      centerCell: TitleCellWidget(
                        title: 'Переключить тему',
                      ),
                      trailingCell: Switcher(
                        onChanged: (bool isChecked) {
                          setState(() {
                            changeTheme();
                          });
                        },
                      ),
                      horizontalPadding: LayoutGrid.doubleModule,
                    ),
                  ],
                ))),
      ),
    );
  }

  void changeTheme() {
    setState(() {
      final AppThemeProviderWrapperState wrapper =
          AppThemeProviderWrapper.of(context);
      wrapper.updateTheme();
    });
  }
}
