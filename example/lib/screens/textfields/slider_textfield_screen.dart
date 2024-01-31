import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../navigation/tab_navigator_home.dart';

class SliderTextFieldScreen extends StatefulWidget {
  const SliderTextFieldScreen({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorRoutes route) onPush;

  @override
  State<SliderTextFieldScreen> createState() => _SliderTextFieldScreenState();
}

class _SliderTextFieldScreenState extends State<SliderTextFieldScreen> {
  bool isEnabled = true;
  FocusNode focusNode = FocusNode();
  TextInputState state = TextInputState.normal;
  TextEditingController textController = TextEditingController(text: '10');
  late double _currentSliderValue = 0.0;

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
              SliderTextField(
                textController,
                state: state,
                focusNode: focusNode,
                labelText: 'label text',
                trailingText: '₽',
                placeHolderText: 'placeholder',
                informerText: 'Additional text',
                minLabelText: 0.0,
                maxLabelText: 100.0,
                divisions: 100,
                currentValue: _currentSliderValue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
