import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../navigation/tab_navigator_home.dart';

class DobuleTextFieldScreen extends StatefulWidget {
  const DobuleTextFieldScreen({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorRoutes route) onPush;

  @override
  State<DobuleTextFieldScreen> createState() => _DobuleTextFieldScreenState();
}

class _DobuleTextFieldScreenState extends State<DobuleTextFieldScreen> {
  FocusNode leftTextFieldfocusNode = FocusNode();
  FocusNode rightTextFieldfocusNode = FocusNode();
  TextInputState leftTextFieldstate = TextInputState.normal;
  TextInputState rightTextFieldstate = TextInputState.normal;
  TextEditingController leftTextController = TextEditingController();
  TextEditingController rightTextController = TextEditingController();

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
                        leftTextFieldstate = TextInputState.normal;
                        rightTextFieldstate = TextInputState.normal;
                        break;
                      case 'Read Only':
                        leftTextFieldstate = TextInputState.readOnly;
                        rightTextFieldstate = TextInputState.readOnly;
                        break;
                      case 'Error':
                        leftTextFieldstate = TextInputState.error;
                        rightTextFieldstate = TextInputState.error;
                        break;
                      case 'Disabled':
                        leftTextFieldstate = TextInputState.disabled;
                        rightTextFieldstate = TextInputState.disabled;
                        break;
                    }
                  });
                },
              ),
              SizedBox(
                height: LayoutGrid.module * 5,
              ),
              DoubleTextField(
                TextFieldWidget(
                  leftTextController,
                  state: leftTextFieldstate,
                  focusNode: leftTextFieldfocusNode,
                  labelText: 'label',
                  placeHolderText: 'placeholder',
                  informerText: 'informer text',
                ),
                TextFieldWidget(
                  rightTextController,
                  state: rightTextFieldstate,
                  focusNode: rightTextFieldfocusNode,
                  labelText: 'label',
                  placeHolderText: 'placeholder',
                  informerText: 'informer text',
                ),
                DoubleTextFieldAlignment(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
