import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class OnboardingViewScreen extends StatefulWidget {
  const OnboardingViewScreen({
    super.key,
    this.isInitial = false,
    this.onPush = null,
    required this.title,
  });

  final String title;
  final bool isInitial;
  final Function()? onPush;

  @override
  State<OnboardingViewScreen> createState() => _OnboardingViewScreenState();
}

class _OnboardingViewScreenState extends State<OnboardingViewScreen> {
  int step = 0;

  List<PageViewItem> items = <PageViewItem>[
    PageViewItem('assets/onboarding/one.png',
        title: 'Добро пожаловать!',
        subtitle:
            // ignore: lines_longer_than_80_chars
            'Приветствуем вас в нашем мобильном приложении.  Это приложение служит удобным инструментом для всех участников команд!'),
    PageViewItem('assets/onboarding/two.png',
        title: 'Что внутри приложения',
        subtitle:
            // ignore: lines_longer_than_80_chars
            'В приложении есть набор всех стилей и компонентов UI kit 3.0 Mobile, который вы сможете протестировать в реальном времени.'),
    PageViewItem('assets/onboarding/three.png',
        title: 'Ждем ваших 👍🏽',
        subtitle:
            // ignore: lines_longer_than_80_chars
            'Мы рады любому фидбеку и активно ведем непрерывную работу над дизайн-системой. Все наши контакты находятся в разделе “Инфо”.'),
  ];

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    return Scaffold(
      backgroundColor: colors.backgroundBasic.color(),
      appBar: AppBar(
        leading: !widget.isInitial
            ? BackButton(
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
        actions: widget.isInitial
            ? <Widget>[
                GhostButton(
                  title: 'Пропустить',
                  sizeType: ButtonSizeType.small,
                  onPressed: () => widget.onPush?.call(),
                )
              ]
            : null,
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
        child: PageControllerWidget(
          items,
          pagePosition: step,
          onPageChanged: (int value) {
            if (widget.isInitial && value >= items.length) {
              widget.onPush?.call();
            }
          },
        ),
      ),
    );
  }
}
