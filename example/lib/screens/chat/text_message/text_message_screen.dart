import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import '../../../navigation/tab_navigator_chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../storage/app_theme_storage.dart';

class TextMessageScreen extends StatefulWidget {
  const TextMessageScreen({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorChatRoutes route) onPush;

  @override
  State<TextMessageScreen> createState() => _TextMessageScreenState();
}

class _TextMessageScreenState extends State<TextMessageScreen> {
  TextInputState textInputState = TextInputState.normal;
  final ScrollController _controller = ScrollController();
  late List<ChatMessageItem> chatMessages = <ChatMessageItem>[
    ChatMessageItem(
      text: 'Hello',
      direction: ChatDirection.right,
      time: '10:30',
      chatStatus: ChatStatus.read,
    ),
    ChatMessageItem(
      text: '''At breakpoint boundaries, miniunits divide the screen into a 
          fixed master grid, and multiples of mini units map to fluid grid column widths and row heights.''',
      direction: ChatDirection.right,
      time: '10:30',
      chatStatus: ChatStatus.loading,
    ),
    ChatMessageItem(
        text: 'At breakpoint boundaries, mini units divide',
        direction: ChatDirection.left,
        time: '10:30',
        name: 'Татьяна'),
    ChatMessageItem(
      text: 'Text message',
      direction: ChatDirection.left,
      time: '10:30',
    ),
    ChatMessageItem(
      text:
          '''At breakpoint boundaries, miniunits divide the screen into a fixed 
          master grid, and multiples of mini units map to fluid grid column widths and row heights.''',
      direction: ChatDirection.right,
      time: '10:30',
    ),
  ];

  final TextEditingController textEditingController = TextEditingController();
  final AppThemeStorage appThemeButtonStorage = AppThemeStorage();

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
                      return ChatBubbleView(
                        text: chatMessages[index].text,
                        direction: chatMessages[index].direction,
                        chatStatus: chatMessages[index].chatStatus,
                        time: chatMessages[index].time,
                        name: chatMessages[index].name,
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: LayoutGrid.halfModule * 3,
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
