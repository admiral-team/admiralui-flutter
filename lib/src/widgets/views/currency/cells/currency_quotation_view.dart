import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class CurrencyQuatationView extends StatefulWidget {
  const CurrencyQuatationView(
    this.cellType, {
    this.text = '',
    this.scheme,
  });

  final CurrencyCellType cellType;
  final String text;
  final CurrencyScheme? scheme;

  @override
  State<StatefulWidget> createState() => _CurrencyQuatationViewState();
}

class _CurrencyQuatationViewState extends State<CurrencyQuatationView> {
  late CurrencyScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? CurrencyScheme(theme: theme);

    switch (widget.cellType) {
      case CurrencyCellType.none:
        return TextView(
          widget.text,
          font: scheme.textFont,
          textColorNormal: scheme.textColor.color(),
        );
      case CurrencyCellType.empty:
        return Row(
          children: <Widget>[
            TextView(
              widget.text,
              font: scheme.textFont,
              textColorNormal: scheme.textColor.color(),
            ),
            const SizedBox(
              width: LayoutGrid.tripleModule,
            ),
          ],
        );
      case CurrencyCellType.arrowUp:
        return Row(
          children: <Widget>[
            TextView(
              widget.text,
              font: scheme.textFont,
              textColorNormal: scheme.textColor.color(),
            ),
            Icon(
              AdmiralIcons.admiral_ic_arrow_up_outline,
              size: LayoutGrid.tripleModule,
              color: scheme.imageTintColor.color(),
            ),
          ],
        );
      case CurrencyCellType.arrowDown:
        return Row(
          children: <Widget>[
            TextView(
              widget.text,
              font: scheme.textFont,
              textColorNormal: scheme.textColor.color(),
            ),
            Icon(
              AdmiralIcons.admiral_ic_arrow_down_outline,
              size: LayoutGrid.tripleModule,
              color: scheme.imageTintColor.color(),
            ),
          ],
        );
    }
  }
}
