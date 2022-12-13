import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/cupertino.dart';
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

    return Scaffold(
      appBar: appBarHidden
          ? null
          : AppBar(
              leading: CupertinoButton(
                child: const Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.of(context).pop(),
              ),
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
            )),
      ),
    );
  }
}
