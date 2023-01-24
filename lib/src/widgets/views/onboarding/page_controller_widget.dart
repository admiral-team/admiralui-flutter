import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class PageControllerWidget extends StatefulWidget {
  const PageControllerWidget(
    this.items, {
    this.pageContoller,
    this.pagePosition = 0,
    this.onPageChanged,
    this.scheme,
  });

  final List<PageViewItem> items;
  final PageController? pageContoller;
  final int pagePosition;
  final Function(int)? onPageChanged;
  final PageViewScheme? scheme;

  @override
  State<StatefulWidget> createState() => _PageControllerWidgetState();
}

class _PageControllerWidgetState extends State<PageControllerWidget>
    with SingleTickerProviderStateMixin {
  late PageViewScheme scheme;
  late PageController pageController;
  late int currentPage;

  late AnimationController animationController;
  late Tween<double> _tween;
  late double stepLength;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    currentPage = widget.pagePosition;
    stepLength = 1.0 / widget.items.length.toDouble();
    _tween = Tween<double>(begin: 0.0, end: stepLength);
    pageController = widget.pageContoller == null
        ? PageController(initialPage: widget.pagePosition, keepPage: false)
        : widget.pageContoller!;
    animateButton();
  }

  void animateButton() {
    _tween.begin = _tween.end;
    animationController.reset();
    _tween.end =
        currentPage == 0 ? stepLength : stepLength + (stepLength * currentPage);
    animationController.forward();
  }

  void animateToPage() {
    if (pageController.hasClients && currentPage < widget.items.length) {
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? PageViewScheme(theme: theme);
    return Column(
      children: <Widget>[
        Flexible(
          child: PageView.builder(
            controller: pageController,
            itemCount: widget.items.length,
            onPageChanged: (int value) => setState(() {
              currentPage = value;
              animateButton();
            }),
            itemBuilder: (BuildContext context, int pagePosition) {
              return PageViewWidget(widget.items[pagePosition]);
            },
          ),
        ),
        CircularPageControl(
          widget.items.length,
          currentPage,
          animatedController: animationController,
          tween: _tween,
          onPressed: () => setState(() {
            currentPage += 1;
            animateToPage();
          }),
        ),
        const SizedBox(
          height: LayoutGrid.module * 4,
        ),
      ],
    );
  }
}
