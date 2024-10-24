import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// A view for chat message.
///
/// This widget extends [ChatBubbleView], allowing dynamic updates to its state.
///
/// Constructor:
/// ```
/// ChatBubbleView(
///    text: chatMessages[index].text,
///    chatStatus: ChatStatus.sent,
///    direction: ChatDirection.right,
///    time: '10:43',
///    name: 'Антон',
/// )
/// ```
///
/// Parameters:
/// - `text`: Text message.
/// - `chatStatus`: A status ChatBubbleView. Can be in the following states:
/// loading, error, sent, receive, read
/// - `direction`: A direction for text message. Can be: left, right
/// - `maxWidth`: The max width of view.
/// - `time`: The time of the chat bubble.
/// - `name`: Name text displayed above the message.
/// - `key`: An optional `Key` that uniquely identifies this widget.
class ChatBubbleView extends StatefulWidget {
  /// Creates an ChatBubbleView.
  const ChatBubbleView({
    super.key,
    required this.text,
    required this.direction,
    this.name,
    this.maxWidth,
    this.chatStatus = ChatStatus.none,
    this.time = '',
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onStatusTap,
    this.scheme,
  });

  final ChatStatus? chatStatus;
  final ChatDirection direction;
  final String text;
  final String time;
  final String? name;
  final double? maxWidth;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;
  final VoidCallback? onStatusTap;
  final ChatBubbleScheme? scheme;

  @override
  State<ChatBubbleView> createState() => _ChatBubbleViewState();
}

class _ChatBubbleViewState extends State<ChatBubbleView> {
  late ChatBubbleScheme scheme;
  late final ValueNotifier<Size> notifier = ValueNotifier<Size>(Size.zero);
  double _textSize = 0.0;
  bool get _isMultiline => _textSize > LayoutGrid.halfModule * 10;
  double get _textBottomPadding =>
      _isMultiline ? LayoutGrid.tripleModule : LayoutGrid.module;
  double get _textRightPadding => _isMultiline
      ? LayoutGrid.halfModule * 3
      : widget.chatStatus != ChatStatus.none
          ? LayoutGrid.module * 9
          : LayoutGrid.module * 7;

  @override
  void initState() {
    super.initState();
    notifier.addListener(() {
      setState(() {
        _textSize = notifier.value.height;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    notifier.removeListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? ChatBubbleScheme(theme: theme);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        if (widget.direction == ChatDirection.right) const Spacer(),
        Container(
          constraints: BoxConstraints(
            maxWidth: widget.maxWidth ?? MediaQuery.of(context).size.width * .8,
          ),
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.symmetric(
            vertical: LayoutGrid.module,
          ),
          child: GestureDetector(
            onTap: widget.onTap,
            onDoubleTap: widget.onDoubleTap,
            onLongPress: widget.onLongPress,
            child: Column(
              crossAxisAlignment: widget.direction == ChatDirection.left
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end,
              children: <Widget>[
                if (widget.name != null)
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: LayoutGrid.halfModule,
                    ),
                    child: TextView(
                      widget.name!,
                      font: scheme.nameTextFont,
                      textColorNormal: scheme.nameTextColor.color(),
                    ),
                  ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: scheme.backgroundColor.parameter(widget.direction),
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(LayoutGrid.halfModule * 3),
                      topRight:
                          const Radius.circular(LayoutGrid.halfModule * 3),
                      bottomLeft: Radius.circular(
                        widget.direction == ChatDirection.right
                            ? LayoutGrid.halfModule * 3
                            : 0,
                      ),
                      bottomRight: Radius.circular(
                        widget.direction == ChatDirection.left
                            ? LayoutGrid.halfModule * 3
                            : 0,
                      ),
                    ),
                  ),
                  child: ChildSizeNotifier(
                    notifier: notifier,
                    builder: (BuildContext context, Size size, Widget? child) {
                      return Stack(
                        children: <Widget>[
                          Padding(
                            padding: widget.chatStatus != null &&
                                    widget.chatStatus != ChatStatus.error
                                ? EdgeInsets.fromLTRB(
                                    LayoutGrid.halfModule * 3,
                                    LayoutGrid.module - 2,
                                    _textRightPadding,
                                    _textBottomPadding,
                                  )
                                : const EdgeInsets.symmetric(
                                    vertical: LayoutGrid.module,
                                    horizontal: LayoutGrid.halfModule * 3,
                                  ),
                            child: SelectableText(
                              widget.text,
                              style: TextStyle(
                                fontSize: scheme.textFont.fontSize,
                                color: scheme.textColor
                                    .parameter(widget.direction),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          if (widget.chatStatus != null &&
                              widget.chatStatus != ChatStatus.error)
                            Positioned(
                              bottom: LayoutGrid.halfModule,
                              right: LayoutGrid.module - 2,
                              child: GestureDetector(
                                onTap: widget.onStatusTap,
                                child: ChatBubbleStatus(
                                  chatStatus: widget.chatStatus!,
                                  style: widget.direction == ChatDirection.left
                                      ? ChatBubbleStatusStyle.initial
                                      : ChatBubbleStatusStyle.light,
                                  direction: widget.direction,
                                  time: widget.time,
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        if (widget.direction == ChatDirection.left) const Spacer(),
        if (widget.chatStatus == ChatStatus.error)
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 0, 0, 4),
            child: GestureDetector(
              onTap: widget.onStatusTap,
              child: Icon(
                AdmiralIcons.admiral_ic_error_solid,
                color: theme.colors.elementError.color(),
              ),
            ),
          ),
      ],
    );
  }
}
