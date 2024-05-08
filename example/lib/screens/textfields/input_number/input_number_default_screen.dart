import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';
import '../../../navigation/tab_navigator_home.dart';

class InputNumberDefaultScreen extends StatefulWidget {
  const InputNumberDefaultScreen({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorRoutes route) onPush;

  @override
  State<InputNumberDefaultScreen> createState() =>
      _InputNumberDefaultScreenState();
}

class _InputNumberDefaultScreenState extends State<InputNumberDefaultScreen> {
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    return Scaffold(
      backgroundColor: colors.backgroundBasic.color(),
      appBar: AppBar(
        backgroundColor: colors.backgroundBasic.color(),
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
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(LayoutGrid.doubleModule, 0,
            LayoutGrid.doubleModule, LayoutGrid.module * 6),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              StandardTabs(
                <String>['Default', 'Disabled'],
                onTap: (String value) {
                  setState(() {
                    switch (value) {
                      case 'Default':
                        isEnabled = true;
                        break;
                      case 'Disabled':
                        isEnabled = false;
                        break;
                    }
                  });
                },
              ),
              SizedBox(height: LayoutGrid.module * 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextView(
                    '5 Symbols',
                    font: theme.fonts.headline,
                    textColorNormal: theme.colors.textSecondary.color(),
                  )
                ],
              ),
              SizedBox(height: LayoutGrid.quadrupleModule),
              InputNumber(
                  title: 'Optional value',
                  maximumValue: 10000,
                  numberValue: 1,
                  onChangedValue: _ChangeInputControl,
                  style: InputNumberButtonStyle.normal,
                  isEnable: isEnabled,
                  minusButtonKey: const Key('minusInputButton'),
                  plusButtonKey: const Key('plusInputButton')
              ),
              SizedBox(height: LayoutGrid.module * 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextView(
                    '6 Symbols',
                    font: theme.fonts.headline,
                    textColorNormal: theme.colors.textSecondary.color(),
                  )
                ],
              ),
              SizedBox(height: LayoutGrid.quadrupleModule),
              InputNumber(
                  title: 'Optional value',
                  maximumValue: 100000,
                  numberValue: 100000,
                  onChangedValue: _ChangeInputControl,
                  style: InputNumberButtonStyle.normal,
                  isEnable: isEnabled),
              SizedBox(height: LayoutGrid.module * 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextView(
                    '8 Symbols',
                    font: theme.fonts.headline,
                    textColorNormal: theme.colors.textSecondary.color(),
                  )
                ],
              ),
              SizedBox(height: LayoutGrid.quadrupleModule),
              InputNumber(
                  title: 'Optional value',
                  maximumValue: 10000000,
                  numberValue: 10000000,
                  onChangedValue: _ChangeInputControl,
                  style: InputNumberButtonStyle.normal,
                  isEnable: isEnabled),
              SizedBox(height: LayoutGrid.module * 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextView(
                    '9 Symbols',
                    font: theme.fonts.headline,
                    textColorNormal: theme.colors.textSecondary.color(),
                  )
                ],
              ),
              SizedBox(height: LayoutGrid.quadrupleModule),
              InputNumber(
                  title: 'Optional value',
                  maximumValue: 100000000,
                  numberValue: 100000000,
                  onChangedValue: _ChangeInputControl,
                  style: InputNumberButtonStyle.normal,
                  isEnable: isEnabled),
              SizedBox(height: LayoutGrid.module * 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextView(
                    'Unlimited',
                    font: theme.fonts.headline,
                    textColorNormal: theme.colors.textSecondary.color(),
                  )
                ],
              ),
              SizedBox(height: LayoutGrid.quadrupleModule),
              InputNumber(
                  title: 'Optional value',
                  maximumValue: double.infinity,
                  onChangedValue: _ChangeInputControl,
                  style: InputNumberButtonStyle.normal,
                  isEnable: isEnabled),
              SizedBox(height: LayoutGrid.module * 5),
            ],
          ),
        ),
      ),
    );
  }

  void _ChangeInputControl(double value) {}
}
