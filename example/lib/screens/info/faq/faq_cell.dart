import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:example/screens/info/faq/faq_item.dart';
import 'package:flutter/material.dart';

class FAQCell extends StatefulWidget {
  const FAQCell({Key? key, required this.item}) : super(key: key);
  final FAQItem item;

  @override
  _FAQCellState createState() => _FAQCellState();
}

class _FAQCellState extends State<FAQCell> {
  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;
    return BaseCellWidget(
      onPressed: () {
        setState(() {
          widget.item.isExpanded = !widget.item.isExpanded;
        });
      },
      minHeight: LayoutGrid.doubleModule * 4,
      centerCell: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextView(
                  widget.item.title,
                  font: fonts.body1,
                  textColorNormal: colors.textPrimary.color(),
                ),
                if (widget.item.isExpanded)
                  Padding(
                    padding: const EdgeInsets.only(
                        top: LayoutGrid.module, right: LayoutGrid.module),
                    child: TextView(
                      widget.item.subtitle,
                      font: fonts.body2,
                      textColorNormal: colors.textPrimary.color(),
                    ),
                  ),
              ],
            ),
          ),
          widget.item.isExpanded
              ? Assets.info.chevronUpOutline
                  .image(height: LayoutGrid.tripleModule)
              : Assets.info.chevronDownOutline
                  .image(height: LayoutGrid.tripleModule),
        ],
      ),
    );
  }
}
