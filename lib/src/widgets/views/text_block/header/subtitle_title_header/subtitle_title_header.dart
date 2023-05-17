import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

/// A header with header subtitle and title.
class SubtitleTitleHeaderWidget extends StatefulWidget {
  const SubtitleTitleHeaderWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.style,
    this.isEnable = true,
    this.scheme,
  });

  final String title;
  final String subtitle;
  final TitleHeaderStyle style;
  final bool isEnable;
  final SubtitleTitleWidgetScheme? scheme;

  @override
  State<SubtitleTitleHeaderWidget> createState() =>
      _SubtitleTitleHeaderWidgetState();
}

class _SubtitleTitleHeaderWidgetState extends State<SubtitleTitleHeaderWidget> {
  late SubtitleTitleWidgetScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? SubtitleTitleWidgetScheme(theme: theme);

    Color textColor =
        widget.isEnable ? scheme.textColor : scheme.disabledTextColor;
    final Color subtextColor =
        widget.isEnable ? scheme.subtextColor : scheme.disabledSubtextColor;
    AFont font;
    AFont subtitleFont;

    switch (widget.style) {
      case TitleHeaderStyle.title:
        font = scheme.titleStyleTitleFont;
        subtitleFont = scheme.subtitleStyleTitleFont;
        break;
      case TitleHeaderStyle.subtitle:
        font = scheme.titleStyleSubtitleFont;
        subtitleFont = scheme.subtitleStyleSubtitleFont;
        break;
      case TitleHeaderStyle.headline:
        font = scheme.titleStyleHeadlineFont;
        subtitleFont = scheme.subtitleStyleHeadlineFont;
        break;
      case TitleHeaderStyle.headlineSecondary:
        font = scheme.titleStyleHeadlineFont;
        subtitleFont = scheme.subtitleStyleHeadlineFont;
        textColor = widget.isEnable
            ? scheme.headlineTextColor
            : scheme.disabledHeadlineTextColor;
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TextView(
          widget.subtitle,
          font: subtitleFont,
          textColorNormal: subtextColor,
        ),
        TextView(
          widget.title,
          font: font,
          textColorNormal: textColor,
        ),
      ],
    );
  }
}
