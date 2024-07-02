import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import '../../gen/assets.gen.dart';
import 'package:flutter/material.dart';
import '../../navigation/tab_navigator_home.dart';
import '../../storage/app_theme_storage.dart';

class ZeroScreen extends StatefulWidget {
  const ZeroScreen({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorRoutes route) onPush;

  @override
  State<ZeroScreen> createState() => _ZeroScreenState();
}

class _ZeroScreenState extends State<ZeroScreen> {
  FocusNode focusNode = FocusNode();
  TextInputState state = TextInputState.normal;
  TextEditingController textController = TextEditingController();
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

    return Scaffold(
      backgroundColor: colors.backgroundBasic.color(),
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
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
              ZeroScreenView(
                image: Assets.zeroScreen.success.image(),
                title: 'Header',
                subTitle:
                    // ignore: lines_longer_than_80_chars
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                buttonTitle: 'Хорошо',
              ),
            ],
          )),
    );
  }
}
