import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// The style of BorderRadius in UploadingPhotoView.
///
/// Parameters:
/// allSides - UploadingPhotoView has border radius at all sided.
/// none - UploadingPhotoView has no border radius.
/// topLeftTopRight - UploadingPhotoView has border radius at the
/// top left and top right corner.
/// bottomLeftBottomRight - UploadingPhotoView has border radius at the
/// bottom left and bottom right corner.
/// topLeftBottomLeft - UploadingPhotoView has border radius at the
/// top left and bottom left corner.
/// topRightBottomRight - UploadingPhotoView has border radius at the
/// top right and bottom right corner.
/// topLeft - UploadingPhotoView has border radius at top left side only.
/// topRight - UploadingPhotoView has border radius at top right side only.
/// bottomLeft - UploadingPhotoView has border radius at bottom left side only.
/// bottomRight - UploadingPhotoView has border radius at bottom right side only
enum UploadingPhotoGridCornerStyle {
  allSides(BorderRadius.all(radius)),
  none(BorderRadius.zero),
  topLeftTopRight(
    BorderRadius.only(
      topLeft: radius,
      topRight: radius,
    ),
  ),
  bottomLeftBottomRight(
    BorderRadius.only(
      bottomLeft: radius,
      bottomRight: radius,
    ),
  ),
  topLeftBottomLeft(
    BorderRadius.only(
      topLeft: radius,
      bottomLeft: radius,
    ),
  ),
  topRightBottomRight(
    BorderRadius.only(
      topRight: radius,
      bottomRight: radius,
    ),
  ),
  topLeft(
    BorderRadius.only(
      topLeft: radius,
    ),
  ),
  topRight(
    BorderRadius.only(
      topRight: radius,
    ),
  ),
  bottomLeft(
    BorderRadius.only(
      bottomLeft: radius,
    ),
  ),
  bottomRight(
    BorderRadius.only(
      bottomRight: radius,
    ),
  );

  const UploadingPhotoGridCornerStyle(this.value);
  static const Radius radius = Radius.circular(LayoutGrid.tripleModule / 2);
  final BorderRadius value;
}
