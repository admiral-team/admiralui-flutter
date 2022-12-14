import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// A CurrencyView.
/// The view for display currency

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
        TextView(
          widget.currencyText,
          font: scheme.textFont,
          textColorNormal: scheme.textColor.color(),
          textAlign: TextAlign.right,
        ),
        const Spacer(),
        TextView(
          widget.buyText,
          font: scheme.textFont,
          textColorNormal: scheme.textColor.color(),
          textAlign: TextAlign.right,
        ),
        const SizedBox(
          width: LayoutGrid.halfModule * 18,
        ),
        TextView(
          widget.sellText,
          font: scheme.textFont,
          textColorNormal: scheme.textColor.color(),
          textAlign: TextAlign.right,
        ),
        if (widget.isTextSpacingEnabled)
          const SizedBox(
            width: LayoutGrid.tripleModule,
          ),
      ],
    );
  }
}
