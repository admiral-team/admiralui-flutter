import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class SmallInformersScreen extends StatelessWidget {
  const SmallInformersScreen({
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
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: colors.backgroundBasic.color(),
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
              child: SmallInformerWidget(
                title: 'Text Informer',
                style: InformerStyle.normal,
                arrowDirectionStyle: InformerDirectionStyle.topRight,
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
            SmallInformerWidget(
              title: 'Text Informer',
              style: InformerStyle.success,
              arrowDirectionStyle: InformerDirectionStyle.topRight,
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
            SmallInformerWidget(
              title: 'Text Informer',
              style: InformerStyle.attention,
              arrowDirectionStyle: InformerDirectionStyle.topRight,
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
            SmallInformerWidget(
              title: 'Text Informer',
              style: InformerStyle.error,
              arrowDirectionStyle: InformerDirectionStyle.topRight,
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
