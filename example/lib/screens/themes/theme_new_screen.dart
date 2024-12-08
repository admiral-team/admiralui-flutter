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
  bool isButtonEnabled = false;
  TextInputState inputState = TextInputState.normal;

  @override
  void initState() {
    super.initState();
    appThemeButtonStorage.setThemeButtonHidden(true);
  }

  Future<void> validateThemeName(String value) async {
    final AppTheme? existingTheme = await appThemeButtonStorage.getTheme(value);

    setState(() {
      if (existingTheme != null) {
        inputState = TextInputState.error;
        isButtonEnabled = false;
      } else {
        inputState = TextInputState.normal;
        isButtonEnabled = value.isNotEmpty;
      }
    });
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
              state: inputState,
              labelText: 'Название темы',
              placeHolderText: 'Theme',
              trailingIcon: Icon(AdmiralIcons.admiral_ic_edit_outline),
              onChanged: (String value) => validateThemeName(value),
            ),
            Spacer(),
            PrimaryButton(
              title: 'Далее',
              sizeType: ButtonSizeType.big,
              onPressed: isButtonEnabled
                  ? () => widget.onPush.call(
                        TabNavigatorRoutes.themeTemplate,
                        textController.text,
                      )
                  : null,
              isEnable: isButtonEnabled,
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
