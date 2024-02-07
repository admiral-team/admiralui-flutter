import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class SmallBadgesScreen extends StatelessWidget {
  const SmallBadgesScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: colors.backgroundBasic.color(),
        title: Text(
          title,
          style: fonts.largeTitle1.toTextStyle(
            colors.textPrimary.color(),
          ),
        ),
      ),
      body: SizedBox.expand(
        child: Container(
          color: colors.backgroundBasic.color(),
          padding: EdgeInsets.all(
            LayoutGrid.doubleModule,
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const BadgeWidget(style: BadgeStyle.additional),
                      SizedBox(width: LayoutGrid.module),
                      const BadgeWidget(style: BadgeStyle.natural),
                      SizedBox(width: LayoutGrid.module),
                      const BadgeWidget(style: BadgeStyle.normal),
                      SizedBox(width: LayoutGrid.module),
                      const BadgeWidget(style: BadgeStyle.success),
                      SizedBox(width: LayoutGrid.module),
                      const BadgeWidget(style: BadgeStyle.error),
                      SizedBox(width: LayoutGrid.module),
                      const BadgeWidget(style: BadgeStyle.attention),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
