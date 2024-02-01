import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class TextOperation extends StatefulWidget {
  /// Creates an TextOperation.
  const TextOperation(
    this.style,
    this.chatStatus,
    this.direction, {
    super.key,
    this.chatBubbleStatusStyle = ChatBubbleStatusStyle.initial,
    this.title = '',
    this.description = '',
    this.time = '',
    this.chatBubbleTime = '',
    this.isEnable = true,
    this.scheme,
  });

  final TextOperationStyle style;
  final ChatStatus chatStatus;
  final ChatDirection direction;
  final ChatBubbleStatusStyle chatBubbleStatusStyle;
  final String title;
  final String description;
  final String time;
  final String chatBubbleTime;
  final bool isEnable;
  final TextOperationScheme? scheme;

  @override
  State<TextOperation> createState() => _TextOperationState();
}

class _TextOperationState extends State<TextOperation> {
  late TextOperationScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? TextOperationScheme(theme: theme);

    final Color backgroundColor = scheme.backgroundColor.unsafeParameter(
      widget.isEnable ? ControlState.normal : ControlState.disabled,
      widget.style,
    );

    final Color titleColor = scheme.titleColor.unsafeParameter(
      widget.isEnable ? ControlState.normal : ControlState.disabled,
      widget.style,
    );

    return Row(
      children: <Widget>[
        if (widget.direction == ChatDirection.right) const Spacer(),
        Container(
          alignment: Alignment.centerLeft,
          width: LayoutGrid.module * 29,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(LayoutGrid.tripleModule / 2),
          ),
          child: Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(
              left: LayoutGrid.tripleModule / 2,
              right: LayoutGrid.tripleModule / 2,
              top: LayoutGrid.module,
              bottom: LayoutGrid.module,
            ),
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: TextView(
                        widget.title,
                        font: scheme.titleFont,
                        textColorNormal: titleColor,
                      ),
                    ),
                    const SizedBox(
                      height: LayoutGrid.module / 2,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: TextView(
                        widget.description,
                        font: scheme.descriptionFont,
                        textColorNormal: scheme.descriptionColor.color(),
                      ),
                    ),
                    const SizedBox(
                      height: LayoutGrid.module / 2,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: TextView(
                        widget.time,
                        font: scheme.timeFont,
                        textColorNormal: scheme.timeColor.color(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: LayoutGrid.module),
                Row(
                  children: <Widget>[
                    const Spacer(),
                    ChatBubbleStatus(
                      style: widget.chatBubbleStatusStyle,
                      chatStatus: widget.chatStatus,
                      direction: widget.direction,
                      time: widget.chatBubbleTime,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (widget.direction == ChatDirection.left) const Spacer(),
      ],
    );
  }
}
