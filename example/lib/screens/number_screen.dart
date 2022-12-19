import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberScreen extends StatelessWidget {
  const NumberScreen({
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
      body: Container(
        color: colors.backgroundBasic.color(),
        padding: EdgeInsets.all(
          LayoutGrid.doubleModule,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Default',
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            SizedBox(height: LayoutGrid.doubleModule),
            InputNuber(
                title: 'Optional value',
                onInputNumber: _ChangeInputControl,
                style: InputNumberButtonStyle.normal),
            SizedBox(height: LayoutGrid.doubleModule),
            // Additional
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Secondary',
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            SizedBox(height: LayoutGrid.doubleModule),
            InputNuber(
                title: 'Optional value',
                onInputNumber: _ChangeInputControl,
                style: InputNumberButtonStyle.secondary),
          ],
        ),
      ),
    );
  }

  void _ChangeInputControl(double value) {}
}
