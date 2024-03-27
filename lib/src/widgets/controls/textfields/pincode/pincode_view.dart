import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// A view for secure pin code entry.
///
/// This widget extends [PincodeView], allowing dynamic updates to its state.
///
/// Constructor:
/// ```
/// PincodeView(
///    onTapNumber: {},
///    onTapIcon: {},
///    rightButtonIcon: Icon(),
/// )
/// ```
///
/// Parameters:
/// - `onTapNumber`: The number tap event.
/// - `onTapIcon`: The icon tap event.
/// - `rightButtonIcon`: The right button icon.
/// - `key`: An optional `Key` that uniquely identifies this widget.
class PincodeView extends StatefulWidget {
  /// Creates an UploadingPhotoGridView.
  const PincodeView({
    super.key,
    this.onTapNumber,
    this.onTapIcon,
    this.rightButtonIcon,
  });

  final ValueChanged<String>? onTapNumber;
  final VoidCallback? onTapIcon;
  final Icon? rightButtonIcon;

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
      null,
      PincodeItem(number: '0'),
      PincodeItem(
        icon: widget.rightButtonIcon,
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
                      else if (rowElement?.icon != null)
                        <void>{
                          widget.onTapIcon?.call(),
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
