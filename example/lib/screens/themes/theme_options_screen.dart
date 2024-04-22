import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
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
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          choseTheme.name,
          style: fonts.subtitle2.toTextStyle(
            colors.textPrimary.color(),
          ),
        ),
        bottomOpacity: 0.0,
        backgroundColor: colors.backgroundBasic.color(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          BaseCellWidget(
            centerCell: TextView('Colors'),
            trailingCell: Icon(
              AdmiralIcons.admiral_ic_chevron_right_outline,
              color: colors.elementSecondary.color(),
            ),
            onPressed: () => widget.onPush.call(
              TabNavigatorRoutes.themeColors,
              choseTheme,
            ),
          ),
          BaseCellWidget(
            centerCell: TextView('Typography'),
            trailingCell: Icon(
              AdmiralIcons.admiral_ic_chevron_right_outline,
              color: colors.elementSecondary.color(),
            ),
            onPressed: () => widget.onPush.call(
              TabNavigatorRoutes.themeFonts,
              choseTheme,
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(
              LayoutGrid.doubleModule,
            ),
            child: PrimaryButton(
              title: 'Создать новую тему',
              sizeType: ButtonSizeType.big,
            ),
          ),
        ],
      ),
    );
  }
}
