import 'dart:async';
import 'package:flutter/widgets.dart';

const int kMaxValue = 2000000000;
const int kMiddleValue = 1000000000;

class CalendartPageController {
  CalendartPageController(
    // ignore: avoid_positional_boolean_parameters
    this.keepPage,
    this.initialPage,
    this.viewportFraction,
  )   : realIndex = initialPage + kMiddleValue,
        pageController = PageController(
          initialPage: initialPage + kMiddleValue,
          keepPage: keepPage,
          viewportFraction: viewportFraction,
        );

  late int itemCount;
  late int realIndex;
  late double viewportFraction;
  late int initialPage;
  late bool keepPage;
  final PageController pageController;

  int get page {
    return calculateIndex(realIndex);
  }

  int calculateIndex(int realIndex) {
    if (itemCount == 0) return 0;
    int index = (realIndex - kMiddleValue) % itemCount;
    if (index < 0) {
      index += itemCount;
    }
    return index;
  }

  Future<void> animateToPage(
    int page,
    Duration duration,
    Curve curve,
  ) {
    final int offset = page - this.page;

    if (offset == 0) {
      return Future<void>.value();
    }

    final int destPage = offset + realIndex;

    return pageController.animateToPage(
      destPage,
      duration: duration,
      curve: curve,
    );
  }

  void jumpToPage(int value) {
    pageController.jumpToPage(value + kMiddleValue);
  }

  void dispose() {
    pageController.dispose();
  }
}
