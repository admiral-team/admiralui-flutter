import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import '../gen/assets.gen.dart';
import 'package:flutter/material.dart';
import '../navigation/tab_navigator_home.dart';

class ShimmerScreen extends StatefulWidget {
  const ShimmerScreen({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorRoutes route) onPush;

  @override
  State<ShimmerScreen> createState() => _ShimmerScreenState();
}

class _ShimmerScreenState extends State<ShimmerScreen> {
  SpinnerSize spinnerSize = SpinnerSize.small;

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
          widget.title,
          style: fonts.subtitle2.toTextStyle(
            colors.textPrimary.color(),
          ),
        ),
        centerTitle: true,
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: colors.backgroundBasic.color(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: LayoutGrid.doubleModule,
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              BaseCellWidget(
                leadingCell: Assets.card.visa.image(
                  width: 40,
                  height: 28,
                ),
                centerCell: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextView(
                      'Зарплатная карта',
                      font: theme.fonts.body1,
                      textColorNormal: theme.colors.textPrimary.color(),
                    ),
                    TextView(
                      '66 800.00 ₽',
                      font: theme.fonts.subtitle2,
                      textColorNormal: theme.colors.textAccent.color(),
                    ),
                  ],
                ),
                trailingCell: Shimmer(
                  period: Duration(milliseconds: 2500),
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.colors.backgroundAdditionalOne.color(),
                      borderRadius: BorderRadius.all(
                        Radius.circular(14.5),
                      ),
                    ),
                    height: 9,
                    width: 29,
                  ),
                ),
                horizontalPadding: 0,
              ),
              BaseCellWidget(
                leadingCell: Shimmer(
                  period: Duration(milliseconds: 2500),
                  child: Assets.card.visa.image(
                    width: 40,
                    height: 28,
                  ),
                ),
                centerCell: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextView(
                      'Зарплатная карта',
                      font: theme.fonts.body1,
                      textColorNormal: theme.colors.textPrimary.color(),
                    ),
                    TextView(
                      '66 800.00 ₽',
                      font: theme.fonts.subtitle2,
                      textColorNormal: theme.colors.textAccent.color(),
                    ),
                  ],
                ),
                trailingCell: Assets.card.visaLabel.image(
                  height: 16,
                  width: 28,
                ),
                horizontalPadding: 0,
              ),
              BaseCellWidget(
                leadingCell: Assets.card.visa.image(
                  width: 40,
                  height: 28,
                ),
                centerCell: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextView(
                      'Зарплатная карта',
                      font: theme.fonts.body1,
                      textColorNormal: theme.colors.textPrimary.color(),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Shimmer(
                      period: Duration(milliseconds: 2500),
                      child: Container(
                        decoration: BoxDecoration(
                          color: theme.colors.backgroundAdditionalOne.color(),
                          borderRadius: BorderRadius.all(
                            Radius.circular(2),
                          ),
                        ),
                        height: 16,
                        width: 108,
                      ),
                    ),
                  ],
                ),
                trailingCell: Assets.card.visaLabel.image(
                  height: 16,
                  width: 28,
                ),
                horizontalPadding: 0,
              ),
              Shimmer(
                period: Duration(milliseconds: 2500),
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.colors.backgroundAdditionalOne.color(),
                    borderRadius: BorderRadius.all(
                      Radius.circular(2),
                    ),
                  ),
                  width: double.infinity,
                  height: 72,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
