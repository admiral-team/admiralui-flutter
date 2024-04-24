import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';
import '../../navigation/tab_navigator_home.dart';

class DoubleTextFieldScreen extends StatefulWidget {
  const DoubleTextFieldScreen({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorRoutes route) onPush;

  @override
  State<DoubleTextFieldScreen> createState() => _DoubleTextFieldScreenState();
}

class _DoubleTextFieldScreenState extends State<DoubleTextFieldScreen> {
  FocusNode leftTextFieldFocusNode = FocusNode();
  FocusNode rightTextFieldFocusNode = FocusNode();
  TextEditingController leftTextController = TextEditingController();
  TextEditingController rightTextController = TextEditingController();
  TextEditingController leftTextUnequalController = TextEditingController();
  TextEditingController rightTextUnequalController = TextEditingController();
  TextInputState textFieldState = TextInputState.normal;

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
          'Double TextField',
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              StandardTabs(
                <String>['Default', 'Read Only', 'Error', 'Disabled'],
                onTap: (String value) {
                  setState(() {
                    switch (value) {
                      case 'Default':
                        textFieldState = TextInputState.normal;
                        break;
                      case 'Read Only':
                        textFieldState = TextInputState.readOnly;
                        break;
                      case 'Error':
                        textFieldState = TextInputState.error;
                        break;
                      case 'Disabled':
                        textFieldState = TextInputState.disabled;
                        break;
                    }
                  });
                },
              ),
              SizedBox(
                height: LayoutGrid.module * 5,
              ),
              TitleHeaderWidget(
                  title: '50/50',
                  style: TitleHeaderStyle.headlineSecondary,
                  textAlign: TextAlign.left),
              SizedBox(
                height: LayoutGrid.module * 5,
              ),
              DoubleTextField(
                TextFieldWidget(
                  key: const Key('firstDoubleTextField'),
                  leftTextController,
                  state: textFieldState,
                  labelText: 'label',
                  placeHolderText: 'placeholder',
                  informerText: 'informer text',
                ),
                TextFieldWidget(
                  key: const Key('secondDoubleTextField'),
                  rightTextController,
                  state: textFieldState,
                  labelText: 'label',
                  placeHolderText: 'placeholder',
                  informerText: 'informer text',
                ),
                DoubleTextFieldAlignment(),
              ),
              SizedBox(
                height: LayoutGrid.module * 5,
              ),
              TitleHeaderWidget(
                  title: '70/30',
                  style: TitleHeaderStyle.headlineSecondary,
                  textAlign: TextAlign.left),
              SizedBox(
                height: LayoutGrid.module * 5,
              ),
              DoubleTextField(
                TextFieldWidget(
                  key: const Key('thirdDoubleTextField'),
                  leftTextUnequalController,
                  state: textFieldState,
                  labelText: 'label',
                  placeHolderText: 'placeholder',
                  informerText: 'informer text',
                ),
                TextFieldWidget(
                  key: const Key('fourDoubleTextField'),
                  rightTextUnequalController,
                  state: textFieldState,
                  labelText: 'label',
                  placeHolderText: 'placeholder',
                  informerText: 'informer text',
                ),
                DoubleTextFieldAlignment(ratio: 70),
              )
            ],
          ),
        ),
      ),
    );
  }
}
