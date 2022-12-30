import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class SubtitleTitleListWidget extends StatelessWidget {
  const SubtitleTitleListWidget({
    super.key,
    this.title,
    this.subtitle,
    this.isEnabled = true,
    this.scheme,
  });

  final String? title;
  final String? subtitle;
  final bool isEnabled;
  final TitleSubtitleListWidgetScheme? scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final TitleSubtitleListWidgetScheme listScheme =
        scheme ?? TitleSubtitleListWidgetScheme(theme: theme);
    final Color titleColor =
        isEnabled ? listScheme.titleColor : listScheme.disabledTitleColor;
    final Color subtitleColor =
        isEnabled ? listScheme.subtitleColor : listScheme.disabledSubtitleColor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextView(
          subtitle ?? '',
          font: listScheme.subtitleFont,
          textColorNormal: subtitleColor,
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: LayoutGrid.halfModule,),
        TextView(
          title ?? '',
          font: listScheme.titleFont,
          textColorNormal: titleColor,
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
