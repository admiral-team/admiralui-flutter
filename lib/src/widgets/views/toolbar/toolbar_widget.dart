import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class ToolbarWidget extends StatefulWidget {
  const ToolbarWidget({
    super.key,
    required this.items,
    this.selectedIndex = 0,
    this.onTap,
    this.scheme,
  });

  final List<ToolbarItem> items;
  final int selectedIndex;
  final ValueChanged<int>? onTap;
  final ToolbarWidgetScheme? scheme;

  @override
  State<ToolbarWidget> createState() => _ToolbarWidgetState();
}

class _ToolbarWidgetState extends State<ToolbarWidget> {
  late ToolbarWidgetScheme scheme;
  late int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? ToolbarWidgetScheme(theme: theme);

    if (widget.items.length == 1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: scheme.backgroundColor,
              borderRadius: BorderRadius.circular(LayoutGrid.doubleModule),
            ),
            constraints: const BoxConstraints(
              minHeight: LayoutGrid.halfModule * 24,
              minWidth: LayoutGrid.halfModule * 52,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: LayoutGrid.module,
              horizontal: LayoutGrid.halfModule * 3,
            ),
            child: SizedBox(
              width: LayoutGrid.halfModule * 24,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    widget.items[0].image,
                    color: scheme.selectedImageColor,
                    size: LayoutGrid.halfModule * 6,
                  ),
                  const SizedBox(
                    width: LayoutGrid.doubleModule,
                  ),
                  TextView(
                    widget.items[0].title,
                    font: scheme.font,
                    textColorNormal: scheme.selectedTextColor,
                  )
                ],
              ),
            ),
          )
        ],
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          color: scheme.backgroundColor,
          borderRadius: BorderRadius.circular(LayoutGrid.doubleModule),
        ),
        constraints: const BoxConstraints(
          minHeight: LayoutGrid.halfModule * 24,
          minWidth: LayoutGrid.halfModule * 52,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: LayoutGrid.module,
          horizontal: LayoutGrid.halfModule * 3,
        ),
        child: Row(
          children: <Widget>[
            for (int i = 0; i < widget.items.length; i++) ...<Widget>[
              const Spacer(),
              GestureDetector(
                onTap: () => {
                  setState(() {
                    _selectedIndex = i;
                    if (widget.onTap != null) {
                      // ignore: prefer_null_aware_method_calls
                      widget.onTap!(i);
                    }
                  })
                },
                child: Column(
                  children: <Widget>[
                    Icon(
                      widget.items[i].image,
                      color: i == _selectedIndex
                          ? scheme.selectedImageColor
                          : scheme.imageColor,
                      size: LayoutGrid.halfModule * 6,
                    ),
                    TextView(
                      widget.items[i].title,
                      font: scheme.font,
                      textColorNormal: i == _selectedIndex
                          ? scheme.selectedTextColor
                          : scheme.textColor,
                    )
                  ],
                ),
              ),
              const Spacer(),
            ],
          ],
        ),
      );
    }
  }
}
