import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import '../../storage/app_theme_storage.dart';
import 'package:flutter/material.dart';
import '../../navigation/tab_navigator_home.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorRoutes route) onPush;

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  bool isEnabled = true;
  CodeInputStatus _status = CodeInputStatus.normal;
  int _codeInputLength = 4;
  String _codeInputText = '123';
  final AppThemeStorage appThemeButtonStorage = AppThemeStorage();

  @override
  void initState() {
    super.initState();
    appThemeButtonStorage.toggleButton();
  }

  @override
  void dispose() {
    super.dispose();
    appThemeButtonStorage.toggleButton();
  }

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
          'Pincode',
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
        child: Column(
          children: <Widget>[
            StandardTabs(
              <String>['Default', 'Success', 'Error'],
              onTap: (String value) {
                setState(() {
                  switch (value) {
                    case 'Default':
                      _status = CodeInputStatus.normal;
                      break;
                    case 'Success':
                      _status = CodeInputStatus.success;
                      break;
                    case 'Error':
                      _status = CodeInputStatus.error;
                      break;
                    default:
                      break;
                  }
                });
              },
            ),
            SizedBox(height: LayoutGrid.tripleModule),
            InputNumber(
                title: 'Optional value',
                onChangedValue: _ChangeInputControl,
                style: InputNumberButtonStyle.normal,
                isEnable: isEnabled,
                numberValue: _codeInputLength.toDouble(),
                maximumValue: 8,
                minusButtonKey: const Key('minusInputButton'),
                plusButtonKey: const Key('plusInputButton')),
            Spacer(),
            CodeInputWidget(
              text: _codeInputText,
              itemCount: _codeInputLength,
              status: _status,
            ),
            Spacer(),
            PincodeView(
              onTapNumber: (String value) => <void>{
                if (_codeInputText.length < _codeInputLength)
                  <void>{
                    setState(() {
                      _codeInputText = _codeInputText + value;
                    }),
                  },
              },
              onTapTrailingWidget: () {
                setState(() {
                  if (_codeInputText.length > 0) {
                    _codeInputText =
                        _codeInputText.substring(0, _codeInputText.length - 1);
                  }
                });
              },
              leadingidget: Text(
                'Не могу войти',
                style: fonts.subhead4.toTextStyle(
                  colors.textSecondary.color(),
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              trailingWidget: Icon(
                Icons.backspace_outlined,
                color: theme.colors.elementPrimary.color(),
                size: 30,
              ),
            ),
            SizedBox(height: LayoutGrid.doubleModule),
          ],
        ),
      ),
    );
  }

  void _ChangeInputControl(double value) {
    setState(() {
      _codeInputLength = value.toInt();
    });
  }
}
