import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class PaddingScreen extends StatefulWidget {
  const PaddingScreen({
    super.key,
    this.appBarHidden = false,
  });

  final bool appBarHidden;

  @override
  State<PaddingScreen> createState() => _PaddingScreenState();
}

class _PaddingScreenState extends State<PaddingScreen> {
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;

    return Scaffold(
      backgroundColor: colors.backgroundBasic.color(),
      appBar: AppBar(
        title: Text(
          'Padding',
          style: theme.fonts.subtitle2.toTextStyle(
            colors.textPrimary.color(),
          ),
        ),
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: colors.backgroundBasic.color(),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: LayoutGrid.doubleModule,
              ),
              child: StandardTabs(
                <String>['Default', 'Disabled'],
                onTap: (String value) {
                  setState(() {
                    isEnabled = value == 'Default';
                  });
                },
              ),
            ),
            SizedBox(
              height: LayoutGrid.module * 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: LayoutGrid.doubleModule,
              ),
              child: TextView(
                'Long',
                font: theme.fonts.body1,
                textColorNormal: colors.textSecondary.color(),
              ),
            ),
            PaddingWidget(style: PaddingStyle.long),
            SizedBox(
              height: LayoutGrid.tripleModule,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: LayoutGrid.doubleModule,
              ),
              child: TextView(
                'Short',
                font: theme.fonts.body1,
                textColorNormal: colors.textSecondary.color(),
              ),
            ),
            PaddingWidget(style: PaddingStyle.short),
          ],
        ),
      ),
    );
  }
}
