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
class UploadingPhotoItem {
  UploadingPhotoItem({
    required this.isLoading,
    required this.time,
    required this.backgroundImage,
    required this.chatBubbleStatusStyle,
    required this.chatStatus,
  });

  bool isLoading;
  final String time;
  final Image backgroundImage;
  final ChatBubbleStatusStyle chatBubbleStatusStyle;
  final ChatStatus chatStatus;
}
