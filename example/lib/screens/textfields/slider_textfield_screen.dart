import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
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
  FocusNode focusNodeDoubleSlider = FocusNode();
  TextInputState state = TextInputState.normal;
  TextEditingController textController = TextEditingController(text: '10');
  TextEditingController textControllerLeading =
      TextEditingController(text: '0');
  TextEditingController textControllerTrailing =
      TextEditingController(text: '100');

  late double _currentSliderValue = 0.0;
  late RangeValues _currentRangeValues = RangeValues(0, 100);

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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              StandardTabs(
                <String>['Default', 'Error', 'Disabled'],
                onTap: (String value) {
                  setState(() {
                    switch (value) {
                      case 'Default':
                        state = TextInputState.normal;
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
                  title: 'Standard',
                  style: TitleHeaderStyle.headlineSecondary,
                  textAlign: TextAlign.left),
              SizedBox(
                height: LayoutGrid.module * 5,
              ),
              SliderTextField(
                key: const Key('sliderTextField'),
                textController,
                state: state,
                focusNode: focusNode,
                labelText: 'Optional label',
                trailingText: '₽',
                placeHolderText: '10',
                informerText: 'Additional text',
                minLabelText: 0.0,
                maxLabelText: 100.0,
                divisions: 100,
                currentValue: _currentSliderValue,
              ),
              SizedBox(
                height: LayoutGrid.module * 5,
              ),
              TitleHeaderWidget(
                  title: 'Double',
                  style: TitleHeaderStyle.headlineSecondary,
                  textAlign: TextAlign.left),
              SizedBox(
                height: LayoutGrid.module * 5,
              ),
              DoubleSliderTextField(
                leadingTextFieldKey: const Key('leadingTextField'),
                trailingTextFieldKey: const Key('trailingTextField'),
                textControllerLeading: textControllerLeading,
                textControllerTrailing: textControllerTrailing,
                state: state,
                focusNode: focusNodeDoubleSlider,
                labelText: 'Optional label',
                trailingText: '₽',
                placeholderFrom: '0',
                placeholderTo: '100',
                informerText: 'Additional text',
                minValue: 0.0,
                maxValue: 100.0,
                divisions: 100,
                currentRangeValues: _currentRangeValues,
              ),
              SizedBox(
                height: LayoutGrid.doubleModule * 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
