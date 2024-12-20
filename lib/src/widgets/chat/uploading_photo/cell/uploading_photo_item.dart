import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

/// Model that contains number of parameters to build
/// an UploadingPhotoView.
///
/// Parameters:
/// isLoading - The flag that controls loading state.
/// time - The time of ChatBubbleStatusView.
/// backgroundImage - The background image of UploadingPhotoView.
/// chatBubbleStatusStyle - The visual style of ChatBubbleStatusView.
/// chatStatus - The status of ChatBubbleStatusView.
class UploadingPhotoItem extends ChatMessageBase {
  UploadingPhotoItem({
    required this.isLoading,
    required this.time,
    required this.backgroundImage,
    required this.chatBubbleStatusStyle,
    required this.chatStatus,
    this.fileName,
    this.fileSize,
  });

  bool isLoading;
  final String time;
  final String? fileSize;
  final String? fileName;
  final Image backgroundImage;
  final ChatBubbleStatusStyle chatBubbleStatusStyle;
  final ChatStatus chatStatus;
}
