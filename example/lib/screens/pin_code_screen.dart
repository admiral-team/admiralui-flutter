import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class PinCodeScreen extends StatelessWidget {
  const PinCodeScreen({
    super.key,
    this.appBarHidden = false,
  });

  final bool appBarHidden;

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
          'Standard TextField',
          style: fonts.subtitle2.toTextStyle(
            colors.textPrimary.color(),
          ),
        ),
        centerTitle: true,
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: colors.backgroundBasic.color(),
      ),
      body: SizedBox.expand(
        child: Container(
          color: colors.backgroundBasic.color(),
          padding: EdgeInsets.all(
            LayoutGrid.doubleModule,
          ),
          child: CodeInputWidget(
            text: '123',
            itemCount: 4,
          ),
        ),
      ),
    );
  }
}
