import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';
import '../../navigation/tab_navigator_home.dart';
import '../../storage/app_theme_storage.dart';

class ThemeTemplateScreen extends StatefulWidget {
  const ThemeTemplateScreen({
    super.key,
    required this.onPush,
  });

  final Function(TabNavigatorRoutes route) onPush;

  @override
  State<ThemeTemplateScreen> createState() => _ThemeTemplateScreenState();
}

class _ThemeTemplateScreenState extends State<ThemeTemplateScreen> {
  final AppThemeStorage appThemeStorage = AppThemeStorage();
  TextEditingController textController = TextEditingController(text: '');
  int selectedIndex = 0;
  late Future<List<AppTheme>> _themesFuture;

  @override
  void initState() {
    super.initState();
    appThemeStorage.setThemeButtonHidden(true);
    _themesFuture = appThemeStorage.getAllThemes();
  }

  @override
  void dispose() {
    super.dispose();
    appThemeStorage.setThemeButtonHidden(false);
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    final String themeName =
        ModalRoute.of(context)!.settings.arguments as String;

    Widget trailingCell(AppTheme choseTheme, bool isSelected) {
      return Row(
        children: <Widget>[
          TextView(
            isSelected ? 'Выбрано' : '',
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
        title: Text(
          'Новая тема',
          style: fonts.subtitle2.toTextStyle(
            colors.textPrimary.color(),
          ),
        ),
        centerTitle: true,
        backgroundColor: colors.backgroundBasic.color(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: LayoutGrid.doubleModule,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: LayoutGrid.tripleModule,
            ),
            TextView(
              'Выберите шаблон:',
              font: fonts.body2,
              textColorNormal: colors.textPrimary.color(),
            ),
            SizedBox(
              height: LayoutGrid.tripleModule,
            ),
            Expanded(
              child: FutureBuilder<List<AppTheme>>(
                future: _themesFuture,
                builder: (BuildContext context,
                    AsyncSnapshot<List<AppTheme>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

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
                      children: allThemes.map((AppTheme themeItem) {
                        return BaseCellWidget(
                          centerCell: TextView(themeItem.name),
                          trailingCell: trailingCell(themeItem,
                              selectedIndex == allThemes.indexOf(themeItem)),
                          horizontalPadding: 0,
                          onPressed: () {
                            setState(() {
                              selectedIndex = allThemes.indexOf(themeItem);
                            });
                          },
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ),
            PrimaryButton(
              title: 'Создать',
              sizeType: ButtonSizeType.big,
              onPressed: () async {
                final List<AppTheme> themes = await _themesFuture;
                final List<AppTheme> allThemes = <AppTheme>[
                  lightTheme,
                  darkTheme,
                  ...themes
                ];
                if (selectedIndex >= 0 && selectedIndex < allThemes.length) {
                  final AppTheme selectedTheme = allThemes[selectedIndex];
                  AppTheme newTheme = AppTheme(
                    name: themeName,
                    colors: selectedTheme.colors,
                    fonts: selectedTheme.fonts,
                  );
                  appThemeStorage.saveTheme(newTheme);
                  // ignore: always_specify_types
                  Navigator.of(context).popUntil((route) {
                    return route.settings.name == 
                    TabNavigatorRoutes.themes.value;
                  });
                }
              },
            ),
            SizedBox(
              height: LayoutGrid.doubleModule,
            ),
          ],
        ),
      ),
    );
  }
}
