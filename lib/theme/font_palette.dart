import 'package:admiralui_flutter/gen/fonts.gen.dart';
import 'package:admiralui_flutter/theme/admiral_font.dart';
import 'package:flutter/widgets.dart';

/*
 * AdmiralUI
 * Generated by Golang Figma Plugin.
 */
// ignore_for_file: type=lint
class FontPalette {
  final AFont largeTitle1;
  final AFont caption2;
  final AFont body1;
  final AFont subtitle1;
  final AFont subhead1;
  final AFont headline;
  final AFont subtitle2;
  final AFont subtitle3;
  final AFont subhead4;
  final AFont title2;
  final AFont subhead2;
  final AFont subhead3;
  final AFont body2;
  final AFont largeTitle2;
  final AFont title1;
  final AFont caption1;
  final AFont numberTitle;

  const FontPalette({
    required this.largeTitle1,
    required this.caption2,
    required this.body1,
    required this.subtitle1,
    required this.subhead1,
    required this.headline,
    required this.subtitle2,
    required this.subtitle3,
    required this.subhead4,
    required this.title2,
    required this.subhead2,
    required this.subhead3,
    required this.body2,
    required this.largeTitle2,
    required this.title1,
    required this.caption1,
    required this.numberTitle,
  });

  Map<String, AFont> allFonts() {
    return {
      'largeTitle1': largeTitle1,
      'caption2': caption2,
      'body1': body1,
      'subtitle1': subtitle1,
      'subhead1': subhead1,
      'headline': headline,
      'subtitle2': subtitle2,
      'subtitle3': subtitle3,
      'subhead4': subhead4,
      'title2': title2,
      'subhead2': subhead2,
      'subhead3': subhead3,
      'body2': body2,
      'largeTitle2': largeTitle2,
      'title1': title1,
      'caption1': caption1,
      'numberTitle': numberTitle,
    };
  }
}

const defaultFontPalette = FontPalette(
  largeTitle1: AFont(
    fontSize: 32,
    fontFamily: FontFamily.sFProDisplay,
    fontWeight: FontWeight.w700,
  ),
  caption2: AFont(
    fontSize: 10,
    fontFamily: FontFamily.sFProText,
    fontWeight: FontWeight.w500,
  ),
  body1: AFont(
    fontSize: 16,
    fontFamily: FontFamily.sFProDisplay,
    fontWeight: FontWeight.w500,
  ),
  subtitle1: AFont(
    fontSize: 18,
    fontFamily: FontFamily.sFProDisplay,
    fontWeight: FontWeight.w700,
  ),
  subhead1: AFont(
    fontSize: 14,
    fontFamily: FontFamily.sFProDisplay,
    fontWeight: FontWeight.w700,
  ),
  headline: AFont(
    fontSize: 16,
    fontFamily: FontFamily.sFProDisplay,
    fontWeight: FontWeight.w600,
  ),
  subtitle2: AFont(
    fontSize: 18,
    fontFamily: FontFamily.sFProDisplay,
    fontWeight: FontWeight.w600,
  ),
  subtitle3: AFont(
    fontSize: 18,
    fontFamily: FontFamily.sFProDisplay,
    fontWeight: FontWeight.w400,
  ),
  subhead4: AFont(
    fontSize: 14,
    fontFamily: FontFamily.sFProDisplay,
    fontWeight: FontWeight.w400,
  ),
  title2: AFont(
    fontSize: 22,
    fontFamily: FontFamily.sFProDisplay,
    fontWeight: FontWeight.w500,
  ),
  subhead2: AFont(
    fontSize: 14,
    fontFamily: FontFamily.sFProDisplay,
    fontWeight: FontWeight.w600,
  ),
  subhead3: AFont(
    fontSize: 14,
    fontFamily: FontFamily.sFProDisplay,
    fontWeight: FontWeight.w500,
  ),
  body2: AFont(
    fontSize: 16,
    fontFamily: FontFamily.sFProDisplay,
    fontWeight: FontWeight.w400,
  ),
  largeTitle2: AFont(
    fontSize: 28,
    fontFamily: FontFamily.sFProDisplay,
    fontWeight: FontWeight.w700,
  ),
  title1: AFont(
    fontSize: 22,
    fontFamily: FontFamily.sFProDisplay,
    fontWeight: FontWeight.w700,
  ),
  caption1: AFont(
    fontSize: 12,
    fontFamily: FontFamily.sFProText,
    fontWeight: FontWeight.w500,
  ),
  numberTitle: AFont(
    fontSize: 36,
    fontFamily: FontFamily.sFProDisplay,
    fontWeight: FontWeight.w400,
  ),
);
