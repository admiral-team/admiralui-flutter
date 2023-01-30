import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class TitleHeaderWidget extends StatefulWidget {
  const TitleHeaderWidget({
    super.key,
    required this.title,
    required this.style,
    this.textAlign = TextAlign.left,
    this.isEnable = true,
    this.scheme,
  });

  final String title;
  final TitleHeaderStyle style;
  final TextAlign textAlign;
  final bool isEnable;
  final TitleHeaderWidgetScheme? scheme;

  @override
  State<TitleHeaderWidget> createState() => _TitleHeaderState();
}

class _TitleHeaderState extends State<TitleHeaderWidget> {
  late TitleHeaderWidgetScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? TitleHeaderWidgetScheme(theme: theme);

    Color textColor =
        widget.isEnable ? scheme.textColor : scheme.disabledTextColor;
    AFont font;

    switch (widget.style) {
      case TitleHeaderStyle.title:
        font = scheme.titleFont;
        break;
      case TitleHeaderStyle.subtitle:
        font = scheme.subtitleFont;
        break;
      case TitleHeaderStyle.headline:
        font = scheme.headlineFont;
        break;
      case TitleHeaderStyle.headlineSecondary:
        font = scheme.headlineFont;
        textColor = widget.isEnable
            ? scheme.headlineTextColor
            : scheme.disabledHeadlineTextColor;
        break;
    }

    return SizedBox(
      width: double.infinity,
      child: TextView(
        widget.title,
        font: font,
        textColorNormal: textColor,
        textAlign: widget.textAlign,
      ),
    );
  }
}
