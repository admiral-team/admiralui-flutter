import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../navigation/tab_navigator_home.dart';

class CurrencyFlagsScreen extends StatelessWidget {
  const CurrencyFlagsScreen({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorRoutes route) onPush;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: CupertinoButton(
          child: const Icon(Icons.arrow_back_ios),
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
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: LayoutGrid.doubleModule,
        ),
        color: colors.backgroundBasic.color(),
        child: Column(
          children: <Widget>[
            Spacer(),
            CurrencyHeader(
              currencyText: 'Валюта',
              buyText: 'Купить',
              sellText: 'Продать',
              isTextSpacingEnabled: false,
            ),
            SizedBox(
              height: LayoutGrid.doubleModule,
            ),
            Currency(
              'USD',
              '89',
              '90',
              AdmiralIcons.admiral_ic_flag_outline,
              CurrencyCellType.none,
              CurrencyCellType.none,
            ),
            SizedBox(
              height: LayoutGrid.halfModule * 3,
            ),
            Currency(
              'USD',
              '89',
              '90',
              AdmiralIcons.admiral_ic_flag_outline,
              CurrencyCellType.none,
              CurrencyCellType.none,
            ),
            SizedBox(
              height: LayoutGrid.halfModule * 3,
            ),
            Currency(
              'USD',
              '89',
              '90',
              AdmiralIcons.admiral_ic_flag_outline,
              CurrencyCellType.none,
              CurrencyCellType.none,
            ),
            SizedBox(
              height: LayoutGrid.halfModule * 3,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
