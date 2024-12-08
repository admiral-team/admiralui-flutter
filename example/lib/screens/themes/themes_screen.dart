import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';
import '../../navigation/tab_navigator_home.dart';
import '../../storage/app_theme_storage.dart';

class ThemesScreen extends StatefulWidget {
  const ThemesScreen({
    super.key,
    required this.onPush,
  });

  final Function(TabNavigatorRoutes route, AppTheme? theme) onPush;

  @override
  State<ThemesScreen> createState() => _ThemesScreenState();
}

class _ThemesScreenState extends State<ThemesScreen> {
  final AppThemeStorage appThemeStorage = AppThemeStorage();

  @override
  void initState() {
    super.initState();
    appThemeStorage.setThemeButtonHidden(true);
  }

  @override
  void dispose() {
    appThemeStorage.setThemeButtonHidden(false);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    Widget trailingCell(AppTheme choseTheme) {
      return Row(
        children: <Widget>[
          TextView(
            theme == choseTheme ? 'Выбрано' : '',
            font: theme.fonts.subhead4,
            textColorNormal: theme.colors.elementAccent.color(),
          ),
          SizedBox(
            width: LayoutGrid.halfModule,
          ),
          Icon(
            AdmiralIcons.admiral_ic_chevron_right_outline,
            color: colors.elementSecondary.color(),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: colors.backgroundBasic.color(),
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: colors.backgroundBasic.color(),
      ),
      body: AnimatedBuilder(
        animation: appThemeStorage,
        builder: (BuildContext context, Widget? child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(
                  LayoutGrid.doubleModule,
                ),
                child: TextView(
                  'Themes',
                  font: fonts.title1,
                  textColorNormal: colors.textPrimary.color(),
                ),
              ),
              Expanded(
                child: FutureBuilder<List<AppTheme>>(
                  future: appThemeStorage.getAllThemes(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<AppTheme>> snapshot) {

                    final List<AppTheme> themes = snapshot.data ?? <AppTheme>[];
                    final List<AppTheme> allThemes = <AppTheme>[
                      lightTheme,
                      darkTheme,
                      ...themes
                    ];

                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: allThemes.map((AppTheme theme) {
                          return BaseCellWidget(
                            centerCell: TextView(theme.name),
                            trailingCell: trailingCell(theme),
                            onPressed: () => widget.onPush.call(
                              TabNavigatorRoutes.themeOptions,
                              theme,
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(
                  LayoutGrid.doubleModule,
                ),
                child: PrimaryButton(
                  title: 'Создать новую тему',
                  sizeType: ButtonSizeType.big,
                  onPressed: () => widget.onPush.call(
                    TabNavigatorRoutes.themeNew,
                    null,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
