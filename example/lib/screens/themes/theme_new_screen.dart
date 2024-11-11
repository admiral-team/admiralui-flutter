import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';
import '../../navigation/tab_navigator_home.dart';
import '../../storage/app_theme_storage.dart';

class ThemeNewScreen extends StatefulWidget {
  const ThemeNewScreen({
    super.key,
    required this.onPush,
  });

  final Function(TabNavigatorRoutes route, String themeName) onPush;

  @override
  State<ThemeNewScreen> createState() => _ThemeNewScreenState();
}

class _ThemeNewScreenState extends State<ThemeNewScreen> {
  final AppThemeStorage appThemeButtonStorage = AppThemeStorage();
  TextEditingController textController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    appThemeButtonStorage.setThemeButtonHidden(true);
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

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
              'Придумайте название для новой темы',
              font: fonts.body2,
              textColorNormal: colors.textPrimary.color(),
            ),
            SizedBox(
              height: LayoutGrid.tripleModule,
            ),
            TextFieldWidget(
                key: const Key('standardTextField'),
                textController,
                labelText: 'Название темы',
                placeHolderText: 'Theme'),
            Spacer(),
            PrimaryButton(
              title: 'Далее',
              sizeType: ButtonSizeType.big,
              onPressed: () => widget.onPush.call(
                TabNavigatorRoutes.themeTemplate,
                textController.text,
              ),
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
