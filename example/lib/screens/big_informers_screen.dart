import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class BigInformersScreen extends StatelessWidget {
  const BigInformersScreen({
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
      backgroundColor: colors.backgroundBasic.color(),
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottomOpacity: 0.0,
        title: Text(
          title,
          style: fonts.subtitle2.toTextStyle(
            colors.textPrimary.color(),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(
          LayoutGrid.doubleModule,
        ),
        child: SizedBox.expand(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextView(
                  'Default',
                  font: fonts.body1,
                  textColorNormal: colors.textSecondary.color(),
                ),
                SizedBox(
                  height: LayoutGrid.doubleModule,
                ),
                Container(
                  child: BigInformerWidget(
                    title: 'Headline',
                    subtitle: 'At breakpoint boundaries, mini units divide the'
                        'screen into a fixed master.',
                    linkText: 'Link text',
                    style: InformerStyle.normal,
                  ),
                ),
                SizedBox(
                  height: LayoutGrid.doubleModule,
                ),
                TextView(
                  'Success',
                  font: fonts.body1,
                  textColorNormal: colors.textSecondary.color(),
                ),
                SizedBox(
                  height: LayoutGrid.doubleModule,
                ),
                BigInformerWidget(
                  title: 'Headline',
                  subtitle: 'At breakpoint boundaries, mini units divide the'
                      'screen into a fixed master.',
                  linkText: 'Link text',
                  style: InformerStyle.success,
                ),
                SizedBox(
                  height: LayoutGrid.doubleModule,
                ),
                TextView(
                  'Attention',
                  font: fonts.body1,
                  textColorNormal: colors.textSecondary.color(),
                ),
                SizedBox(
                  height: LayoutGrid.doubleModule,
                ),
                BigInformerWidget(
                  title: 'Headline',
                  subtitle: 'At breakpoint boundaries, mini units divide the'
                      'screen into a fixed master.',
                  linkText: 'Link text',
                  style: InformerStyle.attention,
                ),
                SizedBox(
                  height: LayoutGrid.doubleModule,
                ),
                TextView(
                  'Error',
                  font: fonts.body1,
                  textColorNormal: colors.textSecondary.color(),
                ),
                SizedBox(
                  height: LayoutGrid.doubleModule,
                ),
                BigInformerWidget(
                  title: 'Headline',
                  subtitle: 'At breakpoint boundaries, mini units divide the'
                      'screen into a fixed master.',
                  linkText: 'Link text',
                  style: InformerStyle.error,
                ),
                SizedBox(
                  height: LayoutGrid.doubleModule,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
