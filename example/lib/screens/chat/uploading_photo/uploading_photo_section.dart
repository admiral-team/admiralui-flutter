import 'package:admiralui_flutter/admiralui_flutter.dart';

class UploadingPhotoSection {
  UploadingPhotoSection(
    this.title,
    this.item,
    this.itemsCount,
    this.chatDirection,
  ) : items =
            List<UploadingPhotoItem>.filled(itemsCount, item, growable: false);

  final String title;
  final UploadingPhotoItem item;
  final int itemsCount;
  final List<UploadingPhotoItem> items;
  final ChatDirection chatDirection;
}
