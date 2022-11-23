import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({
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
        width: double.infinity,
        height: double.infinity,
        color: colors.backgroundBasic.color(),
        padding: EdgeInsets.all(
          LayoutGrid.doubleModule,
        ),
        child: FeedbackInputControl(onRatingChanged: _ChangeInputControl),
      ),
    );
  }

  void _ChangeInputControl(double value) {
  }
}
