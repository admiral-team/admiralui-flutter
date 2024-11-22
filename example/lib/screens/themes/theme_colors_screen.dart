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
    final Map<String, Map<String, AColor>> groupedColors =
        groupColorsBySection(colorsPalete);

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
      body: ListView.builder(
        itemCount: groupedColors.keys.length,
        itemBuilder: (BuildContext context, int sectionIndex) {
          String sectionKey = groupedColors.keys.elementAt(sectionIndex);
          Map<String, AColor> sectionColors = groupedColors[sectionKey]!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(LayoutGrid.doubleModule),
                child: TextView(
                  sectionKey.capitalize(),
                  font: fonts.subhead3,
                  textColorNormal: colors.elementSecondary.color(),
                ),
              ),
              ...sectionColors.entries.map((MapEntry<String, AColor> entry) {
                String colorName = entry.key;
                AColor color = entry.value;

                return BaseCellWidget(
                  leadingCell: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color.color(),
                    ),
                  ),
                  centerCell: TitleSubtitleCellWidget(
                    title: colorName,
                    subtitle: colorToHexString(color.color()),
                  ),
                  trailingCell: Icon(
                    AdmiralIcons.admiral_ic_chevron_right_outline,
                    color: colors.elementSecondary.color(),
                  ),
                );
              }).toList(),
            ],
          );
        },
      ),
    );
  }

  colorToHexString(Color color) {
    return '#${color.value.toRadixString(16).substring(2, 8)}';
  }
}

Map<String, Map<String, AColor>> groupColorsBySection(
    Map<String, AColor> colorsPalete) {
  final Map<String, Map<String, AColor>> groupedColors =
      <String, Map<String, AColor>>{
    'background': <String, AColor>{},
    'element': <String, AColor>{},
    'special': <String, AColor>{},
    'text': <String, AColor>{},
  };

  colorsPalete.forEach((String key, AColor value) {
    if (key.startsWith('background')) {
      groupedColors['background']![key] = value;
    } else if (key.startsWith('element')) {
      groupedColors['element']![key] = value;
    } else if (key.startsWith('special')) {
      groupedColors['special']![key] = value;
    } else if (key.startsWith('text')) {
      groupedColors['text']![key] = value;
    }
  });

  return groupedColors;
}
