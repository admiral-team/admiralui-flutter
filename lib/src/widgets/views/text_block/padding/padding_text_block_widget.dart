import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// A widget that applies padding to its child based on the 
/// provided style and scheme.
///
/// The `PaddingWidget` class is a custom widget 
/// that applies different padding styles
/// and optionally a padding scheme to its child. 
/// This widget is stateful, meaning it 
/// maintains state that might change over time.
///
/// ## Example
///
/// ```dart
/// PaddingWidget(
///   style: PaddingStyle.short
/// )
/// ```
class PaddingWidget extends StatefulWidget {
  const PaddingWidget({
    super.key,
    this.style = PaddingStyle.short,
    this.scheme,
  });

  final PaddingStyle style;
  final PaddingWidgetScheme? scheme;

  @override
  State<PaddingWidget> createState() => _PaddingWidgetState();
}

class _PaddingWidgetState extends State<PaddingWidget> {
  late PaddingWidgetScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? PaddingWidgetScheme(theme: theme);
    return Container(
      constraints: const BoxConstraints(
        minHeight: LayoutGrid.module * 9,
      ),
      padding: EdgeInsets.symmetric(
        vertical: LayoutGrid.halfModule * 3,
        horizontal: widget.style == PaddingStyle.short ? 
        LayoutGrid.doubleModule : 0,
      ),
      width: double.infinity,
      child: Divider(
        color: scheme.lineColor,
        thickness: 0.5,
      ),
    );
  }
}
