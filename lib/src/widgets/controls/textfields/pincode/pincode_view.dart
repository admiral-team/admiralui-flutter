import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// A widget for displaying a pin code input view.
///
/// This widget extends [StatefulWidget] to allow dynamic updates to its state.
///
/// Constructor:
/// ```
/// PincodeView({
///   Key? key,
///   ValueChanged<String>? onTapNumber,
///   Widget? leadingWidget,
///   Widget? trailingWidget,
///   VoidCallback? onTapLeadingWidget,
///   VoidCallback? onTapTrailingWidget,
/// })
/// ```
///
/// Parameters:
/// - `onTapNumber`: A callback function that is called
/// when a number in the pin code view is tapped.
/// - `leadingWidget`: A widget to be displayed as a leading element
/// in the pin code view.
/// - `trailingWidget`: A widget to be displayed as a trailing element
/// in the pin code view.
/// - `onTapLeadingWidget`: A callback function that is called when the
/// leading widget is tapped.
/// - `onTapTrailingWidget`: A callback function that is called when the
/// trailing widget is tapped.
///
/// Example usage:
/// ```dart
/// PincodeView(
///   onTapNumber: (String number) {
///     // Handle tapped number
///   },
///   leadingWidget: Icon(Icons.arrow_back),
///   trailingWidget: Icon(Icons.clear),
///   onTapLeadingWidget: () {
///     // Handle tap on leading widget
///   },
///   onTapTrailingWidget: () {
///     // Handle tap on trailing widget
///   },
/// )
class PincodeView extends StatefulWidget {
  const PincodeView({
    super.key,
    this.onTapNumber,
    this.leadingidget,
    this.trailingWidget,
    this.onTapLeadingWidget,
    this.onTapTrailingWidget,
  });

  final ValueChanged<String>? onTapNumber;
  final Widget? leadingidget;
  final Widget? trailingWidget;
  final VoidCallback? onTapTrailingWidget;
  final VoidCallback? onTapLeadingWidget;

  @override
  State<PincodeView> createState() => _PincodeViewState();
}

class _PincodeViewState extends State<PincodeView> {
  late final List<List<PincodeItem?>> _pincodeItems = partition(
    <PincodeItem?>[
      PincodeItem(number: '1'),
      PincodeItem(number: '2'),
      PincodeItem(number: '3'),
      PincodeItem(number: '4'),
      PincodeItem(number: '5'),
      PincodeItem(number: '6'),
      PincodeItem(number: '7'),
      PincodeItem(number: '8'),
      PincodeItem(number: '9'),
      PincodeItem(
        leadingWidget: widget.leadingidget,
      ),
      PincodeItem(number: '0'),
      PincodeItem(
        trailingWidget: widget.trailingWidget,
      ),
    ],
    3,
  ).toList();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        direction: Axis.vertical,
        spacing: LayoutGrid.doubleModule,
        children: <Widget>[
          for (final List<PincodeItem?> row in _pincodeItems)
            Wrap(
              spacing: LayoutGrid.halfModule * 11,
              children: <Widget>[
                for (final PincodeItem? rowElement in row)
                  PincodeItemView(
                    item: rowElement,
                    onPressed: () => <Set<void>>{
                      if (rowElement?.number != null)
                        <void>{
                          widget.onTapNumber?.call(rowElement!.number!),
                        }
                      else if (rowElement?.leadingWidget != null)
                        <void>{
                          widget.onTapLeadingWidget?.call(),
                        }
                      else if (rowElement?.trailingWidget != null)
                        <void>{
                          widget.onTapTrailingWidget?.call(),
                        },
                    },
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
