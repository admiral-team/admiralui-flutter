import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:example/gen/assets.gen.dart';

class ButtonsOtherScreen extends StatefulWidget {
  const ButtonsOtherScreen({
    super.key,
    this.appBarHidden = false,
  });

  final bool appBarHidden;

  @override
  State<ButtonsOtherScreen> createState() => _ButtonsOtherScreenState();
}

class _ButtonsOtherScreenState extends State<ButtonsOtherScreen> {
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    return Scaffold(
      backgroundColor: colors.backgroundBasic.color(),
      appBar: AppBar(
        leading: CupertinoButton(
          child: Icon(
            Icons.arrow_back_ios,
            color: colors.elementSecondary.color(),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Other buttons',
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            StandardTabs(
              <String>['Default', 'Disabled'],
              onTap: (String value) {
                setState(() {
                  isEnabled = value == 'Default';
                });
              },
            ),
            SizedBox(
              height: LayoutGrid.module * 5,
            ),
            PlatformButton(
              isEnable: isEnabled,
              iconData: Assets.card.appleWallet.image(),
              title: 'Добавить в Apple Wallet',
            ),
            SizedBox(
              height: LayoutGrid.halfModule * 5,
            ),
            PlatformButton(
              isEnable: isEnabled,
              iconPosition: IconPosition.right,
              iconData: Assets.card.googlePay.image(),
              title: 'Добавить в',
            ),
          ],
        ),
      ),
    );
  }
}
