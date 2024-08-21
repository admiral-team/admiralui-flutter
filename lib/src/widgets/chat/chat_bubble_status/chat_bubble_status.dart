import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:admiralui_flutter/src/widgets/chat/chat_bubble_status/chat_bubble_status_scheme.dart';
import 'package:flutter/material.dart';

class ChatBubbleStatus extends StatefulWidget {
  /// Creates an ChatBubbleStatus.
  const ChatBubbleStatus({
    super.key,
    required this.style,
    required this.chatStatus,
    required this.direction,
    this.time = '',
    this.isEnable = true,
    this.scheme,
  });

  final ChatBubbleStatusStyle style;
  final ChatStatus chatStatus;
  final ChatDirection direction;
  final String time;
  final bool isEnable;
  final ChatBubbleStatusScheme? scheme;

  @override
  State<ChatBubbleStatus> createState() => _ChatBubbleStatusState();
}

class _ChatBubbleStatusState extends State<ChatBubbleStatus> {
  late ChatBubbleStatusScheme scheme;
  Icon? icon;
  late Color imageColor;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? ChatBubbleStatusScheme(theme: theme);

    final Color textColor = scheme.textColor.unsafeParameter(
      widget.isEnable ? ControlState.normal : ControlState.disabled,
      widget.style,
      widget.direction,
      widget.chatStatus,
    );

    imageColor = (widget.style == ChatBubbleStatusStyle.initial)
        ? scheme.imageColorSecondary.color()
        : scheme.imageColorDefault.color();

    switch (widget.chatStatus) {
      case ChatStatus.read:
        icon = Icon(
          AdmiralIcons.admiral_ic_read_check_outline,
          color: imageColor,
          size: LayoutGrid.doubleModule,
        );
        break;
      case ChatStatus.receive:
        icon = Icon(
          AdmiralIcons.admiral_ic_sent_outline,
          color: imageColor,
          size: LayoutGrid.doubleModule,
        );
        break;
      case ChatStatus.sent:
        icon = Icon(
          AdmiralIcons.admiral_ic_sent_outline,
          color: imageColor,
          size: LayoutGrid.doubleModule,
        );
        break;
      case ChatStatus.loading:
        icon = Icon(
          AdmiralIcons.admiral_ic_time_outline,
          color: imageColor,
          size: LayoutGrid.halfModule * 3,
        );
        break;
      default:
        break;
    }

    return Row(
      children: <Widget>[
        TextView(
          widget.time,
          font: scheme.textFont,
          textColorNormal: textColor,
        ),
        const SizedBox(
          width: LayoutGrid.halfModule,
        ),
        if (widget.chatStatus != ChatStatus.none)
          Row(
            children: <Widget>[
              icon ?? Container(),
            ],
          ),
      ],
    );
  }
}
