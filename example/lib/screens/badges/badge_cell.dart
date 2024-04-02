import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class BadgeCellWidget extends StatefulWidget {
  const BadgeCellWidget({
    super.key,
    required this.badgeStyle,
    this.title = '',
    this.isSmallBadge = false,
    this.isEnabled = true,
  });

  final BadgeStyle badgeStyle;
  final String title;
  final bool isSmallBadge;
  final bool isEnabled;

  @override
  State<BadgeCellWidget> createState() => _BadgeCellWidgetState();
}

class _BadgeCellWidgetState extends State<BadgeCellWidget> {
  double currentValue = 1;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;
    return Container(
      constraints: const BoxConstraints(
        minHeight: LayoutGrid.module * 11,
      ),
      padding: const EdgeInsets.symmetric(vertical: LayoutGrid.halfModule * 3),
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                width: LayoutGrid.halfModule * 11,
                height: LayoutGrid.halfModule * 11,
                child: ImageBackgroundCellWidget(
                  icon: AdmiralIcons.admiral_ic_diamond_outline,
                  isEnabled: widget.isEnabled,
                ),
              ),
              SizedBox(
                  width: LayoutGrid.halfModule * 13,
                  height: LayoutGrid.halfModule * 11),
              Positioned(
                right: 0,
                top: 0,
                child: BadgeWidget(
                  title: widget.isSmallBadge
                      ? null
                      : currentValue.toInt().toString(),
                  style: widget.badgeStyle,
                  isEnable: widget.isEnabled,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: LayoutGrid.quadrupleModule,
          ),
          TextView(
            widget.title,
            font: fonts.body1,
            textColorNormal: colors.textSecondary.color(),
            textColorDisabled: colors.textSecondary.colorWithOpacity(),
            isEnabled: widget.isEnabled,
          ),
          const Spacer(),
          InputNumber(
              numberValue: currentValue,
              onChangedValue: _changeInputControl,
              style: InputNumberButtonStyle.normal,
              isEnable: widget.isEnabled),
        ],
      ),
    );
  }

  void _changeInputControl(double value) {
    setState(() {
      currentValue = value;
    });
  }
}
