import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class ActionToastWidget extends StatelessWidget {
  const ActionToastWidget({
    super.key,
    this.duration = 5,
    this.title,
    this.linkText,
    this.onLinkPressed,
    this.style = ToastStyle.normal,
    this.scheme,
  });

  final int duration;
  final String? title;
  final String? linkText;
  final VoidCallback? onLinkPressed;
  final ToastStyle style;
  final ActionToastScheme? scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ActionToastScheme toastScheme = scheme 
    ?? ActionToastScheme(theme: theme);

    final Color backgroundColor = toastScheme.backgroundColor.unsafeParameter(
      style,
    );
    final Color textColor = toastScheme.textColor;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: LayoutGrid.doubleModule,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(LayoutGrid.halfModule * 3),
        ),
        child: Container(
          constraints: const BoxConstraints(
            minHeight: LayoutGrid.halfModule * 13,
            minWidth: LayoutGrid.halfModule * 10,
            maxHeight: LayoutGrid.module * 13,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: LayoutGrid.halfModule * 5,
            horizontal: LayoutGrid.doubleModule,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircularCountDownTimer(
                duration: duration,
                controller: CountDownController(),
                width: LayoutGrid.halfModule * 7,
                height: LayoutGrid.halfModule * 7,
                ringColor: Colors.transparent,
                fillColor: toastScheme.timerColor,
                backgroundColor: Colors.transparent,
                strokeWidth: LayoutGrid.halfModule / 2,
                strokeCap: StrokeCap.round,
                textStyle: TextStyle(
                    fontSize: toastScheme.timerFont.fontSize,
                    color: toastScheme.timerTextColor,
                    fontWeight: toastScheme.timerFont.fontWeight,),
                textAlign: TextAlign.center,
                textFormat: CountdownTextFormat.S,
                isReverse: true,
                isReverseAnimation: true,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: LayoutGrid.doubleModule,
                   vertical: LayoutGrid.halfModule,),
                  child: TextView(
                    title ?? '',
                    font: toastScheme.titleFont,
                    textColorNormal: textColor,
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                   vertical: LayoutGrid.halfModule * 1.5,),
                  child:
              LinkControl(
                title: linkText ?? '',
                scheme: toastScheme.linkControlScheme,
                onPressed: onLinkPressed,
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
