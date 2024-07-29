import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

import '../../navigation/tab_navigator_chat.dart';
import '../../storage/app_theme_storage.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorChatRoutes route) onPush;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class ListCellModel {
  ListCellModel({
    required this.title,
    required this.description,
    required this.onPressed,
  });

  final String title;
  final String description;
  final VoidCallback onPressed;
}

class _ChatScreenState extends State<ChatScreen> {

  final AppThemeStorage appThemeButtonStorage = AppThemeStorage();

  @override
  void initState() {
    super.initState();
    appThemeButtonStorage.setThemeButtonHidden(false);
  }

  @override
  void dispose() {
    super.dispose();
    appThemeButtonStorage.setThemeButtonHidden(true);
  }

  @override
  Widget build(BuildContext context) {
    final List<ListCellModel> items = <ListCellModel>[
      ListCellModel(
        title: 'Input',
        description: '',
        onPressed: () => widget.onPush.call(TabNavigatorChatRoutes.input),
      ),
      ListCellModel(
        title: 'Text Message',
        description: '',
        onPressed: () =>
            widget.onPush.call(TabNavigatorChatRoutes.textOperations),
      ),
      ListCellModel(
        title: 'Text Operation',
        description: '',
        onPressed: () =>
            widget.onPush.call(TabNavigatorChatRoutes.textOperations),
      ),
      ListCellModel(
        title: 'Uploading Photo',
        description: '',
        onPressed: () =>
            widget.onPush.call(TabNavigatorChatRoutes.uploadingPhoto),
      ),
      ListCellModel(
        title: 'Uploading File',
        description: '',
        onPressed: () =>
            widget.onPush.call(TabNavigatorChatRoutes.textOperations),
      ),
    ];

    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: LayoutGrid.module * 10,
        backgroundColor: colors.backgroundBasic.color(),
        title: Text(
          widget.title,
          style: fonts.largeTitle1.toTextStyle(
            colors.textPrimary.color(),
          ),
        ),
      ),
      body: Container(
        color: colors.backgroundBasic.color(),
        child: Material(
          color: colors.backgroundBasic.color(),
          child: ListView.separated(
            addAutomaticKeepAlives: false,
            addRepaintBoundaries: false,
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            itemCount: items.length,
            itemBuilder: (BuildContext ctx, int index) {
              return _buildView(
                ctx,
                index,
                colors,
                fonts,
                items,
              );
            },
            separatorBuilder: (
              BuildContext ctx,
              int index,
            ) {
              return Container();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildView(
    BuildContext ctx,
    int index,
    ColorPalette colors,
    FontPalette fonts,
    List<ListCellModel> items,
  ) {
    final ListCellModel? item = index == items.length ? null : items[index];

    if (item is ListCellModel) {
      return BaseCellWidget(
        centerCell: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              item.title,
              style: fonts.body1.toTextStyle(
                colors.textPrimary.color(),
              ),
            ),
          ],
        ),
        trailingCell: Icon(
          AdmiralIcons.admiral_ic_chevron_right_outline,
          color: colors.elementSecondary.color(),
        ),
        onPressed: item.onPressed,
      );
    }

    return Container();
  }
}
