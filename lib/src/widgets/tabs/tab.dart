import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

double _kTabHeight = LayoutGrid.quadrupleModule;
double _kTextAndIconTabHeight = 48.0;

/// A Material Design [TabBar] tab.
///
/// If both [icon] and [text] are provided, the text is displayed below
/// the icon.
///
/// See also:
///
///  * [TabBar], which displays a row of tabs.
///  * [TabBarView], which displays a widget for the currently selected tab.
///  * [TabController], which coordinates tab selection between a [TabBar] and
///  a [TabBarView].
///  * <https://material.io/design/components/tabs.html>
class AdmiralTab extends StatelessWidget {
  /// Creates a Material Design [TabBar] tab.
  ///
  /// At least one of [text], [icon], and [child] must be non-null. The [text]
  /// and [child] arguments must not be used at the same time. The
  /// [iconMargin] is only useful when [icon] and either one of [text] or
  /// [child] is non-null.
  const AdmiralTab({
    super.key,
    this.text,
    this.icon,
    this.height,
    this.child,
    this.selected = 0,
    required this.curPosition,
  })  : assert(text != null || child != null || icon != null),
        assert(text == null || child == null);

  /// The text to display as the tab's label.
  ///
  /// Must not be used in combination with [child].
  final String? text;

  /// The widget to be used as the tab's label.
  ///
  /// Usually a [Text] widget, possibly wrapped in a [Semantics] widget.
  ///
  /// Must not be used in combination with [text].
  final Widget? child;

  /// An icon to display as the tab's label.
  final Widget? icon;

  /// The height of the [AdmiralTab].
  ///
  /// If null, the height will be calculated based on the content
  /// of the [AdmiralTab].  When `icon` is not null along with `child` or
  /// `text`, the default height is 48.0 pixels. Without an `icon`, the
  /// height is 32.0 pixels.
  final double? height;

  final int selected;

  final int curPosition;

  Widget _buildLabelText(
    FontPalette fonts,
    ColorPalette colors,
    int curPosition,
    int selected,
  ) {
    return child ??
        TextView(
          text!,
          style: curPosition == selected
              ? fonts.subhead2.toTextStyle(colors.textPrimary.color())
              : fonts.subhead3.toTextStyle(colors.textPrimary.color()),
          softWrap: false,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.center,
        );
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    final double calculatedHeight;
    final Widget label;
    if (icon == null) {
      calculatedHeight = _kTabHeight;
      label = Row(
        children: <Widget>[
          Expanded(
            child: _buildLabelText(
              fonts,
              colors,
              curPosition,
              selected,
            ),
          ),
          Container(
            height: LayoutGrid.doubleModule,
            width: 1,
            color: selected != curPosition &&
                    curPosition != (selected - 1) &&
                    curPosition != (selected + 1)
                ? colors.elementAdditional.color()
                : Colors.transparent,
          ),
        ],
      );
    } else if (text == null && child == null) {
      calculatedHeight = _kTabHeight;
      label = icon!;
    } else {
      calculatedHeight = _kTextAndIconTabHeight;
      label = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              bottom: LayoutGrid.module,
            ),
            child: icon,
          ),
          _buildLabelText(
            fonts,
            colors,
            curPosition,
            selected,
          ),
        ],
      );
    }

    return SizedBox(
      height: height ?? calculatedHeight,
      child: Center(
        widthFactor: 1.0,
        child: label,
      ),
    );
  }
}
