import 'package:example/domain/use_cases/chat_template/interface/chat_template_case.dart';
import 'package:example/models/template_model.dart';
import 'package:example/screens/ai/block/chat_template/chat_template_screen_state.dart';
import 'package:example/shared/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatTemplateScreenCubit extends Cubit<ChatTemplateScreenState> {
  ChatTemplateScreenCubit() : super(const ChatTemplateScreenState()) {
    emit(ChatTemplateScreenState());
  }
  final ChatTemplateCase chatTemplateCase = DI.getInstance().chatTemplateCase;

  Future<void> createTemplate(String message) async {
    final TemplateModel _ = await chatTemplateCase.createTemplate(message);
  }
}
