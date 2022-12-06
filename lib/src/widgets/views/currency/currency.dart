import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:admiralui_flutter/src/widgets/views/currency/currency_scheme.dart';
import 'package:flutter/material.dart';

enum CurrencyCellType {
  /// Cell with ArrowUp Image.
  arrowUp,

  /// Cell with ArrowDown Image.
  arrowDown,

  /// Cell without image. There is an indent from the right edge.
  empty,

  /// Cell without image. The position of the cell is at the right edge.
  none
}

class Currency extends StatefulWidget {
  const Currency({
    required this.currencyText,
    required this.buyText,
    required this.sellText,
    this.iconData,
    this.firstCellType = CurrencyCellType.none,
    this.secondCellType = CurrencyCellType.none,
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
        _currencyView(scheme: scheme),
        const Spacer(),
        SizedBox(
          width: 90.0,
          child: _quotationView(
            text: widget.buyText,
            cellType: widget.firstCellType,
            scheme: scheme,
          ),
        ),
        SizedBox(
          width: LayoutGrid.halfModule * 10,
        ),
        SizedBox(
          width: 90.0,
          child: _quotationView(
            text: widget.sellText,
            cellType: widget.secondCellType,
            scheme: scheme,
          ),
        ),
      ],
    );
  }

  Widget _textLabel({
    required String text,
    required CurrencyScheme scheme,
  }) {
    return Row(
      children: <Widget>[
        const Spacer(),
        Text(
          widget.currencyText,
          style: TextStyle(
            fontSize: scheme.textFont.fontSize,
            color: scheme.textColor.color(),
            fontFamily: scheme.textFont.fontFamily,
            fontWeight: scheme.textFont.fontWeight,
          ),
        ),
      ],
    );
  }

  Widget _imageView({
    required IconData iconData,
    required CurrencyScheme scheme,
  }) {
    return Icon(
      iconData,
      size: LayoutGrid.tripleModule,
      color: scheme.imageTintColor.color(),
    );
  }

  Widget _currencyView({
    required CurrencyScheme scheme,
  }) {
    if (widget.iconData != null) {
      return Row(
        children: <Widget>[
          Icon(
            widget.iconData,
            size: LayoutGrid.tripleModule,
            color: scheme.imageTintColor.color(),
          ),
          SizedBox(
            width: LayoutGrid.halfModule * 3,
          ),
          _textLabel(text: widget.currencyText, scheme: scheme),
        ],
      );
    } else {
      return _textLabel(text: widget.currencyText, scheme: scheme);
    }
  }

  Widget _quotationView({
    required String text,
    required CurrencyCellType cellType,
    required CurrencyScheme scheme,
  }) {
    switch (cellType) {
      case CurrencyCellType.none:
        return _textLabel(text: text, scheme: scheme);
      case CurrencyCellType.empty:
        return Row(
          children: <Widget>[
            _textLabel(text: text, scheme: scheme),
            SizedBox(
              width: LayoutGrid.tripleModule,
            )
          ],
        );
      case CurrencyCellType.arrowUp:
        return Row(
          children: <Widget>[
            _textLabel(text: text, scheme: scheme),
            _imageView(
              iconData: AdmiralIcons.admiral_ic_arrow_up_outline,
              scheme: scheme,
            ),
          ],
        );
      case CurrencyCellType.arrowDown:
        return Row(
          children: <Widget>[
            _textLabel(text: text, scheme: scheme),
            _imageView(
              iconData: AdmiralIcons.admiral_ic_arrow_down_outline,
              scheme: scheme,
            ),
          ],
        );
    }
  }
}
