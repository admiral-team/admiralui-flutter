import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:admiralui_flutter/theme/admiral_color.dart';
import 'package:example/screens/themes/theme_color_screen.dart';
import 'package:example/storage/app_theme_storage.dart';
import '../../navigation/tab_navigator_home.dart';
import 'package:flutter/material.dart';

class ThemeColorsScreen extends StatefulWidget {
  const ThemeColorsScreen({
    super.key,
    required this.onPush,
  });

  final Function(TabNavigatorRoutes route, ThemeColorInitModel model) onPush;

  @override
  State<ThemeColorsScreen> createState() => _ThemeColorsScreenState();
}

class _ThemeColorsScreenState extends State<ThemeColorsScreen> {
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
    final AppTheme choseTheme =
        ModalRoute.of(context)!.settings.arguments as AppTheme;
    return Scaffold(
        backgroundColor: colors.backgroundBasic.color(),
        appBar: AppBar(
          title: Text(
            'Colors',
            style: fonts.subtitle2.toTextStyle(
              colors.textPrimary.color(),
            ),
          ),
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
                    padding: const EdgeInsets.all(LayoutGrid.doubleModule),
                    child: TextView(
                      'Text',
                      font: fonts.subhead3,
                      textColorNormal: colors.elementSecondary.color(),
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder<List<AppTheme>>(
                        future: appThemeStorage.getAllThemes(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<AppTheme>> snapshot) {
                          final List<AppTheme> themes =
                              snapshot.data ?? <AppTheme>[];
                          final List<AppTheme> allThemes = <AppTheme>[
                            lightTheme,
                            darkTheme,
                            ...themes
                          ];
                          AppTheme theme = themes.isEmpty
                              ? choseTheme
                              : allThemes.firstWhere((AppTheme element) =>
                                  element.name == choseTheme.name);
                          final Map<String, AColor> colorsPalete =
                              theme.colors.allColors();
                          print(theme.name);
                          return ListView.builder(
                            addAutomaticKeepAlives: false,
                            addRepaintBoundaries: false,
                            physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics(),
                            ),
                            itemCount: theme.colors.allColors().length,
                            itemBuilder: (BuildContext ctx, int index) {
                              String? key = colorsPalete.keys.elementAt(index);
                              return BaseCellWidget(
                                  leadingCell: Container(
                                    width: 44,
                                    height: 44,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: colorsPalete[key]?.color()),
                                  ),
                                  centerCell: TitleSubtitleCellWidget(
                                    title: key,
                                    subtitle:
                                        colorsPalete[key]!.value.toString(),
                                  ),
                                  trailingCell: Icon(
                                    AdmiralIcons
                                        .admiral_ic_chevron_right_outline,
                                    color: colors.elementSecondary.color(),
                                  ),
                                  onPressed: () => widget.onPush(
                                        TabNavigatorRoutes.themeColor,
                                        ThemeColorInitModel(
                                            colorsPalete[key]!, theme, key),
                                      ));
                            },
                          );
                        }),
                  ),
                ],
              );
            }));
  }
}
