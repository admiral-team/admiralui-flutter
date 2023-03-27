import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionToastScreen extends StatefulWidget {
  const ActionToastScreen({super.key, this.appBarHidden = false});

  final bool appBarHidden;

  @override
  State<ActionToastScreen> createState() => _ActionToastScreenState();
}

class _ActionToastScreenState extends State<ActionToastScreen> {
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    return Scaffold(
      backgroundColor: colors.backgroundBasic.color(),
      appBar: AppBar(
        centerTitle: true,
        leading: CupertinoButton(
          child: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: colors.backgroundBasic.color(),
        title: TextView(
          'Toast',
          font: fonts.subtitle2,
          textColorNormal: colors.textPrimary.color(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: LayoutGrid.doubleModule,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: LayoutGrid.doubleModule,
            ),
            TextView(
              'Компонент используется для отмены совершенного действия,'
              ' появляется внизу экрана поверх контента с обратным отсчетом'
              ' времени в 5 секунд сразу после '
              'совершения какого-либо действия.',
              font: fonts.body2,
              textColorNormal: colors.textPrimary.color(),
            ),
            SizedBox(
              height: LayoutGrid.quadrupleModule,
            ),
            GhostButton(
              title: 'Показать Toast',
              onPressed: () {
                showToastWidget(
                    ActionToastWidget(
                      title:
                          'Сообщение будет удалено',
                      linkText: 'Отмена',
                      onLinkPressed: () {
                        closeAllToastWidget();
                      },
                    ),
                    context: context,
                    isIgnoring: false,
                    animation: StyledToastAnimation.slideFromBottom,
                    reverseAnimation: StyledToastAnimation.slideFromBottom,
                    alignment: Alignment.center,
                    axis: Axis.vertical,
                    position: StyledToastPosition(
                        align: Alignment.bottomCenter, offset: 60.0),
                    animDuration: Duration(milliseconds: 800),
                    duration: Duration(seconds: 5),
                    curve: Curves.linearToEaseOut,
                    reverseCurve: Curves.linearToEaseOut);
              },
            )
          ],
        ),
      ),
    );
  }
}