import 'package:admiralui_flutter/admiralui_flutter.dart';

/// Model that contains corner radius style and UploadingPhotoItem model.
///
/// Parameters:
/// item - UploadingPhotoItem model for bulding UploadingPhotoView cell.
/// cornerStyle - The corner style of UploadingPhotoView cell.
class UploadingPhotoCellItem {
  UploadingPhotoCellItem({
    required this.item,
    required this.cornerStyle,
  });

  final UploadingPhotoItem item;
  final UploadingPhotoGridCornerStyle cornerStyle;
}
