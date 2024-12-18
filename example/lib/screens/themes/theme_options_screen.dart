import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:example/storage/app_theme_storage.dart';
import 'package:flutter/material.dart';
import '../../navigation/tab_navigator_home.dart';

class ThemeOptionsScreen extends StatefulWidget {
  const ThemeOptionsScreen({
    super.key,
    required this.onPush,
  });

  final Function(TabNavigatorRoutes route, AppTheme theme) onPush;

  @override
  State<ThemeOptionsScreen> createState() => _ThemeOptionsScreenState();
}

class _ThemeOptionsScreenState extends State<ThemeOptionsScreen> {
  final AppThemeStorage appThemeStorage = AppThemeStorage();
  TextEditingController textController = TextEditingController(text: '');
  AppTheme? choseTheme;
  bool isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;
    final AppTheme _choseTheme;

    if (choseTheme == null) {
      choseTheme = (ModalRoute.of(context)!.settings.arguments as AppTheme);
      _choseTheme = choseTheme!;
      textController.text = _choseTheme.name;
      isButtonEnabled = _choseTheme.name.isNotEmpty;
    } else {
      _choseTheme = choseTheme!;
    }

    return Scaffold(
        backgroundColor: colors.backgroundBasic.color(),
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            _choseTheme.name,
            style: fonts.subtitle2.toTextStyle(
              colors.textPrimary.color(),
            ),
          ),
          bottomOpacity: 0.0,
          backgroundColor: colors.backgroundBasic.color(),
          actions: (_choseTheme != darkTheme && _choseTheme != lightTheme)
              ? <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.delete_outline,
                      color: colors.elementSecondary.color(),
                    ),
                    onPressed: () {
                      appThemeStorage.deleteTheme(_choseTheme.name);
                      Navigator.of(context).pop();
                    },
                  ),
                ]
              : <Widget>[],
        ),
        body: AnimatedBuilder(
            animation: appThemeStorage,
            builder: (BuildContext context, Widget? child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  if (theme != darkTheme && theme != lightTheme)
                    Padding(
                      padding: const EdgeInsets.all(
                        LayoutGrid.doubleModule,
                      ),
                      child: TextFieldWidget(
                          key: const Key('standardTextField'),
                          textController,
                          labelText: 'Название темы',
                          placeHolderText: 'Theme'),
                    ),
                  BaseCellWidget(
                      centerCell: TextView('Colors'),
                      trailingCell: Icon(
                        AdmiralIcons.admiral_ic_chevron_right_outline,
                        color: colors.elementSecondary.color(),
                      ),
                      onPressed: () async {
                        final AppTheme? fetchedTheme =
                            await appThemeStorage.getTheme(_choseTheme.name) ??
                                _choseTheme;
                        if (fetchedTheme != null) {
                          widget.onPush.call(
                            TabNavigatorRoutes.themeColors,
                            fetchedTheme,
                          );
                        }
                      }),
                  BaseCellWidget(
                      centerCell: TextView('Typography'),
                      trailingCell: Icon(
                        AdmiralIcons.admiral_ic_chevron_right_outline,
                        color: colors.elementSecondary.color(),
                      ),
                      onPressed: () async {
                        final AppTheme? fetchedTheme =
                            await appThemeStorage.getTheme(_choseTheme.name) ??
                                _choseTheme;
                        if (fetchedTheme != null) {
                          widget.onPush.call(
                            TabNavigatorRoutes.themeFonts,
                            fetchedTheme,
                          );
                        }
                      }),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(
                      LayoutGrid.doubleModule,
                    ),
                    child: PrimaryButton(
                      title: 'Применить',
                      sizeType: ButtonSizeType.big,
                      onPressed: isButtonEnabled
                          ? () {
                              if (_choseTheme != darkTheme &&
                                  _choseTheme != lightTheme) {
                                AppTheme newTheme = AppTheme(
                                  name: textController.text,
                                  colors: _choseTheme.colors,
                                  fonts: _choseTheme.fonts,
                                );
                                appThemeStorage.deleteTheme(_choseTheme.name);
                                appThemeStorage.saveTheme(newTheme);
                                setTheme(newTheme);
                                Navigator.of(context).pop();
                              } else {
                                setTheme(_choseTheme);
                                Navigator.of(context).pop();
                              }
                            }
                          : null,
                      isEnable: isButtonEnabled,
                    ),
                  ),
                ],
              );
            }));
  }

  void setTheme(AppTheme theme) {
    setState(() {
      final AppThemeProviderWrapperState wrapper =
          AppThemeProviderWrapper.of(context);
      wrapper.setTheme(theme);
    });
  }
}
