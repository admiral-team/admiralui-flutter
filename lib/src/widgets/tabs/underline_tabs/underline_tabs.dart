import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:admiralui_flutter/src/widgets/tabs/underline_tabs/underline_tabs_scheme.dart';
import 'package:flutter/material.dart';

/// A customizable widget for displaying a set of
/// tabs with an underline indicator.
///
/// Constructor:
/// ```
/// UnderlineTabs(
///   List<UnderlineTabItem> items, {
///     bool isEnable = true,
///     int? selectedIndex,
///     ValueChanged<int>? onTap,
///     bool isCenterTabs = false,
///     double horizontalPadding = 0.0,
///     UnderlineTabsScheme? scheme,
///     Key? key,
///   })
///
/// /// Factory:
/// ```
/// UnderlineTabs.withStringItems(
///   List<String> items, {
///     bool isEnable = true,
///     int? selectedIndex,
///     ValueChanged<int>? onTap,
///     bool isCenterTabs = false,
///     double horizontalPadding = 0.0,
///     UnderlineTabsScheme? scheme,
///     Key? key,
///   })
/// ```
///
/// Parameters:
/// - `items`: A list of [UnderlineTabItem] representing the labels
/// and badge styles for each tab.
/// - `isEnable`: A boolean indicating whether the tabs are enabled or disabled.
///  Defaults to `true`.
/// - `selectedIndex`: The index of the initially selected tab.
/// Defaults to the first tab (index 0).
/// - `onTap`: Callback function triggered when a tab is tapped.
/// It provides the index of the tapped tab.
/// - `isCenterTabs`: A boolean indicating whether tabs should be centered.
/// Defaults to `false`.
/// - `horizontalPadding`: Horizontal padding for the entire widget.
/// - `scheme`: An optional scheme defining
/// the appearance of the underline tabs.
/// - `key`: An optional key to uniquely identify this widget.
///
/// Example usage:
/// ```dart
/// UnderlineTabs(
///   [UnderlineTabItem('Tab 1'), UnderlineTabItem('Tab 2'),
/// UnderlineTabItem('Tab 3')],
///   onTap: (index) {
///     // Handle tab selection
///   },
///   isCenterTabs: true,
/// )
/// ```
///
////// Example usage with List<String>:
/// ```dart
/// UnderlineTabs.withStringItems(
///   ['Tab 1', 'Tab 2', 'Tab 3'],
///   onTap: (index) {
///     // Handle tab selection
///   },
///   isCenterTabs: true,
/// )
/// ```
class UnderlineTabs extends StatefulWidget {
  const UnderlineTabs(
    this.items, {
    this.isEnable = true,
    this.selectedIndex,
    this.onTap,
    this.isCenterTabs = false,
    this.horizontalPadding = 0.0,
    this.scheme,
    super.key,
  });

  factory UnderlineTabs.withStringItems(
    List<String> items, {
    bool isEnable = true,
    int? selectedIndex,
    ValueChanged<int>? onTap,
    bool isCenterTabs = false,
    double horizontalPadding = 0.0,
    UnderlineTabsScheme? scheme,
    Key? key,
  }) {
    final List<UnderlineTabItem> tabItems =
        items.map((String title) => UnderlineTabItem(title)).toList();
    return UnderlineTabs(
      tabItems,
      isEnable: isEnable,
      selectedIndex: selectedIndex,
      onTap: onTap,
      isCenterTabs: isCenterTabs,
      horizontalPadding: horizontalPadding,
      scheme: scheme,
      key: key,
    );
  }

  final List<UnderlineTabItem> items;
  final bool isEnable;
  final int? selectedIndex;
  final ValueChanged<int>? onTap;
  final bool isCenterTabs;
  final double horizontalPadding;
  final UnderlineTabsScheme? scheme;

  @override
  State<StatefulWidget> createState() => _UnderlineTabsState();
}

class _UnderlineTabsState extends State<UnderlineTabs>
    with SingleTickerProviderStateMixin {
  late UnderlineTabsScheme scheme;
  int currentPos = 0;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? UnderlineTabsScheme(theme: theme);

    final Color borderColorNormal =
        scheme.borderColor.unsafeParameter(ControlState.normal);
    final Color backgroundDisabled =
        scheme.borderColor.unsafeParameter(ControlState.disabled);
    final Color borderColor =
        widget.isEnable ? borderColorNormal : backgroundDisabled;

    final Color textColorNormal =
        scheme.labelColor.unsafeParameter(ControlState.normal);
    final Color textColorDisabled =
        scheme.labelColor.unsafeParameter(ControlState.disabled);
    final Color textColor =
        widget.isEnable ? textColorNormal : textColorDisabled;

    final AFont textFont = widget.isEnable
        ? scheme.labelFont.unsafeParameter(ControlState.normal)
        : scheme.labelFont.unsafeParameter(ControlState.disabled);

    return DefaultTabController(
      length: widget.items.length,
      initialIndex: widget.selectedIndex ?? 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
        child: Column(
          children: <Widget>[
            IgnorePointer(
              ignoring: !widget.isEnable,
              child: TabBar(
                tabAlignment: widget.isCenterTabs ? null : TabAlignment.start,
                isScrollable: !widget.isCenterTabs,
                dividerColor: Colors.transparent,
                onTap: (int index) {
                  setState(() {
                    currentPos = index;
                    widget.onTap?.call(index);
                  });
                },
                labelPadding: const EdgeInsets.only(bottom: LayoutGrid.module),
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: borderColor,
                    width: LayoutGrid.halfModule / 2,
                  ),
                ),
                padding: EdgeInsets.zero,
                tabs: <Widget>[
                  for (int i = 0; i < widget.items.length; i++) ...<Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: widget.isCenterTabs ? 0 : LayoutGrid.module,
                      ),
                      child: Center(
                        child: Stack(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                maxLines: 1,
                                widget.items[i].text,
                                style: TextStyle(
                                  fontSize: textFont.fontSize,
                                  color: textColor,
                                  fontFamily: textFont.fontFamily,
                                  fontWeight: textFont.fontWeight,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: BadgeWidget(
                                style: widget.items[i].badgeStyle,
                                isEnable: widget.isEnable,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
