import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class ThemeFontsScreen extends StatelessWidget {
  const ThemeFontsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;
    final AppTheme choseTheme =
        ModalRoute.of(context)!.settings.arguments as AppTheme;
    final Map<String, AFont> fontsPalete = choseTheme.fonts.allFonts();
    final List<String> fontsPaleteKeys = fontsPalete.keys.toList()..sort();
    return Scaffold(
      backgroundColor: colors.backgroundBasic.color(),
      appBar: AppBar(
          title: Text(
            'Typography',
            style: fonts.subtitle2.toTextStyle(
              colors.textPrimary.color(),
            ),
          ),
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
          bottomOpacity: 0.0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(LayoutGrid.doubleModule),
            child: TextView(
              'Text',
              font: fonts.subhead4,
              textColorNormal: colors.elementSecondary.color(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              addAutomaticKeepAlives: false,
              addRepaintBoundaries: false,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              itemCount: fontsPalete.length,
              itemBuilder: (BuildContext ctx, int index) {
                String? key = fontsPaleteKeys[index];
                return Padding(
                  padding: const EdgeInsets.all(LayoutGrid.doubleModule),
                  child: TextView(
                    key,
                    font: fontsPalete[key],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
