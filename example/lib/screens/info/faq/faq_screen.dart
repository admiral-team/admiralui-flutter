// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:example/screens/info/faq/faq_cell.dart';
import 'package:example/screens/info/faq/faq_item.dart';
import 'package:example/storage/app_theme_storage.dart';
import 'package:flutter/material.dart';

import '../../../navigation/tab_navigator_info.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorInfoRoutes route) onPush;

  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(LayoutGrid.doubleModule),
              child: TextView(
                widget.title,
                font: fonts.title1,
                textColorNormal: colors.textPrimary.color(),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: faqItems.map((FAQItem item) {
                return FAQCell(item: item);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  final List<FAQItem> faqItems = <FAQItem>[
    FAQItem(
      title: 'Зачем нужна дизайн-система?',
      subtitle:
          'Дизайн-система — это набор стилей и компонентов, который упрощает создание, тестирование, визуальное и техническое обновление продуктов, а также обеспечивает единообразие и узнаваемость их интерфейсов.',
    ),
    FAQItem(
      title: 'Как подключить дизайн-систему?',
      subtitle:
          'Для подключения дизайн-системы стоит обратиться к любому члену команды «Цифровые фреймворки».',
    ),
    FAQItem(
      title: 'Как использовать дизайн-систему?',
      subtitle:
          'Для этого нужно подключить к рабочему файлу UI kit (iOS/Android) и дополнительно — к UI kit color. Далее в правой панели появятся стили, а в библиотеке — все компоненты.',
    ),
    FAQItem(
      title: 'Это только для новых продуктов?',
      subtitle:
          'Дизайн-систему можно подключить к проекту на любом этапе его разработки, наша команда поможет вам запланировать переход по срокам дизайна макетов и разработке.',
    ),
  ];
}
