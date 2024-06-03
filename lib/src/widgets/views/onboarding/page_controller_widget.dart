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
    this.circularPageControlKey,
  });

  final List<PageViewItem> items;
  final PageController? pageContoller;
  final int pagePosition;
  final Function(int)? onPageChanged;
  final PageViewScheme? scheme;
  final Key? circularPageControlKey;

  @override
  State<StatefulWidget> createState() => _PageControllerWidgetState();
}

class _PageControllerWidgetState extends State<PageControllerWidget> {
  late PageViewScheme scheme;
  late PageController pageController;
  late int currentPage;
  final ValueNotifier<int> _stepNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    currentPage = widget.pagePosition;
    pageController = widget.pageContoller == null
        ? PageController(initialPage: widget.pagePosition, keepPage: false)
        : widget.pageContoller!;
    super.initState();
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
              _stepNotifier.value = value;
            }),
            itemBuilder: (BuildContext context, int pagePosition) {
              return PageViewWidget(widget.items[pagePosition]);
            },
          ),
        ),
        CircularPageControl(
          key: widget.circularPageControlKey,
          widget.items.length,
          currentPage,
          onPressed: () => setState(
            () {
              currentPage += 1;
              animateToPage();
              widget.onPageChanged?.call(currentPage);
            },
          ),
          stepNotifier: _stepNotifier,
        ),
        const SizedBox(
          height: LayoutGrid.module * 4,
        ),
      ],
    );
  }
}
