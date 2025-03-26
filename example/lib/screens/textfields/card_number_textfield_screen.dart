import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';
import '../../navigation/tab_navigator_home.dart';

class CardNumberTextFieldScreen extends StatefulWidget {
  const CardNumberTextFieldScreen({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorRoutes route) onPush;

  @override
  State<CardNumberTextFieldScreen> createState() =>
      _CardNumberTextFieldScreenState();
}

class _CardNumberTextFieldScreenState extends State<CardNumberTextFieldScreen> {
  bool isEnabled = true;
  FocusNode focusNode = FocusNode();
  TextInputState state = TextInputState.normal;
  TextEditingController textController = TextEditingController();

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
                onSelected: (int value) {
                  setState(() {
                    switch (value) {
                      case 0:
                        state = TextInputState.normal;
                        break;
                      case 1:
                        state = TextInputState.error;
                        break;
                      case 2:
                        state = TextInputState.disabled;
                        break;
                    }
                  });
                },
              ),
              SizedBox(
                height: LayoutGrid.module * 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: LayoutGrid.module * 5),
                child: CardNumberTextField(
                  controller: textController,
                  key: const Key('cardNumberTextField'),
                  state: state,
                  focusNode: focusNode,
                  placeHolderText: '1111 2222 3333 4444',
                  informerText: 'Additional text',
                  trailingIcon: AdmiralIcons.admiral_ic_camera_outline,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
