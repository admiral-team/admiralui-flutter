import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:admiralui_flutter/src/widgets/chat/chat_bubble/chat_bubble_status_scheme.dart';
import 'package:admiralui_flutter/src/widgets/chat/chat_bubble/chat_bubble_status_style.dart';
import 'package:admiralui_flutter/src/widgets/chat/chat_direction.dart';
import 'package:admiralui_flutter/src/widgets/chat/chat_status.dart';
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
  late Icon icon;

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

    final Color imageColor = (widget.style == ChatBubbleStatusStyle.initial)
        ? scheme.imageColorSecondary.color()
        : scheme.imageColorDefault.color();

    switch (widget.chatStatus) {
      case ChatStatus.error:
        icon = Icon(
          AdmiralIcons.admiral_ic_error_outline,
          color: imageColor,
        );
        break;
      case ChatStatus.read:
        icon = Icon(
          AdmiralIcons.admiral_ic_chat_outline,
          color: imageColor,
        );
        break;
      case ChatStatus.receive:
        icon = Icon(
          AdmiralIcons.admiral_ic_chat_outline,
          color: imageColor,
        );
        break;
      case ChatStatus.sent:
        icon = Icon(
          AdmiralIcons.admiral_ic_chat_outline,
          color: imageColor,
        );
        break;
      case ChatStatus.loading:
        icon = Icon(
          AdmiralIcons.admiral_ic_time_outline,
          color: imageColor,
        );
        break;
      default:
        break;
    }

    return Row(
      children: <Widget>[
        Text(
          widget.time,
          style: TextStyle(
            fontSize: scheme.textFont.fontSize,
            color: textColor,
            fontFamily: scheme.textFont.fontFamily,
            fontWeight: scheme.textFont.fontWeight,
          ),
        ),
        if (widget.chatStatus != ChatStatus.none)
          Row(
            children: <Widget>[
              SizedBox(
                width: LayoutGrid.tripleModule / 4,
              ),
              icon,
            ],
          ),
      ],
    );
  }
}
