import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// A header with header title, arrow and button.
class ArrowWithButtonWidget extends StatefulWidget {
  const ArrowWithButtonWidget({
    super.key,
    required this.title,
    required this.style,
    required this.buttonTitle,
    this.dropDownStyle,
    this.isEnable = true,
    this.onPressed,
    this.scheme,
  });

  final String title;
  final TitleHeaderStyle style;
  final String buttonTitle;
  final DropDownHeaderStyle? dropDownStyle;
  final bool isEnable;
  final VoidCallback? onPressed;
  final ArrowWithButtonHeaderScheme? scheme;

  @override
  State<ArrowWithButtonWidget> createState() => _ArrowWithButtonWidgetState();
}

class _ArrowWithButtonWidgetState extends State<ArrowWithButtonWidget> {
  late ArrowWithButtonHeaderScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? ArrowWithButtonHeaderScheme(theme: theme);

    Color textColor =
        widget.isEnable ? scheme.textColor : scheme.disabledTextColor;
    final Color imageColor =
        widget.isEnable ? scheme.imageColor : scheme.disabledImageColor;
    AFont font;

    IconData? icon;
    switch (widget.dropDownStyle) {
      case DropDownHeaderStyle.up:
        icon = AdmiralIcons.admiral_ic_chevron_up_outline;
        break;
      case DropDownHeaderStyle.down:
        icon = AdmiralIcons.admiral_ic_chevron_down_outline;
        break;
      default:
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
          const SizedBox(width: LayoutGrid.halfModule),
          if (icon != null)
            Icon(
              icon,
              color: imageColor,
              size: LayoutGrid.halfModule * 7,
            ),
          const Spacer(),
          LinkControl(
            title: widget.buttonTitle,
            scheme: scheme.linkScheme,
            onPressed: widget.onPressed,
            isEnable: widget.isEnable,
          ),
        ],
      ),
    );
  }
}
