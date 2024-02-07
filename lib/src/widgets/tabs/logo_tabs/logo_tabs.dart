import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:admiralui_flutter/src/widgets/tabs/tab.dart';
import 'package:flutter/material.dart';

/// Widget representing a set of tabs with logos/images.
///
/// This widget extends [StatefulWidget], allowing dynamic updates to its state.
///
/// Constructor:
/// ```
/// LogoTabs(
///   List<Widget> images, {
///   bool isEnabled = true,
///   Function(int)? onSelected,
///   LogoTabsScheme? scheme,
///   Key? key,
/// })
/// ```
///
/// Parameters:
/// - `images`: A list of widgets representing the logos/icons to be displayed as tabs.
/// - `isEnabled`: A boolean indicating whether the tabs are enabled or disabled
/// Defaults to `true`.
/// - `onSelected`: A callback function that takes an integer 
/// indicating the index of the selected tab when it's tapped. 
/// It's invoked when a tab is selected.
/// - `scheme`: An optional `LogoTabsScheme` object that 
/// defines the color scheme for the tabs.
/// - `key`: An optional `Key` that uniquely identifies this widget.
class LogoTabs extends StatefulWidget {
  const LogoTabs(
    this.images, {
    this.isEnabled = true,
    this.onSelected,
    this.scheme,
    super.key,
  });

  final List<Widget> images;
  final bool isEnabled;
  final void Function(int index)? onSelected;
  final LogoTabsScheme? scheme;

  @override
  State<StatefulWidget> createState() => _LogoTabsState();
}

class _LogoTabsState extends State<LogoTabs>
    with SingleTickerProviderStateMixin {
  late LogoTabsScheme scheme;
  int currentPos = 0;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? LogoTabsScheme(theme: theme);

    final Color borderColorNormal =
        scheme.borderColor.unsafeParameter(ControlState.normal);
    final Color borderColorDisabled =
        scheme.borderColor.unsafeParameter(ControlState.disabled);
    final Color borderColor =
        widget.isEnabled ? borderColorNormal : borderColorDisabled;

    final Color selectedBorderColorNormal =
        scheme.selectedBorderColor.unsafeParameter(ControlState.normal);
    final Color selectedBorderColorDisabled =
        scheme.selectedBorderColor.unsafeParameter(ControlState.disabled);
    final Color selectedBorderColor = widget.isEnabled
        ? selectedBorderColorNormal
        : selectedBorderColorDisabled;

    return IgnorePointer(
      ignoring: !widget.isEnabled,
      child: DefaultTabController(
        length: widget.images.length,
        child: DecoratedBox(
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(LayoutGrid.module),
              side: BorderSide(
                color: borderColor,
              ),
            ),
            color: scheme.backgroundColor,
          ),
          child: TabBar(
            dividerColor: Colors.transparent,
            onTap: (int index) {
              setState(() {
                currentPos = index;
                if (widget.onSelected != null) {
                  setState(() {
                    widget.onSelected!(currentPos);
                  });
                }
              });
            },
            indicator: BoxDecoration(
              border: Border.all(
                color: selectedBorderColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(
                LayoutGrid.module,
              ),
            ),
            padding: EdgeInsets.zero,
            labelPadding: EdgeInsets.zero,
            labelStyle: scheme.labelFont.toTextStyle(
              scheme.labelColor,
            ),
            unselectedLabelStyle: scheme.unselectedLabelFont.toTextStyle(
              scheme.labelColor,
            ),
            labelColor: scheme.labelColor,
            unselectedLabelColor: scheme.labelColor,
            tabs: <Widget>[
              for (int i = 0; i < widget.images.length; i++) ...<Widget>[
                SizedBox(
                  height: LayoutGrid.module * 6,
                  width: double.infinity,
                  child: AdmiralTab(
                    icon: widget.images[i],
                    curPosition: i,
                    selected: currentPos,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
