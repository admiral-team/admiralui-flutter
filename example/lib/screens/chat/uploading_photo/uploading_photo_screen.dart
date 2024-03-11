import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:example/navigation/tab_navigator_chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../storage/app_theme_storage.dart';
import './uploading_photo_section.dart';
import 'package:example/gen/assets.gen.dart';

class UploadingPhotoScreen extends StatefulWidget {
  const UploadingPhotoScreen({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorChatRoutes route) onPush;

  @override
  State<UploadingPhotoScreen> createState() => _UploadingPhotoScreenState();
}

class _UploadingPhotoScreenState extends State<UploadingPhotoScreen> {
  final AppThemeStorage appThemeButtonStorage = AppThemeStorage();
  bool isLoadingState = false;

  static UploadingPhotoItem item = UploadingPhotoItem(
    isLoading: false,
    backgroundImage: Assets.chat.photo.image(),
    time: '22:42',
    chatBubbleStatusStyle: ChatBubbleStatusStyle.light,
    chatStatus: ChatStatus.sent,
  );

  static UploadingPhotoItem itemFullProperties = UploadingPhotoItem(
    isLoading: false,
    backgroundImage: Assets.chat.photo.image(),
    time: '22:42',
    chatBubbleStatusStyle: ChatBubbleStatusStyle.light,
    chatStatus: ChatStatus.sent,
    fileName: 'Название файла длиннее чем в...',
    fileSize: '17.5 MB PDF,',
  );

  final List<UploadingPhotoSection> sections = <UploadingPhotoSection>[
    UploadingPhotoSection(
      'One File',
      itemFullProperties,
      1,
      ChatDirection.left,
    ),
    UploadingPhotoSection(
      'Two Files',
      itemFullProperties,
      2,
      ChatDirection.left,
    ),
    UploadingPhotoSection(
      'Three Files',
      item,
      3,
      ChatDirection.left,
    ),
    UploadingPhotoSection(
      'Four Files',
      item,
      4,
      ChatDirection.left,
    ),
    UploadingPhotoSection(
      'Five Files',
      item,
      5,
      ChatDirection.left,
    ),
    UploadingPhotoSection(
      'Six Files',
      item,
      6,
      ChatDirection.left,
    ),
    UploadingPhotoSection(
      'Seven Files',
      item,
      7,
      ChatDirection.left,
    ),
    UploadingPhotoSection(
      'Eight Files',
      item,
      8,
      ChatDirection.right,
    ),
  ];

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
          'Uploading Photo',
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
              <String>['Default', 'Loading'],
              onTap: (String value) {
                setState(() {
                  for (int i = 0; i < sections.length; i += 1) {
                    for (int j = 0; j < sections[i].items.length; j += 1) {
                      sections[i].items[j].isLoading =
                          isLoadingState = value == 'Loading';
                    }
                  }
                  isLoadingState = value == 'Loading';
                });
              },
            ),
            SizedBox(
              height: LayoutGrid.doubleModule,
            ),
            Expanded(
              child: ListView.builder(
                addAutomaticKeepAlives: false,
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                itemCount: sections.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return Column(
                    crossAxisAlignment:
                        sections[index].chatDirection == ChatDirection.left
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.end,
                    children: <Widget>[
                      TextView(
                        sections[index].title,
                        font: theme.fonts.headline,
                        textColorNormal: theme.colors.textSecondary.color(),
                      ),
                      SizedBox(
                        height: LayoutGrid.module,
                      ),
                      UploadingPhotoGridView(
                        items: sections[index].items,
                        chatDirection: sections[index].chatDirection,
                      ),
                      SizedBox(
                        height: LayoutGrid.doubleModule,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
