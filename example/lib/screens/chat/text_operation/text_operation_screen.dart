import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';
import '../../../navigation/tab_navigator_chat.dart';

class TextOperationScreen extends StatelessWidget {
  const TextOperationScreen({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorChatRoutes route) onPush;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    return Scaffold(
      backgroundColor: colors.backgroundBasic.color(),
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Text Operation',
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
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: LayoutGrid.tripleModule),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextView(
                    'Default',
                    font: theme.fonts.headline,
                    textColorNormal: theme.colors.textSecondary.color(),
                  )
                ],
              ),
              SizedBox(height: LayoutGrid.doubleModule),
              TextOperation(
                TextOperationStyle.initial,
                ChatStatus.none,
                ChatDirection.left,
                chatBubbleStatusStyle: ChatBubbleStatusStyle.initial,
                title: '- 35 000',
                description: 'НПО Ромашка',
                time: '22:11',
                chatBubbleTime: '14:52',
              ),
              SizedBox(height: LayoutGrid.quadrupleModule),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextView(
                    'Success',
                    font: theme.fonts.headline,
                    textColorNormal: theme.colors.textSecondary.color(),
                  )
                ],
              ),
              SizedBox(height: LayoutGrid.doubleModule),
              TextOperation(
                TextOperationStyle.success,
                ChatStatus.none,
                ChatDirection.left,
                chatBubbleStatusStyle: ChatBubbleStatusStyle.initial,
                title: '+ 35 000',
                description: 'НПО Ромашка',
                time: '22:11',
                chatBubbleTime: '14:52',
              ),
              SizedBox(height: LayoutGrid.quadrupleModule),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextView(
                    'Error',
                    font: theme.fonts.headline,
                    textColorNormal: theme.colors.textSecondary.color(),
                  )
                ],
              ),
              SizedBox(height: LayoutGrid.doubleModule),
              TextOperation(
                TextOperationStyle.error,
                ChatStatus.none,
                ChatDirection.left,
                chatBubbleStatusStyle: ChatBubbleStatusStyle.initial,
                title: 'Счет заблокирован',
                description: 'Оплатите задолженность',
                time: '22:11',
                chatBubbleTime: '14:52',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
