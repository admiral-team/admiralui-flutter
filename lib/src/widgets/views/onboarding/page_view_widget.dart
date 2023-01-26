import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class PageViewItem {
  const PageViewItem(
    this.imageName, {
    this.title = '',
    this.subtitle = '',
  });

  final String imageName;
  final String title;
  final String subtitle;
}

class PageViewWidget extends StatefulWidget {
  const PageViewWidget(
    this.item, {
    this.scheme,
  });

  final PageViewItem item;
  final PageViewScheme? scheme;

  @override
  State<StatefulWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  late PageViewScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? PageViewScheme(theme: theme);
    return Column(
      children: <Widget>[
        SizedBox(
          width: LayoutGrid.halfModule * 50,
          height: LayoutGrid.halfModule * 50,
          child: Image.asset(widget.item.imageName),
        ),
        const SizedBox(
          height: LayoutGrid.module * 5,
        ),
        TextView(
          widget.item.title,
          font: scheme.titleLabelFont,
          textColorNormal: scheme.titleLabelColor.color(),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: LayoutGrid.doubleModule,
        ),
        TextView(
          widget.item.subtitle,
          font: scheme.descriptionLabelTextFont,
          textColorNormal: scheme.descriptionLabelTextColor.color(),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
