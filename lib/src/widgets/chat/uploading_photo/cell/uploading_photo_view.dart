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
    required this.fileInfoRadius,
    required this.chatDirection,
    this.scheme,
  });

  final UploadingPhotoItem item;
  final double width;
  final BorderRadius borderRadius;
  final BorderRadius fileInfoRadius;
  final ChatDirection chatDirection;
  final UploadingPhotoViewScheme? scheme;

  @override
  State<UploadingPhotoView> createState() => _UploadingPhotoViewState();
}

class _UploadingPhotoViewState extends State<UploadingPhotoView> {
  late UploadingPhotoViewScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? UploadingPhotoViewScheme(theme: theme);
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
          if (widget.item.fileName != null && widget.item.fileSize != null)
            Positioned(
              right: 0.0,
              bottom: 0.0,
              child: ClipRRect(
                borderRadius: widget.fileInfoRadius,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    width: widget.width,
                    height: 46,
                    padding: const EdgeInsets.fromLTRB(
                      LayoutGrid.module,
                      LayoutGrid.halfModule / 2,
                      LayoutGrid.module,
                      LayoutGrid.halfModule / 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextView(
                          widget.item.fileName!,
                          font: scheme.textFont,
                          textColorNormal: scheme.textColor.color(),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: TextView(
                                widget.item.fileSize!,
                                font: scheme.textFont,
                                textColorNormal: scheme.textColor.color(),
                                maxLines: 1,
                              ),
                            ),
                            ChatBubbleStatus(
                              style: widget.item.chatBubbleStatusStyle,
                              direction: widget.chatDirection,
                              chatStatus: widget.item.chatStatus,
                              time: widget.item.time,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          if (widget.item.fileName == null && widget.item.fileSize == null)
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
                    child: Center(
                      child: Stack(
                        children: <Widget>[
                          const Spinner(
                            style: SpinnerStyle.contrast,
                            size: SpinnerSize.medium,
                          ),
                          SizedBox(
                            width: LayoutGrid.tripleModule,
                            height: LayoutGrid.tripleModule,
                            child: CustomPaint(
                              size: const Size(
                                LayoutGrid.tripleModule,
                                LayoutGrid.tripleModule,
                              ),
                              painter: CircularPainter(
                                percentage: 100,
                                color: scheme.circleColor.colorWithOpacity(),
                                strokeWidth: LayoutGrid.halfModule,
                              ),
                            ),
                          ),
                        ],
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
