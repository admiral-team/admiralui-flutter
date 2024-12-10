import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import '../../../navigation/tab_navigator_chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../storage/app_theme_storage.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ChatInputScreen extends StatefulWidget {
  const ChatInputScreen({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorChatRoutes route) onPush;

  @override
  State<ChatInputScreen> createState() => _ChatInputScreenState();
}

class _ChatInputScreenState extends State<ChatInputScreen> {
  final ImagePicker _picker = ImagePicker();
  TextInputState textInputState = TextInputState.normal;
  final ScrollController _controller = ScrollController();
  late List<ChatMessageBase> chatMessages = <ChatMessageBase>[
    ChatMessageItem(
      text: 'Добрый день !',
      direction: ChatDirection.left,
      time: '10:30',
    ),
  ];

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
    super.dispose();
    appThemeButtonStorage.setThemeButtonHidden(false);
  }

  void _onTextChanged() {
    setState(() {});
  }

  String _getTime() {
    DateTime now = DateTime.now();
    TimeOfDay timeOfDayDate = TimeOfDay(hour: now.hour, minute: now.minute);
    String formattedHour = timeOfDayDate.hour.toString().padLeft(2, '0');
    String formattedMinute = timeOfDayDate.minute.toString().padLeft(2, '0');

    String time = '$formattedHour:$formattedMinute';
    return time;
  }

  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    return Scaffold(
      backgroundColor: colors.backgroundBasic.color(),
      appBar: AppBar(
        leading: CupertinoButton(
          child: Icon(
            Icons.arrow_back_ios,
            color: colors.elementSecondary.color(),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Chat input',
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
        child: Column(
          children: <Widget>[
            StandardTabs(
              <String>['Default', 'Disabled'],
              onTap: (String value) {
                setState(() {
                  textInputState = value == 'Default'
                      ? TextInputState.normal
                      : TextInputState.disabled;
                });
              },
            ),
            SizedBox(
              height: LayoutGrid.doubleModule,
            ),
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
                    itemCount: chatMessages.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      final ChatMessageBase message = chatMessages[index];
                      if (message is ChatMessageItem) {
                        return ChatBubbleView(
                          text: message.text,
                          direction: message.direction,
                          chatStatus: message.chatStatus,
                          onStatusTap: () {
                            if (message.chatStatus == ChatStatus.error) {
                              setState(() {
                                chatMessages[index] = ChatMessageItem(
                                  text: message.text,
                                  direction: message.direction,
                                  time: message.time,
                                  chatStatus: ChatStatus.read,
                                );
                              });
                            }
                          },
                          time: message.time,
                        );
                      } else if (message is UploadingPhotoItem) {
                        return UploadingPhotoGridView(
                            items: <UploadingPhotoItem>[message],
                            chatDirection: ChatDirection.right);
                      }
                      return null;
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
              isShowFileButton: true,
              isTapSendButtonHidden: false,
              textEditingController: textEditingController,
              chatInputButtonKey: const Key('chatInputButton'),
              onSendButtonPress: () {
                setState(() {
                  chatMessages.add(ChatMessageItem(
                      text: textEditingController.text,
                      direction: ChatDirection.right,
                      time: _getTime(),
                      chatStatus: _getChatStatus(chatMessages.length)));
                  textEditingController.text = '';
                  _scrollDown();
                });
              },
              onFileButtonPress: () {
                _pickImage();
              },
            ),
            SizedBox(
              height: LayoutGrid.doubleModule,
            ),
          ],
        ),
      ),
    );
  }

  ChatStatus _getChatStatus(int index) {
    if (index == 1) {
      return ChatStatus.read;
    } else if (index == 2) {
      return ChatStatus.sent;
    } else if (index == 3) {
      return ChatStatus.loading;
    } else if (index == 4) {
      return ChatStatus.error;
    }
    return ChatStatus.read;
  }

  void _scrollDown() {
    _controller.animateTo(
      _controller.position.maxScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        setState(() {
          chatMessages.add(UploadingPhotoItem(
            isLoading: false,
            backgroundImage: Image(image: FileImage(File(image.path))),
            time: _getTime(),
            chatBubbleStatusStyle: ChatBubbleStatusStyle.light,
            chatStatus: ChatStatus.none,
            fileName: 'Название файла длиннее чем в...',
            fileSize: '17.5 MB',
          ));
          textEditingController.text = '';
          _scrollDown();
        });
      }
    } catch (e) {
      print('$e');
    }
  }
}
