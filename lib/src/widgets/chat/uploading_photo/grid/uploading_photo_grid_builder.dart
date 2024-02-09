import 'package:admiralui_flutter/admiralui_flutter.dart';

/// Class that returns data source for UploadingPhotoGridView.
///
/// Parameters:
/// item - An array of UploadingPhotoItem.
class UploadingPhotoGridItemBuilder {
  UploadingPhotoGridItemBuilder({
    required this.items,
  });

  final List<UploadingPhotoItem> items;

  List<List<UploadingPhotoCellItem>> generateDataSource() {
    List<UploadingPhotoCellItem> dataSource = <UploadingPhotoCellItem>[];

    switch (items.length) {
      case 0:
        break;
      case 1:
        dataSource = <UploadingPhotoCellItem>[
          UploadingPhotoCellItem(
            item: items.first,
            cornerStyle: UploadingPhotoGridCornerStyle.allSides,
          ),
        ];
        break;
      case 2:
        dataSource = <UploadingPhotoCellItem>[
          UploadingPhotoCellItem(
            item: items.first,
            cornerStyle: UploadingPhotoGridCornerStyle.topLeftBottomLeft,
          ),
          UploadingPhotoCellItem(
            item: items.last,
            cornerStyle: UploadingPhotoGridCornerStyle.topRightBottomRight,
          ),
        ];
        break;
      case 3:
        dataSource = <UploadingPhotoCellItem>[
          UploadingPhotoCellItem(
            item: items[0],
            cornerStyle: UploadingPhotoGridCornerStyle.topLeft,
          ),
          UploadingPhotoCellItem(
            item: items[1],
            cornerStyle: UploadingPhotoGridCornerStyle.topRight,
          ),
          UploadingPhotoCellItem(
            item: items[2],
            cornerStyle: UploadingPhotoGridCornerStyle.topRight,
          ),
        ];
        break;
      case 4:
        dataSource = <UploadingPhotoCellItem>[
          UploadingPhotoCellItem(
            item: items[0],
            cornerStyle: UploadingPhotoGridCornerStyle.topLeft,
          ),
          UploadingPhotoCellItem(
            item: items[1],
            cornerStyle: UploadingPhotoGridCornerStyle.topLeft,
          ),
          UploadingPhotoCellItem(
            item: items[2],
            cornerStyle: UploadingPhotoGridCornerStyle.bottomLeft,
          ),
          UploadingPhotoCellItem(
            item: items[3],
            cornerStyle: UploadingPhotoGridCornerStyle.bottomRight,
          ),
        ];
        break;
      case 5:
        dataSource = <UploadingPhotoCellItem>[
          UploadingPhotoCellItem(
            item: items[0],
            cornerStyle: UploadingPhotoGridCornerStyle.topLeft,
          ),
          UploadingPhotoCellItem(
            item: items[1],
            cornerStyle: UploadingPhotoGridCornerStyle.topRight,
          ),
          UploadingPhotoCellItem(
            item: items[2],
            cornerStyle: UploadingPhotoGridCornerStyle.none,
          ),
          UploadingPhotoCellItem(
            item: items[3],
            cornerStyle: UploadingPhotoGridCornerStyle.none,
          ),
          UploadingPhotoCellItem(
            item: items[4],
            cornerStyle: UploadingPhotoGridCornerStyle.bottomLeftBottomRight,
          ),
        ];
        break;
      default:
        for (int i = 0; i < items.length; i += 1) {
          if (i == 0) {
            dataSource.add(
              UploadingPhotoCellItem(
                item: items[i],
                cornerStyle: UploadingPhotoGridCornerStyle.topLeft,
              ),
            );
          } else if (i == 1) {
            dataSource.add(
              UploadingPhotoCellItem(
                item: items[i],
                cornerStyle: UploadingPhotoGridCornerStyle.topRight,
              ),
            );
          } else if (i == items.length - 1) {
            dataSource.add(
              UploadingPhotoCellItem(
                item: items[i],
                cornerStyle: items.length.isEven
                    ? UploadingPhotoGridCornerStyle.bottomRight
                    : UploadingPhotoGridCornerStyle.bottomLeftBottomRight,
              ),
            );
          } else if (i == items.length - 2) {
            dataSource.add(
              UploadingPhotoCellItem(
                item: items[i],
                cornerStyle: items.length.isEven
                    ? UploadingPhotoGridCornerStyle.bottomLeft
                    : UploadingPhotoGridCornerStyle.none,
              ),
            );
          } else {
            dataSource.add(
              UploadingPhotoCellItem(
                item: items[i],
                cornerStyle: UploadingPhotoGridCornerStyle.none,
              ),
            );
          }
        }
        break;
    }

    return partition(dataSource, 2).toList();
  }
}
