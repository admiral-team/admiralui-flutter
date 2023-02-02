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
    this.scheme,
    super.key,
  });

  final List<InformerTabItem> items;
  final bool isEnabled;
  final int? selectedIndex;
  final ValueChanged<int>? onTap;
  final Widget? customView;
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
  int currentPos = 0;
  late InformerTabsScheme scheme;
  final Duration duration = const Duration(milliseconds: 300);
  Size textSize = Size.zero;
  double informerWidth = 0.0;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? InformerTabsScheme(theme: theme);

    return WidgetSize(
      child: Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: LayoutGrid.halfModule * 25,
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Wrap(
                    spacing: LayoutGrid.module,
                    children: <Widget>[
                      for (int i = 0; i < widget.items.length; i++) ...<Widget>{
                        InformerTabItemWidget(
                          widget.items[i],
                          informerWidth,
                          isEnabled: widget.isEnabled,
                          isSelected: currentPos == i,
                          index: i,
                          onTap: (int value) {
                            setState(() {
                              currentPos = value;
                            });
                          },
                          scheme: scheme.informerTabItemScheme,
                        ),
                      }
                    ],
                  ),
                ),
                if (widget.customView != null)
                  AnimatedPositioned(
                    left: _computeActiveSegmentHorizontalOffset() +
                        ((informerWidth / 2) - LayoutGrid.module),
                    duration: duration,
                    top: (LayoutGrid.halfModule * 20) + LayoutGrid.module,
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
          ),
          if (widget.customView != null) widget.customView!,
        ],
      ),
      onChange: (Size size) {
        setState(() {
          informerWidth =
              (size.width - (LayoutGrid.module * (widget.items.length - 1))) /
                  widget.items.length;
        });
      },
    );
  }

  double _computeActiveSegmentHorizontalOffset() {
    double width = 0;
    for (int i = 0; i < currentPos; i++) {
      width += informerWidth;
    }
    return width;
  }
}
