import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:admiralui_flutter/src/widgets/views/currency/currency_header_scheme.dart';
import 'package:flutter/material.dart';

class CurrencyHeader extends StatefulWidget {
  const CurrencyHeader({
    required this.currencyText,
    required this.buyText,
    required this.sellText,
    required this.isTextSpacingEnabled,
    this.scheme,
  });

  final String currencyText;
  final String buyText;
  final String sellText;
  final bool isTextSpacingEnabled;
  final CurrencyHeaderScheme? scheme;

  @override
  State<StatefulWidget> createState() => _CurrencyHeaderState();
}

class _CurrencyHeaderState extends State<CurrencyHeader> {
  late CurrencyHeaderScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? CurrencyHeaderScheme(theme: theme);

    return Row(
      children: <Widget>[
        _textLabel(text: widget.currencyText, scheme: scheme),
        const Spacer(),
        _textLabel(text: widget.buyText, scheme: scheme),
        SizedBox(width: LayoutGrid.halfModule * 18,),
        _textLabel(text: widget.sellText, scheme: scheme),
        if (widget.isTextSpacingEnabled)
            SizedBox(width: LayoutGrid.halfModule * 18,),
      ],
    );
  }

  Widget _textLabel({
    required String text,
    required CurrencyHeaderScheme scheme,
  }) {
    return Text(
      widget.currencyText,
      style: TextStyle(
        fontSize: scheme.textFont.fontSize,
        color: scheme.textColor.color(),
        fontFamily: scheme.textFont.fontFamily,
        fontWeight: scheme.textFont.fontWeight,
      ),
    );
  }
}
