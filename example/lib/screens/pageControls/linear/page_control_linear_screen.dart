import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';
import '../../../navigation/tab_navigator_home.dart';

class PageControlLinearScreen extends StatefulWidget {
  const PageControlLinearScreen({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorRoutes route) onPush;

  @override
  State<PageControlLinearScreen> createState() =>
      _PageControlLinearScreenState();
}

class _PageControlLinearScreenState extends State<PageControlLinearScreen> {
  SpinnerSize spinnerSize = SpinnerSize.small;
  final ValueNotifier<int> _stepNotifier = ValueNotifier<int>(0);

  final List<String> tabItems = <String>[
    'one',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
  ];

  int _currentStep = 0;

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
                tabItems,
                onTap: (String value) {
                  setState(() {
                    final int index = tabItems
                        .indexWhere((String element) => element == value);
                    _stepNotifier.value = index;
                    _currentStep = index;
                  });
                },
              ),
              SizedBox(
                height: LayoutGrid.module * 5,
              ),
              LinearPageControl(
                tabItems.length,
                _currentStep,
                5,
                stepNotifier: _stepNotifier,
              ),
              SizedBox(
                height: LayoutGrid.tripleModule * 3,
              ),
              PrimaryButton(
                onPressed: () {
                  if (_currentStep < tabItems.length - 1) {
                    setState(() {
                      _currentStep += 1;
                      _stepNotifier.value = _currentStep;
                    });
                  }
                },
                isEnable: true,
                title: 'Next',
                sizeType: ButtonSizeType.small,
                iconData: AdmiralIcons.admiral_ic_arrow_right_outline,
                iconPosition: IconPosition.right,
              )
            ],
          ),
        ),
      ),
    );
  }
}
