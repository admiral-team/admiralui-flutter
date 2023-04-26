import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../navigation/tab_navigator_home.dart';

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
  bool isEnabled = true;
  bool isLoading = false;
  FocusNode focusNode = FocusNode();
  TextInputState state = TextInputState.normal;
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;

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
                image: Image.asset('assets/CheckSolid.png'),
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
