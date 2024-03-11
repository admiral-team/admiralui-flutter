import 'package:admiralui_flutter/admiralui_flutter.dart';

class ChatMessageItem {
  ChatMessageItem({
    required this.direction,
    required this.text,
    required this.time,
  });

  final ChatDirection direction;
  final String text;
  final String time;
}
