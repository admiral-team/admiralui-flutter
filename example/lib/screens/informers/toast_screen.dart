// ignore_for_file: lines_longer_than_80_chars

import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class ToastScreen extends StatefulWidget {
  const ToastScreen({super.key, this.appBarHidden = false});

  final bool appBarHidden;

  @override
  State<ToastScreen> createState() => _ToastScreenState();
}

class _ToastScreenState extends State<ToastScreen> {
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
        leading: BackButton(
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: LayoutGrid.doubleModule,
            ),
            TextView(
              'Компонент появляется в верхней части страницы на мобильных девайсах и справа в верхней части страницы на планшетах только внутри приложения, автоматически исчезает по таймауту, по свайпу вверх или по нажатию на иконку закрытия если она присутствует.\n\nКомпонентов на странице может быть несколько, если они приходят одновременно наслаиваясь друг на друга и исчезают по собственному таймауту. При тапу на группу таких уведомлений они раскрываются в список.',
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
                    ToastWidget(
                      title:
                          'At breakpoint boundaries, mini units divide the screen into a fixed master grid.',
                      linkText: 'Link text',
                      image: AdmiralIcons.admiral_ic_check_solid,
                      onClosePressed: () {
                        closeAllToastWidget();
                      },
                    ),
                    context: context,
                    isIgnoring: false,
                    animation: StyledToastAnimation.slideFromTop,
                    reverseAnimation: StyledToastAnimation.slideFromTop,
                    alignment: Alignment.center,
                    axis: Axis.vertical,
                    position: StyledToastPosition(
                        align: Alignment.topCenter, offset: 60.0),
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
