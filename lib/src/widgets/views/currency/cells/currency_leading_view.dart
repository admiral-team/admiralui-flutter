import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class CurrencyLeadingView extends StatefulWidget {
  const CurrencyLeadingView(
    this.text, {
    this.iconData,
    this.scheme,
  });

  final String text;
  final Image? iconData;
  final CurrencyScheme? scheme;

  @override
  State<StatefulWidget> createState() => _CurrencyLeadingViewState();
}

class _CurrencyLeadingViewState extends State<CurrencyLeadingView> {
  late CurrencyScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? CurrencyScheme(theme: theme);

    return Row(
      children: <Widget>[
        if (widget.iconData != null) widget.iconData!,
        if (widget.iconData != null)
          const SizedBox(
            width: LayoutGrid.halfModule * 3,
          ),
        TextView(
          widget.text,
          font: scheme.textFont,
          textColorNormal: scheme.textColor.color(),
        ),
      ],
    );
  }
}
