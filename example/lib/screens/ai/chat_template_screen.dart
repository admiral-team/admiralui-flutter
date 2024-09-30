import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:example/navigation/tab_navigation_ai.dart';
import 'package:example/screens/ai/block/chat_template/chat_template_screen_cubit.dart';
import 'package:example/screens/ai/block/chat_template/chat_template_screen_state.dart';
import 'package:example/screens/chat/input/chat_message_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../storage/app_theme_storage.dart';

class ChatTemplateScreen extends StatefulWidget {
  const ChatTemplateScreen({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorAIRoutes route, String templateName) onPush;

  @override
  State<ChatTemplateScreen> createState() => _ChatTemplateScreenState();
}

class _ChatTemplateScreenState extends State<ChatTemplateScreen> {
  final ChatTemplateScreenCubit cubit = ChatTemplateScreenCubit();
  TextInputState textInputState = TextInputState.normal;
  final ScrollController _controller = ScrollController();

  final TextEditingController textEditingController = TextEditingController();
  final AppThemeStorage appThemeButtonStorage = AppThemeStorage();

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(_onTextChanged);
    appThemeButtonStorage.setThemeButtonHidden(true);
  }

  @override
  void dispose() {
    textEditingController.dispose();
    appThemeButtonStorage.setThemeButtonHidden(false);
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {});
  }

  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    return Scaffold(
      backgroundColor: colors.backgroundBasic.color(),
      appBar: AppBar(
        title: Text(
          widget.title,
          style: fonts.subtitle2.toTextStyle(
            colors.textPrimary.color(),
          ),
        ),
        centerTitle: true,
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: colors.backgroundBasic.color(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: LayoutGrid.doubleModule,
        ),
        child: BlocBuilder<ChatTemplateScreenCubit, ChatTemplateScreenState>(
            bloc: cubit,
            builder: (BuildContext context, ChatTemplateScreenState state) {
              return Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: colors.backgroundBasic.color(),
                      child: Material(
                        color: colors.backgroundBasic.color(),
                        child: ListView.builder(
                          controller: _controller,
                          addAutomaticKeepAlives: false,
                          physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics(),
                          ),
                          itemCount: state.chatMessages.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            switch (state.chatMessages[index].type) {
                              case ChatType.message:
                                return ChatBubbleView(
                                  text: state.chatMessages[index].text,
                                  direction:
                                      state.chatMessages[index].direction,
                                  time: state.chatMessages[index].time,
                                );
                              case ChatType.errorOperation:
                                return TextOperation(
                                      TextOperationStyle.error,
                                      ChatStatus.none,
                                      ChatDirection.left,
                                      chatBubbleStatusStyle:
                                          ChatBubbleStatusStyle.initial,
                                      title:
                                          '''Мы не смогли создать template по вашему запросу''',
                                      description:
                                          'Попробуйте другой запрос',
                                      chatBubbleTime:
                                          state.chatMessages[index].time,
                                  );
                              case ChatType.textOperation:
                                return GestureDetector(
                                    onTap: () {
                                          widget.onPush.call(
                                              TabNavigatorAIRoutes.
                                              remoteTemplate,
                                              state.chatMessages[index].text);
                                        },
                                    child: TextOperation(
                                      TextOperationStyle.success,
                                      ChatStatus.none,
                                      ChatDirection.left,
                                      chatBubbleStatusStyle:
                                          ChatBubbleStatusStyle.initial,
                                      title:
                                          'Создан template по вашему запросу',
                                      description:
                                          state.chatMessages[index].text,
                                      chatBubbleTime:
                                          state.chatMessages[index].time,
                                    ));
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: LayoutGrid.halfModule * 3,
                  ),
                  ChatInput(
                    key: const Key('chatInput'),
                    state: textInputState,
                    content: '',
                    placeholder: 'Введите сообщение',
                    isSendButtonDisabled: textEditingController.text.isEmpty,
                    isShowFileButton: false,
                    isTapSendButtonHidden: false,
                    textEditingController: textEditingController,
                    chatInputButtonKey: const Key('chatInputButton'),
                    onSendButtonPress: () {
                      cubit.createTemplate(textEditingController.text);
                      textEditingController.text = '';
                      _scrollDown();
                    },
                  ),
                  SizedBox(
                    height: LayoutGrid.doubleModule,
                  ),
                ],
              );
            }),
      ),
    );
  }

  void _scrollDown() {
    _controller.animateTo(
      _controller.position.maxScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }
}
