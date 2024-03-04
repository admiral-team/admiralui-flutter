import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// A view for chat message..
///
/// This widget extends [ChatBubbleView], allowing dynamic updates to its state.
///
/// Constructor:
/// ```
/// ChatBubbleView(
///    text: chatMessages[index].text,
///    chatStatus: ChatStatus.sent,
///    direction: 'some message',
///    time: '10:43',
/// )
/// ```
///
/// Parameters:
/// - `text`: Text message.
/// - `chatStatus`: A status ChatBubbleView. Can be in the following states:
/// loading, error, sent, receive, read
/// - `direction`:  A direction for text mesage. Can be: left, right
/// - `maxWidth`: The max width of view.
/// - `time`: The time of the chat buble.
/// - `key`: An optional `Key` that uniquely identifies this widget.
class ChatBubbleView extends StatefulWidget {
  /// Creates an ChatBubbleStatus.
  const ChatBubbleView({
    super.key,
    required this.text,
    required this.chatStatus,
    required this.direction,
    this.maxWidth,
    this.time = '',
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.scheme,
  });

  final ChatStatus? chatStatus;
  final ChatDirection direction;
  final String text;
  final String time;
  final double? maxWidth;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;
  final ChatBubbleScheme? scheme;

  @override
  State<ChatBubbleView> createState() => _ChatBubbleViewState();
}

class _ChatBubbleViewState extends State<ChatBubbleView> {
  late ChatBubbleScheme scheme;
  // ignore: use_named_constants
  final ValueNotifier<Size> notifier = ValueNotifier<Size>(const Size(0, 0));
  double _textSize = 0.0;
  bool get _isMultiline => _textSize > LayoutGrid.halfModule * 10;
  double get _textBottomPadding =>
      _isMultiline ? LayoutGrid.tripleModule : LayoutGrid.module;
  double get _textRightPadding =>
      _isMultiline ? LayoutGrid.halfModule * 3 : LayoutGrid.module * 9;

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
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: scheme.backgroundColor.parameter(widget.direction),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(LayoutGrid.halfModule * 3),
                  topRight: const Radius.circular(LayoutGrid.halfModule * 3),
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
              child: _ChildSizeNotifier(
                notifier: notifier,
                builder: (BuildContext context, Size size, Widget? child) {
                  return Stack(
                    children: <Widget>[
                      Padding(
                        padding: widget.chatStatus != null
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
                            color: scheme.textColor.parameter(widget.direction),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      if (widget.chatStatus != null)
                        Positioned(
                          bottom: LayoutGrid.halfModule,
                          right: LayoutGrid.module - 2,
                          child: ChatBubbleStatus(
                            chatStatus: widget.chatStatus!,
                            style: ChatBubbleStatusStyle.initial,
                            direction: widget.direction,
                            time: widget.time,
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        if (widget.direction == ChatDirection.left) const Spacer(),
      ],
    );
  }
}

class _ChildSizeNotifier extends StatelessWidget {
  const _ChildSizeNotifier({
    required this.notifier,
    required this.builder,
    // ignore: unused_element
    this.child,
  });
  // ignore: always_specify_types, use_named_constants
  final ValueNotifier<Size> notifier;
  final Widget Function(BuildContext context, Size size, Widget? child) builder;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        notifier.value = (context.findRenderObject()! as RenderBox).size;
      },
    );
    // ignore: always_specify_types
    return ValueListenableBuilder(
      valueListenable: notifier,
      builder: builder,
      child: child,
    );
  }
}
