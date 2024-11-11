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

  @override
  void initState() {
    super.initState();
    appThemeStorage.setThemeButtonHidden(true);
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    final String themeName =
        ModalRoute.of(context)!.settings.arguments as String;

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
            BaseCellWidget(
              centerCell: TextView('Light'),
              trailingCell: trailingCell(lightTheme),
              horizontalPadding: 0,
              onPressed: () {},
            ),
            BaseCellWidget(
              centerCell: TextView('Dark'),
              trailingCell: trailingCell(darkTheme),
              horizontalPadding: 0,
              onPressed: () {},
            ),
            Spacer(),
            PrimaryButton(
                title: 'Создать',
                sizeType: ButtonSizeType.big,
                onPressed: () {
                  appThemeStorage.createTheme(themeName, lightTheme);
                  widget.onPush.call(TabNavigatorRoutes.themes);
                }),
            SizedBox(
              height: LayoutGrid.doubleModule,
            ),
          ],
        ),
      ),
    );
  }
}
