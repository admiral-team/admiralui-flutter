import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

// TitleMoreDetailTextMessageWidget - A view object with title, more label,
// detaile label and message view.
class TitleSubtitleButtonWidget extends StatelessWidget {
  const TitleSubtitleButtonWidget({
    super.key,
    this.title,
    this.subtitle,
    this.tagText,
    this.subtitleTwo,
    this.buttonTitle,
    this.isEnabled = true,
    this.onButtonPressed,
    this.scheme,
  });

  final String? title;
  final String? subtitle;
  final String? tagText;
  final String? subtitleTwo;
  final String? buttonTitle;
  final VoidCallback? onButtonPressed;
  final bool isEnabled;
  final TitleSubtitleButtonWidgetScheme? scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final TitleSubtitleButtonWidgetScheme cellScheme =
        scheme ?? TitleSubtitleButtonWidgetScheme(theme: theme);
    final Color titleColor =
        isEnabled ? cellScheme.titleColor : cellScheme.disabledTitleColor;
    final Color subtitleColor =
        isEnabled ? cellScheme.subtitleColor : cellScheme.disabledSubtitleColor;
    final Color tagTextColor =
        isEnabled ? cellScheme.tagTextColor : cellScheme.disabledTagTextColor;
    final Color subtitleTwoColor = isEnabled
        ? cellScheme.subtitleTwoColor
        : cellScheme.disabledSubtitleTwoColor;
    final Color tagBackgroundColor = isEnabled
        ? cellScheme.tagBackgroundColor
        : cellScheme.disabledTagBackgroundColor;

    List<Widget> children;
    children = <Widget>[];

    if (title != null) {
      children.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.ideographic,
          children: <Widget>[
            TextView(
              title ?? '',
              font: cellScheme.titleFont,
              textColorNormal: titleColor,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      );
    }

    if (subtitle != null || tagText != null) {
      if (children.isNotEmpty) {
        children.add(
          const SizedBox(
            height: LayoutGrid.module,
          ),
        );
      }
      List<Widget> lineWidgets;
      lineWidgets = <Widget>[];
      if (subtitle != null) {
        lineWidgets.add(
          TextView(
            subtitle ?? '',
            font: cellScheme.subtitleFont,
            textColorNormal: subtitleColor,
            textAlign: TextAlign.left,
          ),
        );
      }

      if (tagText != null) {
        if (subtitle != null) {
          lineWidgets.add(
            const SizedBox(
              width: LayoutGrid.halfModule,
            ),
          );
        }

        lineWidgets.add(
          DecoratedBox(
            decoration: BoxDecoration(
              color: tagBackgroundColor,
              borderRadius: BorderRadius.circular(LayoutGrid.halfModule),
            ),
            child: Container(
              constraints: const BoxConstraints(
                minHeight: LayoutGrid.halfModule * 5,
                minWidth: LayoutGrid.halfModule * 5,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: LayoutGrid.halfModule,
                horizontal: LayoutGrid.halfModule,
              ),
              child: TextView(
                tagText ?? '',
                font: cellScheme.tagTextFont,
                textColorNormal: tagTextColor,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      }

      children.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.ideographic,
          children: lineWidgets,
        ),
      );
    }

    if (subtitleTwo != null) {
      if (children.isNotEmpty) {
        children.add(
          const SizedBox(
            height: LayoutGrid.module,
          ),
        );
      }

      children.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextView(
              subtitleTwo ?? '',
              font: cellScheme.subtitleTwoFont,
              textColorNormal: subtitleTwoColor,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      );
    }

    if (buttonTitle != null) {
      if (children.isNotEmpty) {
        children.add(
          const SizedBox(
            height: LayoutGrid.module,
          ),
        );
      }

      children.add(
        LinkControl(
          title: buttonTitle ?? '',
          scheme: cellScheme.buttonScheme,
          isEnable: isEnabled,
          onPressed: onButtonPressed,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: children,
    );
  }
}
