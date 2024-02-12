import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// The component that used to build UploadingPhotoView by group
///
/// Parameters:
/// items - An array of UploadingPhotoItem.
/// chatDirection - The direction of chat items(left/right edge).
/// scheme - The visial scheme of UploadingPhotoView.
class UploadingPhotoGridView extends StatefulWidget {
  /// Creates an UploadingPhotoGridView.
  const UploadingPhotoGridView({
    super.key,
    required this.items,
    required this.chatDirection,
    this.scheme,
  });

  final List<UploadingPhotoItem> items;
  final ChatDirection chatDirection;
  final UploadingPhotoViewScheme? scheme;

  @override
  State<UploadingPhotoGridView> createState() => _UploadingPhotoGridViewState();
}

class _UploadingPhotoGridViewState extends State<UploadingPhotoGridView> {
  late UploadingPhotoViewScheme scheme;

  @override
  Widget build(BuildContext context) {
    final List<List<UploadingPhotoCellItem>> uploadingPhotosPairs =
        UploadingPhotoGridItemBuilder(items: widget.items).generateDataSource();

    return Wrap(
      direction: Axis.vertical,
      spacing: LayoutGrid.module,
      alignment: widget.chatDirection == ChatDirection.left
          ? WrapAlignment.start
          : WrapAlignment.end,
      children: <Widget>[
        for (int i = 0; i < uploadingPhotosPairs.length; i += 1)
          _generateRow(uploadingPhotosPairs[i]),
      ],
    );
  }

  Widget _generateRow(List<UploadingPhotoCellItem> rowItems) {
    const double spacingBetweenCells = LayoutGrid.module;

    return Wrap(
      alignment: widget.chatDirection == ChatDirection.left
          ? WrapAlignment.start
          : WrapAlignment.end,
      spacing: LayoutGrid.module,
      children: <Widget>[
        for (final UploadingPhotoCellItem item in rowItems)
          UploadingPhotoView(
            item: item.item,
            width: rowItems.length == 2 ? 142 : (142 * 2) + spacingBetweenCells,
            borderRadius: item.cornerStyle.value,
            chatDirection: widget.chatDirection,
          ),
      ],
    );
  }
}
