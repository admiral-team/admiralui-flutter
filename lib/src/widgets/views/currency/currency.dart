import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// An CurrencyHeader.
/// The view for display header currency

class Currency extends StatefulWidget {
  const Currency(
    this.currencyText,
    this.buyText,
    this.sellText,
    this.iconData,
    this.firstCellType,
    this.secondCellType, {
    this.scheme,
  });

  final String currencyText;
  final String buyText;
  final String sellText;

  final IconData? iconData;
  final CurrencyCellType firstCellType;
  final CurrencyCellType secondCellType;

  final CurrencyScheme? scheme;

  @override
  State<StatefulWidget> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  late CurrencyScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? CurrencyScheme(theme: theme);

    return Row(
      children: <Widget>[
        CurrencyLeadingView(
          widget.currencyText,
          iconData: widget.iconData,
          scheme: scheme,
        ),
        const Spacer(),
        SizedBox(
          width: 90,
          child: CurrencyQuatationView(
            widget.firstCellType,
            text: widget.buyText,
            scheme: scheme,
          ),
        ),
        const SizedBox(
          width: LayoutGrid.halfModule * 10,
        ),
        CurrencyQuatationView(
          widget.firstCellType,
          text: widget.buyText,
          scheme: scheme,
        ),
      ],
    );
  }
}
