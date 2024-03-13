import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// Widget representing a set of outline-style tabs.
///
/// This widget extends [StatefulWidget], allowing dynamic updates to its state.
///
/// Constructor:
/// ```
/// OutlineTabs(
///   List<OutlineTabItem> tabs, {
///   bool isEnabled = true,
///   ValueChanged<int>? onSelected,
///   OutlineTabsScheme? scheme,
///   double horizontalPadding = 0.0,
///   Key? key,
/// })
/// ```
/// Factory:
/// ```
/// OutlineTabs.withStringItems(
///   List<String> tabTitles, {
///     bool isEnabled = true,
///     ValueChanged<int>? onSelected,
///     OutlineTabsScheme? scheme,
///     double horizontalPadding = 0.0,
///     Key? key,
///   })
/// ```
///
/// Parameters:
/// - `items`: A list of [OutlineTabItem] representing the labels
/// and badge styles for each tab.
/// - `isEnabled`: A boolean indicating whether the tabs are
/// enabled or disabled. Defaults to `true`.
/// - `horizontalPadding`: The horizontal padding applied to each tab.
/// Defaults to `0.0`.
/// - `scheme`: An optional `OutlineTabsScheme` object that defines
/// the color scheme for the tabs.
/// - `onSelected`: A callback function that takes an integer
/// indicating the index of the selected tab when it's tapped.
/// It's invoked when a tab is selected.
/// - `key`: An optional `Key` that uniquely identifies this widget.
///
/// /// Example usage:
/// ```dart
/// OutlineTabs(
///   [OutlineTabItem('Tab 1'), OutlineTabItem('Tab 2'),
///    OutlineTabItem('Tab 3')],
///   onSelected: (index) {
///     // Handle tab selection
///   },
///   isEnabled: true,
///   horizontalPadding: 16.0,
/// )
/// ```
///
/// Example usage with List<String>:
/// ```dart
/// OutlineTabs.withStringItems(
///   ['Tab 1', 'Tab 2', 'Tab 3'],
///   onSelected: (index) {
///     // Handle tab selection
///   },
///   isEnabled: true,
///   horizontalPadding: 16.0,
/// )
/// ```
class OutlineTabs extends StatefulWidget {
  const OutlineTabs(
    this.tabs, {
    this.isEnabled = true,
    this.onSelected,
    this.scheme,
    this.horizontalPadding = 0.0,
    super.key,
  });

  factory OutlineTabs.withStringItems(
    List<String> tabTitles, {
    bool isEnabled = true,
    ValueChanged<int>? onSelected,
    OutlineTabsScheme? scheme,
    double horizontalPadding = 0.0,
    Key? key,
  }) {
    final List<OutlineTabItem> tabItems =
        tabTitles.map((String title) => OutlineTabItem(title)).toList();
    return OutlineTabs(
      tabItems,
      isEnabled: isEnabled,
      onSelected: onSelected,
      scheme: scheme,
      horizontalPadding: horizontalPadding,
      key: key,
    );
  }

  final List<OutlineTabItem> tabs;
  final bool isEnabled;
  final double horizontalPadding;
  final OutlineTabsScheme? scheme;
  final ValueChanged<int>? onSelected;

  @override
  State<StatefulWidget> createState() => _OutlineTabsState();
}

class _OutlineTabsState extends State<OutlineTabs>
    with SingleTickerProviderStateMixin {
  int currentPos = 0;
  late OutlineTabsScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? OutlineTabsScheme(theme: theme);

    final Color textColor =
        widget.isEnabled ? scheme.textColor : scheme.disabledTextColor;
    final Color borderColor =
        widget.isEnabled ? scheme.borderColor : scheme.disabledBorderColor;
    final Color selectedBorderColor = widget.isEnabled
        ? scheme.selectedBorderColor
        : scheme.disabledSelectedBorderColor;
    return IgnorePointer(
      ignoring: !widget.isEnabled,
      child: Column(
        children: <Widget>[
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: widget.horizontalPadding,
            ),
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: LayoutGrid.halfModule * 3,
              children: <Widget>[
                for (int i = 0; i < widget.tabs.length; i++) ...<Widget>[
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        currentPos = i;
                        if (widget.onSelected != null) {
                          setState(() {
                            widget.onSelected!(currentPos);
                          });
                        }
                      });
                    },
                    child: Container(
                      height: LayoutGrid.quadrupleModule,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: currentPos == i
                              ? selectedBorderColor
                              : borderColor,
                          width: LayoutGrid.halfModule / 2,
                        ),
                        borderRadius: BorderRadius.circular(
                          LayoutGrid.module,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: LayoutGrid.module,
                          vertical: LayoutGrid.halfModule,
                        ),
                        child: Center(
                          child: Stack(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: TextView(
                                  widget.tabs[i].text,
                                  style: currentPos == i
                                      ? scheme.textFont.toTextStyle(textColor)
                                      : scheme.unselectedTextFont
                                          .toTextStyle(textColor),
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              if (widget.tabs[i].badgeStyle != BadgeStyle.clear)
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: BadgeWidget(
                                    style: widget.tabs[i].badgeStyle,
                                    isEnable: widget.isEnabled,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
