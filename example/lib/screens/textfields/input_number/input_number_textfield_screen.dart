import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../navigation/tab_navigator_home.dart';

class InputNumberTextFieldScreen extends StatefulWidget {
  const InputNumberTextFieldScreen({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorRoutes route) onPush;

  @override
  State<InputNumberTextFieldScreen> createState() =>
      _InputNumberTextFieldScreenState();
}

class _InputNumberTextFieldScreenState
    extends State<InputNumberTextFieldScreen> {
  FocusNode focusNode = FocusNode();
  TextInputState state = TextInputState.normal;
  TextEditingController textController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    return Scaffold(
      appBar: AppBar(
        leading: CupertinoButton(
          child: Icon(
            Icons.arrow_back_ios,
            color: colors.elementSecondary.color(),
          ),
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
      body: Container(
        color: colors.backgroundBasic.color(),
        padding: EdgeInsets.all(
          LayoutGrid.doubleModule,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            StandardTabs(
              <String>['Default', 'Disabled'],
              onTap: (String value) {
                setState(() {
                  switch (value) {
                    case 'Default':
                      state = TextInputState.normal;
                      break;
                    case 'Disabled':
                      state = TextInputState.disabled;
                      break;
                  }
                });
              },
            ),
            SizedBox(height: LayoutGrid.quadrupleModule),
            InputNumberTextField(
              textController,
              _ChangeInputControl,
              state: state,
              currentValue: 1000,
              focusNode: focusNode,
              title: 'Optional value',
              maximumValue: 100000,
              minimumValue: 0,
            )
          ],
        ),
      ),
    );
  }

  void _ChangeInputControl(double value) {}
}
