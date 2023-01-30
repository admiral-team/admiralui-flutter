import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class TitleHeaderWidget extends StatefulWidget {
  const TitleHeaderWidget({
    super.key,
    required this.title,
    this.textAlign = TextAlign.left,
    this.isEnable = true,
    this.scheme,
  });

  final String title;
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

    final Color textColor =
        widget.isEnable ? scheme.textColor : scheme.disabledTextColor;

    return TextView(
      widget.title,
      font: scheme.font,
      textColorNormal: textColor,
      textAlign: TextAlign.left,
    );
  }
}
