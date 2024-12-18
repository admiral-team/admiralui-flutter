import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';
import '../../gen/assets.gen.dart';
import '../../navigation/tab_navigator_home.dart';

class AlertViewScreen extends StatefulWidget {
  const AlertViewScreen({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorRoutes route) onPush;

  @override
  State<AlertViewScreen> createState() => _AlertViewScreenState();
}

class _AlertViewScreenState extends State<AlertViewScreen> {
  bool isEnabled = true;
  bool isLoading = false;
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
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: LayoutGrid.doubleModule,
          ),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: LayoutGrid.quadrupleModule,
                ),
                TextView(
                    // ignore: lines_longer_than_80_chars
                    'Всплывающие окна поверх контента, часто содержат короткое информирующее сообщение, иллюстрацию и кнопки основгого или  альтернативного действия.',
                    font: theme.fonts.body2,
                    textColorNormal: theme.colors.textPrimary.color()),
                SizedBox(
                  height: LayoutGrid.quadrupleModule * 2,
                ),
                GhostButton(
                  key: const Key('showAlertButton'),
                  title: 'Показать Alert',
                  onPressed: () async {
                    await showDialog(
                        useSafeArea: false,
                        context: context,
                        builder: (_) => AlertView(
                              title: 'Header',
                              image: Assets.onboarding.two.image(),
                              description:
                                  // ignore: lines_longer_than_80_chars
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                              buttonTitle: 'Хорошо',
                              buttonAction: () {
                                _closeDialog();
                              },
                              additionalButtonTitle: 'Отмена',
                              additionalButtonAction: () {
                                _closeDialog();
                              },
                              buttonActionKey:
                                  const Key('alertViewButtonAction'),
                              additionalButtonKey:
                                  const Key('alertViewAdditionalButton'),
                            ));
                  },
                ),
                Spacer(),
              ],
            ),
          )),
    );
  }

  void _closeDialog() {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
