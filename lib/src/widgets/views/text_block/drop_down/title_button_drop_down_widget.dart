import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class TitleButtonDropDownWidget extends StatefulWidget {
  const TitleButtonDropDownWidget({
    super.key,
    this.title,
    this.buttonTitle,
    this.isEnable = true,
    this.onPressed,
    this.scheme,
  });

  final String? title;
  final String? buttonTitle;
  final bool isEnable;
  final TitleButtonDropDownWidgetScheme? scheme;
  final VoidCallback? onPressed;

  @override
  State<TitleButtonDropDownWidget> createState() =>
      _TitleButtonDropDownWidgetState();
}

class _TitleButtonDropDownWidgetState extends State<TitleButtonDropDownWidget> {
  late TitleButtonDropDownWidgetScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? TitleButtonDropDownWidgetScheme(theme: theme);
    final Color textColor =
        widget.isEnable ? scheme.titleColor : scheme.disabledTitleColor;

    return Container(
      constraints: const BoxConstraints(
        minHeight: LayoutGrid.module * 9,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: LayoutGrid.halfModule * 3,
      ),
      width: double.infinity,
      child: Row(
        children: <Widget>[
          TextView(
            widget.title ?? '',
            font: scheme.font,
            textColorNormal: textColor,
          ),
          const Spacer(),
          ButtonArrow(
            title: widget.buttonTitle ?? '',
            isEnable: widget.isEnable,
            onPressed: widget.onPressed,
            scheme: scheme.ghostButtonScheme,
          )
          // ),
        ],
      ),
    );
  }
}
