import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';
import '../navigation/tab_navigator_home.dart';

class SpinnerScreen extends StatefulWidget {
  const SpinnerScreen({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorRoutes route) onPush;

  @override
  State<SpinnerScreen> createState() => _SpinnerScreenState();
}

class _SpinnerScreenState extends State<SpinnerScreen> {
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
              StandardTabs(
                <String>['Small', 'Medium', 'Big'],
                onTap: (String value) {
                  setState(() {
                    switch (value) {
                      case 'Small':
                        spinnerSize = SpinnerSize.small;
                        break;
                      case 'Medium':
                        spinnerSize = SpinnerSize.medium;
                        break;
                      case 'Big':
                        spinnerSize = SpinnerSize.large;
                        break;
                    }
                  });
                },
              ),
              SizedBox(
                height: LayoutGrid.tripleModule * 5,
              ),
              Spinner(
                size: spinnerSize,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
