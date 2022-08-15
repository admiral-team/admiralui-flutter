import 'package:admiralui_flutter/gen/fonts.gen.dart';
import 'package:admiralui_flutter/theme/font_wrapper.dart';
import 'package:flutter/widgets.dart';

class FontPalette {
  final FontWrapper subhead3;
  final FontWrapper largeTitle2;
  final FontWrapper subtitle2;
  final FontWrapper body1;
  final FontWrapper body2;
  final FontWrapper subhead1;
  final FontWrapper subtitle1;
  final FontWrapper headline;
  final FontWrapper subtitle3;
  final FontWrapper largeTitle1;
  final FontWrapper title2;
  final FontWrapper subhead2;
  final FontWrapper caption1;
  final FontWrapper title1;
  final FontWrapper overline;
  final FontWrapper caption2;

  const FontPalette({
    required this.subhead3,
    required this.largeTitle2,
    required this.subtitle2,
    required this.body1,
    required this.body2,
    required this.subhead1,
    required this.subtitle1,
    required this.headline,
    required this.subtitle3,
    required this.largeTitle1,
    required this.title2,
    required this.subhead2,
    required this.caption1,
    required this.title1,
    required this.overline,
    required this.caption2,
  });
}

const defaultFontPalette = FontPalette(
  subhead3: FontWrapper(
    fontSize: 14,
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w400,
  ),
  largeTitle2: FontWrapper(
    fontSize: 28,
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w700,
  ),
  subtitle2: FontWrapper(
    fontSize: 18,
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w500,
  ),
  body1: FontWrapper(
    fontSize: 16,
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w500,
  ),
  body2: FontWrapper(
    fontSize: 16,
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w400,
  ),
  subhead1: FontWrapper(
    fontSize: 14,
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w700,
  ),
  subtitle1: FontWrapper(
    fontSize: 18,
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w700,
  ),
  headline: FontWrapper(
    fontSize: 16,
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w500,
  ),
  subtitle3: FontWrapper(
    fontSize: 18,
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w400,
  ),
  largeTitle1: FontWrapper(
    fontSize: 32,
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w700,
  ),
  title2: FontWrapper(
    fontSize: 22,
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w500,
  ),
  subhead2: FontWrapper(
    fontSize: 14,
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w500,
  ),
  caption1: FontWrapper(
    fontSize: 12,
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w500,
  ),
  title1: FontWrapper(
    fontSize: 22,
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w700,
  ),
  overline: FontWrapper(
    fontSize: 10,
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w500,
  ),
  caption2: FontWrapper(
    fontSize: 10,
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w500,
  ),
);
