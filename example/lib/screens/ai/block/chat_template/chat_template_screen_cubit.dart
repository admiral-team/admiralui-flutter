import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:example/domain/use_cases/chat_template/interface/chat_template_case.dart';
import 'package:example/models/template_model.dart';
import 'package:example/screens/ai/block/chat_template/chat_template_screen_state.dart';
import 'package:example/screens/chat/input/chat_message_item.dart';
import 'package:example/shared/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatTemplateScreenCubit extends Cubit<ChatTemplateScreenState> {
  ChatTemplateScreenCubit()
      : super(const ChatTemplateScreenState(<ChatMessageItem>[])) {
    emit(ChatTemplateScreenState(<ChatMessageItem>[
      ChatMessageItem(
        text: '''Добрый день! Я готов помочь вам с созданием интерфейсов. Вот несколько примеров того, как вы можете формулировать свои запросы:

- Создай анкету для поиска домашних животных с полями: порода, цвет и кличка.
- Придумай интерфейс для оформления кредита.
- Экран регистрации.

Вы можете запросить создание интерфейса для любой задачи или формы. Просто опишите, что вам нужно, а я помогу его создать!''',
        direction: ChatDirection.left,
        time: _getTime(),
      ),
    ]));
  }
  final ChatTemplateCase chatTemplateCase = DI.getInstance().chatTemplateCase;

  Future<void> createTemplate(String message) async {
    List<ChatMessageItem> messages = state.chatMessages;
    messages.add(ChatMessageItem(
      text: message,
      direction: ChatDirection.right,
      time: _getTime(),
    ));
    emit(ChatTemplateScreenState(messages));
    final TemplateModel model = await chatTemplateCase.createTemplate(message);
    if (model.name != null) {
      messages.add(ChatMessageItem(
          text: model.name ?? '',
          direction: ChatDirection.left,
          time: _getTime(),
          type: ChatType.textOperation));
    } else {
      messages.add(ChatMessageItem(
          text: model.name ?? '',
          direction: ChatDirection.left,
          time: _getTime(),
          type: ChatType.errorOperation));
    }
    emit(ChatTemplateScreenState(messages));
  }

  String _getTime() {
    DateTime now = DateTime.now();
    TimeOfDay timeofDayDate = TimeOfDay(hour: now.hour, minute: now.minute);
    String time =
        '${timeofDayDate.hour}:${timeofDayDate.minute
        .toString()
        .padLeft(2, '0')}';
    return time;
  }
}
