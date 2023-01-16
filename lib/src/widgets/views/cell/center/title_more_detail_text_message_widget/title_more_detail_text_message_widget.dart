import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

// TitleMoreDetailTextMessageWidget - A view object with title, more label,
// detaile label and message view.
class TitleMoreDetailTextMessageWidget extends StatelessWidget {
  const TitleMoreDetailTextMessageWidget({
    super.key,
    this.title,
    this.more,
    this.detaile,
    this.detaileMore,
    this.subtitle,
    this.tagText,
    this.messageText,
    this.infoImage,
    this.isEnabled = true,
    this.scheme,
  });

  final String? title;
  final String? more;
  final String? detaile;
  final String? detaileMore;
  final String? subtitle;
  final String? tagText;
  final String? messageText;
  final IconData? infoImage;
  final bool isEnabled;
  final TitleMoreDetailTextMessageWidgetScheme? scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final TitleMoreDetailTextMessageWidgetScheme cellScheme =
        scheme ?? TitleMoreDetailTextMessageWidgetScheme(theme: theme);
    final Color titleColor =
        isEnabled ? cellScheme.titleColor : cellScheme.disabledTitleColor;
    final Color moreColor =
        isEnabled ? cellScheme.moreColor : cellScheme.disabledMoreColor;
    final Color detaileColor =
        isEnabled ? cellScheme.detaileColor : cellScheme.disabledDetaileColor;
    final Color detaileMoreColor = isEnabled
        ? cellScheme.detaileMoreColor
        : cellScheme.disabledDetaileMoreColor;
    final Color subtitleColor =
        isEnabled ? cellScheme.subtitleColor : cellScheme.disabledSubtitleColor;
    final Color tagTextColor =
        isEnabled ? cellScheme.tagTextColor : cellScheme.disabledTagTextColor;
    final Color messageTextColor = isEnabled
        ? cellScheme.messageTextColor
        : cellScheme.disabledMessageTextColor;
    final Color iconInfoImageColor =
        isEnabled ? cellScheme.iconInfoColor : cellScheme.disabledIconInfoColor;
    final Color tagBackgroundColor = isEnabled
        ? cellScheme.tagBackgroundColor
        : cellScheme.disabledTagBackgroundColor;

    List<Widget> children;
    children = <Widget>[];

    if (title != null || more != null) {
      List<Widget> titleMoreLineWidgets;
      titleMoreLineWidgets = <Widget>[];
      if (title != null) {
        titleMoreLineWidgets.add(
          TextView(
            title ?? '',
            font: cellScheme.titleFont,
            textColorNormal: titleColor,
            textAlign: TextAlign.left,
          ),
        );
      }
      if (more != null) {
        if (title != null) {
          titleMoreLineWidgets.add(
            const SizedBox(
              width: LayoutGrid.halfModule,
            ),
          );
        }
        titleMoreLineWidgets.add(
          TextView(
            more ?? '',
            font: cellScheme.moreFont,
            textColorNormal: moreColor,
            textAlign: TextAlign.left,
          ),
        );
      }

      children.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.ideographic,
          children: titleMoreLineWidgets,
        ),
      );
    }

    if (detaile != null || detaileMore != null || infoImage != null) {
      if (children.isNotEmpty) {
        children.add(
          const SizedBox(
            height: LayoutGrid.module,
          ),
        );
      }
      List<Widget> detaileMoreLineWidgets;
      detaileMoreLineWidgets = <Widget>[];
      if (detaile != null) {
        detaileMoreLineWidgets.add(
          TextView(
            detaile ?? '',
            font: cellScheme.detaileFont,
            textColorNormal: detaileColor,
            textAlign: TextAlign.left,
          ),
        );
      }
      if (detaileMore != null) {
        if (detaile != null) {
          detaileMoreLineWidgets.add(
            const SizedBox(
              width: LayoutGrid.halfModule,
            ),
          );
        }
        detaileMoreLineWidgets.add(
          TextView(
            detaileMore ?? '',
            font: cellScheme.detaileMoreFont,
            textColorNormal: detaileMoreColor,
            textAlign: TextAlign.left,
          ),
        );
      }
      if (infoImage != null) {
        if (detaile != null || detaileMore != null) {
          children.add(
            const SizedBox(
              width: LayoutGrid.halfModule,
            ),
          );
        }
        detaileMoreLineWidgets.add(
          Icon(
            infoImage,
            color: iconInfoImageColor,
            size: LayoutGrid.halfModule * 3,
          ),
        );
      }

      children.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.ideographic,
          children: detaileMoreLineWidgets,
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

      List<Widget> subtitleLineWidgets;
      subtitleLineWidgets = <Widget>[];
      if (subtitle != null) {
        subtitleLineWidgets.add(
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
          subtitleLineWidgets.add(
            const SizedBox(
              width: LayoutGrid.halfModule,
            ),
          );
        }

        subtitleLineWidgets.add(
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
          children: subtitleLineWidgets,
        ),
      );
    }

    if (messageText != null) {
      if (children.isNotEmpty) {
        children.add(
          const SizedBox(
            height: LayoutGrid.module,
          ),
        );
      }

      children.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.ideographic,
          children: <Widget>[
            DecoratedBox(
              decoration: BoxDecoration(
                color: tagBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(LayoutGrid.doubleModule),
                  bottomLeft: Radius.circular(LayoutGrid.module),
                  bottomRight: Radius.circular(LayoutGrid.doubleModule),
                  ),
              ),
              child: Container(
                constraints: const BoxConstraints(
                  minHeight: LayoutGrid.quadrupleModule,
                  minWidth: LayoutGrid.quadrupleModule,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: LayoutGrid.halfModule * 1.5,
                  horizontal: LayoutGrid.doubleModule,
                ),
                child: TextView(
                  messageText ?? '',
                  font: cellScheme.messageTextFont,
                  textColorNormal: messageTextColor,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
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
