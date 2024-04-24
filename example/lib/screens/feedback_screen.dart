import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
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
          'Feedback',
          style: fonts.subtitle2.toTextStyle(
            colors.textPrimary.color(),
          ),
        ),
        centerTitle: true,
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
            Center(
              child: FeedbackInputControl(
                onRatingChanged: _ChangeInputControl,
                isEnabled: isEnabled,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _ChangeInputControl(double value) {}
}
