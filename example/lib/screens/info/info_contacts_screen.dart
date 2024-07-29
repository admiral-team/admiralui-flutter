import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:example/storage/app_theme_storage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../navigation/tab_navigator_info.dart';

class InfoContactsScreen extends StatefulWidget {
  const InfoContactsScreen({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorInfoRoutes route) onPush;

  @override
  State<InfoContactsScreen> createState() => _InfoContactsScreenState();
}

class ListCellModel {
  ListCellModel({
    required this.title,
    required this.description,
    this.icon,
    required this.onPressed,
  });

  final String title;
  final String description;
  final Icon? icon;
  final VoidCallback onPressed;
}

class _InfoContactsScreenState extends State<InfoContactsScreen> {
  final AppThemeStorage appThemeButtonStorage = AppThemeStorage();

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
              TextView(
                widget.title,
                font: fonts.title1,
                textColorNormal: colors.textPrimary.color(),
              ),
              const SizedBox(height: LayoutGrid.doubleModule),
              TextView(
                'Поддержка',
                font: fonts.body1,
                textColorNormal: colors.textPrimary.color(),
              ),
              ParagrapgWidget(
                title:
                    'Наш чат-бот помогает оперативно принимать  и обрабатывать все запросы. Если у вас есть  предложения или замечания, то вы можете написать ему в телеграм:',
              ),
              TextView(
                '@chatbot',
                font: fonts.title1,
                textColorNormal: colors.textPrimary.color(),
              ),
              GhostButton(
                title: '@chatbot',
                sizeType: ButtonSizeType.small,
                onPressed: () {
                  _launchUrl('https://t.me/digitalframeworks_mobilebot');
                },
              ),
              const SizedBox(height: LayoutGrid.doubleModule),
              TextView(
                'Хотите использовать дизайн-систему?',
                font: fonts.body1,
                textColorNormal: colors.textPrimary.color(),
              ),
              ParagrapgWidget(
                  title:
                      'Для того, чтобы использовать дизайн-систему  в сврем проекте, стоит написать на рабочую  почту или при желании назначить встречу:'),
              const SizedBox(height: LayoutGrid.doubleModule),
              TextView(
                'Ирина Кондрахина',
                font: fonts.body1,
                textColorNormal: colors.textPrimary.color(),
              ),
              GhostButton(
                title: '@KondrakhinaIrina',
                sizeType: ButtonSizeType.small,
                onPressed: () {
                  _launchUrl('https://t.me/KondrakhinaIrina');
                },
              ),
              const SizedBox(height: LayoutGrid.doubleModule),
              TextView(
                'Андрей Дятков',
                font: fonts.body1,
                textColorNormal: colors.textPrimary.color(),
              ),
              GhostButton(
                title: '@snowboarder',
                sizeType: ButtonSizeType.small,
                onPressed: () {
                  _launchUrl('https://t.me/snowboarder');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
