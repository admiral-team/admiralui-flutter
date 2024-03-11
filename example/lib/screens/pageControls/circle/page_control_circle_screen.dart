import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';
import '../../../navigation/tab_navigator_home.dart';

class PageControlCircleScreen extends StatefulWidget {
  const PageControlCircleScreen({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorRoutes route) onPush;

  @override
  State<PageControlCircleScreen> createState() =>
      _PageControlCircleScreenState();
}

class _PageControlCircleScreenState extends State<PageControlCircleScreen> {
  SpinnerSize spinnerSize = SpinnerSize.small;
  final ValueNotifier<int> _countNotifier = ValueNotifier<int>(1);

  final List<String> tabItems = <String>[
    'One',
    'Two',
    'Three',
    'Four',
    'Five',
    'Six',
    'Seven'
  ];

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
              OutlineTabs.withStringItems(
                tabItems,
                onSelected: (int index) {
                  setState(() {
                    print(index + 1);
                    _countNotifier.value = index + 1;
                  });
                },
              ),
              SizedBox(
                height: LayoutGrid.quadrupleModule * 4,
              ),
              CircularPageControl(
                _countNotifier.value,
                0,
                countNotifier: _countNotifier,
              )
            ],
          ),
        ),
      ),
    );
  }
}
