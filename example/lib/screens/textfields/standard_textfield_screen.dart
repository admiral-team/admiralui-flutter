import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../navigation/tab_navigator_home.dart';

class StandardTextFieldScreen extends StatefulWidget {
  const StandardTextFieldScreen({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorRoutes route) onPush;

  @override
  State<StandardTextFieldScreen> createState() =>
      _StandardTextFieldScreenState();
}

class _StandardTextFieldScreenState extends State<StandardTextFieldScreen> {
  bool isEnabled = true;
  FocusNode focusNode = FocusNode();
  FocusNode secureFocusNode = FocusNode();
  TextInputState state = TextInputState.normal;
  TextEditingController textController = TextEditingController(text: 'Text');
  TextEditingController secureTextController =
      TextEditingController(text: 'Text');

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
          'Standard TextField',
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
                        state = TextInputState.normal;
                        break;
                      case 'Read Only':
                        state = TextInputState.readOnly;
                        break;
                      case 'Error':
                        state = TextInputState.error;
                        break;
                      case 'Disabled':
                        state = TextInputState.disabled;
                        break;
                    }
                  });
                },
              ),
              SizedBox(
                height: LayoutGrid.module * 5,
              ),
              TitleHeaderWidget(
                title: 'Basic',
                style: TitleHeaderStyle.headlineSecondary,
                textAlign: TextAlign.left,
                isEnable: isEnabled,
              ),
              SizedBox(
                height: LayoutGrid.module * 5,
              ),
              TextFieldWidget(
                textController,
                state: state,
                focusNode: focusNode,
                labelText: 'Optional label',
                placeHolderText: 'Placeholder',
                informerText: 'Additional text',
              ),
              SizedBox(
                height: LayoutGrid.module * 5,
              ),
              TitleHeaderWidget(
                title: 'Masked',
                style: TitleHeaderStyle.headlineSecondary,
                textAlign: TextAlign.left,
                isEnable: isEnabled,
              ),
              SizedBox(
                height: LayoutGrid.module * 5,
              ),
              TextFieldWidget(
                secureTextController,
                state: state,
                focusNode: secureFocusNode,
                labelText: 'Optional label',
                placeHolderText: 'Placeholder',
                informerText: 'Additional text',
                hasSecure: true,
              ),
              SizedBox(
                height: LayoutGrid.module * 5,
              ),
              TitleHeaderWidget(
                title: '+ Tags & Informer',
                style: TitleHeaderStyle.headlineSecondary,
                textAlign: TextAlign.left,
                isEnable: isEnabled,
              ),
              SizedBox(
                height: LayoutGrid.module * 5,
              ),
              TextFieldWidget(
                secureTextController,
                state: state,
                focusNode: secureFocusNode,
                labelText: 'Optional label',
                placeHolderText: 'Placeholder',
                trailingIcon: Icon(AdmiralIcons.admiral_ic_info_outline),
                bottomWidget: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      for (int i = 0; i < 10; i++)
                        Row(
                          children: <Widget>[
                            TagControlWidget(
                              trailingImage:
                                  AdmiralIcons.admiral_ic_heart_solid,
                              title: 'Text',
                              style: TagStyle.normal,
                              isEnabled: isEnabled,
                            ),
                            if (i != 9) SizedBox(width: LayoutGrid.module),
                          ],
                        ),
                    ],
                  ),
                ),
                informerText: 'Additional text',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
