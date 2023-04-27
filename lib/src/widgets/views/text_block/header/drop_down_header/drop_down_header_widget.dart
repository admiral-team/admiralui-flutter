import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// A header with header title, arrow and button.
class DropDownHeaderWidget extends StatefulWidget {
  const DropDownHeaderWidget({
    super.key,
    required this.title,
    required this.style,
    this.dropDownStyle = DropDownHeaderStyle.down,
    this.isEnable = true,
    this.scheme,
  });

  final String title;
  final TitleHeaderStyle style;
  final DropDownHeaderStyle dropDownStyle;
  final bool isEnable;
  final DropDownHeaderScheme? scheme;

  @override
  State<DropDownHeaderWidget> createState() => _DropDownHeaderWidgetState();
}

class _DropDownHeaderWidgetState extends State<DropDownHeaderWidget> {
  late DropDownHeaderScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? DropDownHeaderScheme(theme: theme);

    Color textColor =
        widget.isEnable ? scheme.textColor : scheme.disabledTextColor;
    final Color imageColor =
        widget.isEnable ? scheme.imageColor : scheme.disabledImageColor;
    AFont font;

    IconData icon;
    switch (widget.dropDownStyle) {
      case DropDownHeaderStyle.up:
        icon = AdmiralIcons.admiral_ic_chevron_up_outline;
        break;
      case DropDownHeaderStyle.down:
        icon = AdmiralIcons.admiral_ic_chevron_down_outline;
        break;
    }

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

    return Container(
      constraints: const BoxConstraints(
        minHeight: LayoutGrid.module * 9,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: LayoutGrid.halfModule * 3,
      ),
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextView(
            widget.title,
            font: font,
            textColorNormal: textColor,
            textAlign: TextAlign.left,
          ),
          const Spacer(),
          Icon(
            icon,
            color: imageColor,
          ),
        ],
      ),
    );
  }
}
