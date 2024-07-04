import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:admiralui_flutter/theme/admiral_color.dart';
import 'package:flutter/material.dart';

class ThemeColorsScreen extends StatelessWidget {
  const ThemeColorsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;
    final AppTheme choseTheme =
        ModalRoute.of(context)!.settings.arguments as AppTheme;
    final Map<String, AColor> colorsPalete = choseTheme.colors.allColors();
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
      body: Column(
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
            child: ListView.builder(
              addAutomaticKeepAlives: false,
              addRepaintBoundaries: false,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              itemCount: choseTheme.colors.allColors().length,
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
                    subtitle: colorsPalete[key]!.value.toString(),
                  ),
                  trailingCell: Icon(
                    AdmiralIcons.admiral_ic_chevron_right_outline,
                    color: colors.elementSecondary.color(),
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
