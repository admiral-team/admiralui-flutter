import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class InformerTabs extends StatefulWidget {
  const InformerTabs(
    this.items, {
    this.isEnabled = true,
    this.selectedIndex,
    this.onTap,
    this.customView,
    this.paddingHorizontal,
    this.scheme,
    super.key,
  });

  final List<InformerTabItem> items;
  final bool isEnabled;
  final int? selectedIndex;
  final ValueChanged<int>? onTap;
  final Widget? customView;
  final double? paddingHorizontal;
  final InformerTabsScheme? scheme;

  @override
  State<StatefulWidget> createState() => _InformerTabsState();
}

class InformerTabItem {
  InformerTabItem(this.title, this.subtitle);
  String title;
  String subtitle;
}

class _InformerTabsState extends State<InformerTabs>
    with SingleTickerProviderStateMixin {
  late InformerTabsScheme scheme;
  final Duration duration = const Duration(milliseconds: 300);
  late double _padding;
  double _widgetWidth = 0.0;
  double _informerWidth = 0.0;
  int _currentPos = 0;

  @override
  Widget build(BuildContext context) {
    _padding = widget.paddingHorizontal ?? 0.0;
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? InformerTabsScheme(theme: theme);

    return WidgetSize(
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                width: _widgetWidth - _padding,
                child: Row(
                  children: <Widget>[
                    for (int i = 0; i < widget.items.length; i++) ...<Widget>{
                      Expanded(
                        child: InformerTabItemWidget(
                          widget.items[i],
                          _informerWidth,
                          isEnabled: widget.isEnabled,
                          isSelected: _currentPos == i,
                          index: i,
                          onTap: (int value) {
                            setState(() {
                              _currentPos = value;
                            });
                          },
                          scheme: scheme.informerTabItemScheme,
                        ),
                      ),
                      if (i != widget.items.length - 1)
                        const SizedBox(
                          width: LayoutGrid.module,
                        )
                    },
                  ],
                ),
              ),
              if (widget.customView != null)
                const SizedBox(
                  height: LayoutGrid.halfModule * 7,
                ),
              if (widget.customView != null) widget.customView!,
            ],
          ),
          if (widget.customView != null)
            AnimatedPositioned(
              duration: duration,
              left: _computeActiveSegmentHorizontalOffset(),
              top: (LayoutGrid.halfModule * 20) + LayoutGrid.doubleModule,
              child: SizedBox(
                width: 32,
                height: 12,
                child: CustomPaint(
                  painter: ArrowSegmentSlider(
                    strokeColor: scheme.arrowSliderColor.color(),
                    paintingStyle: PaintingStyle.fill,
                  ),
                ),
              ),
            ),
        ],
      ),
      onChange: (Size size) {
        setState(
          () {
            _widgetWidth = size.width - _padding;
            final double spacingLength =
                LayoutGrid.module * (widget.items.length - 1);
            _informerWidth =
                (_widgetWidth - spacingLength) / widget.items.length;
          },
        );
      },
    );
  }

  double _computeActiveSegmentHorizontalOffset() {
    double widthSumm = 0;
    final double spacingOffset = _currentPos * LayoutGrid.module;
    widthSumm = (_currentPos + 1) * _informerWidth;
    return ((widthSumm + spacingOffset) - (_informerWidth / 2)) - _padding / 2;
  }
}
