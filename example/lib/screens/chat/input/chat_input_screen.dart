import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:example/navigation/tab_navigator_chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../storage/app_theme_storage.dart';

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

class ChatMessageItem {
  ChatMessageItem({
    required this.text,
  });

  final String text;
}

class _ChatInputScreenState extends State<ChatInputScreen> {
  TextInputState textInputState = TextInputState.normal;
  final List<ChatMessageItem> chatMessages = <ChatMessageItem>[
    ChatMessageItem(text: 'Добрый день !'),
  ];

  final TextEditingController textEditingController = TextEditingController();
  final AppThemeStorage appThemeButtonStorage = AppThemeStorage();

  @override
  void initState() {
    super.initState();
    appThemeButtonStorage.toggleButton();
  }

  @override
  void dispose() {
    super.dispose();
    appThemeButtonStorage.toggleButton();
  }

  @override
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
                    addAutomaticKeepAlives: false,
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    itemCount: chatMessages.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return Row(
                        children: <Widget>[
                          Spacer(),
                          Text(chatMessages[index].text),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            Spacer(),
            ChatInput(
              state: textInputState,
              content: '',
              placeholder: 'Введите сообщение',
              isSendButtonDisabled: true,
              isShowFileButton: true,
              isTapSendButtonHidden: false,
              textEditingController: textEditingController,
              onSendButtonPress: () {
                setState(() {
                  chatMessages
                      .add(ChatMessageItem(text: textEditingController.text));
                  textEditingController.text = '';
                });
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
}
