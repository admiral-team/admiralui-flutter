import 'dart:ui';

import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// The component that presents backgound image with loader
/// for uploading and downloading tasks.
///
/// Parameters:
/// item - Model that contains number of parameters to build
/// an UploadingPhotoView.
/// width - The width of UploadingPhotoView.
/// borderRadius - The style of BorderRadius in UploadingPhotoView.
/// chatDirection - The direction of chat items(left/right edge).
class UploadingPhotoView extends StatefulWidget {
  /// Creates an UploadingPhotoView.
  const UploadingPhotoView({
    super.key,
    required this.item,
    required this.width,
    required this.borderRadius,
    required this.chatDirection,
    this.scheme,
  });

  final UploadingPhotoItem item;
  final double width;
  final BorderRadius borderRadius;
  final ChatDirection chatDirection;
  final UploadingPhotoViewScheme? scheme;

  @override
  State<UploadingPhotoView> createState() => _UploadingPhotoViewState();
}

class _UploadingPhotoViewState extends State<UploadingPhotoView> {
  late UploadingPhotoViewScheme scheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: 142,
      child: Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          Container(
            width: widget.width,
            height: 142,
            decoration: BoxDecoration(
              borderRadius: widget.borderRadius,
              image: DecorationImage(
                image: widget.item.backgroundImage.image,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            right: LayoutGrid.tripleModule / 2,
            bottom: LayoutGrid.module,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(
                    LayoutGrid.module,
                    LayoutGrid.halfModule / 2,
                    LayoutGrid.module,
                    LayoutGrid.halfModule / 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                  ),
                  child: ChatBubbleStatus(
                    style: widget.item.chatBubbleStatusStyle,
                    direction: widget.chatDirection,
                    chatStatus: widget.item.chatStatus,
                    time: widget.item.time,
                  ),
                ),
              ),
            ),
          ),
          if (widget.item.isLoading)
            Center(
              child: ClipRRect(
                borderRadius: widget.borderRadius,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    width: widget.width,
                    height: 142,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                    ),
                    child: const Center(
                      child: Spinner(
                        style: SpinnerStyle.contrast,
                        size: SpinnerSize.medium,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
