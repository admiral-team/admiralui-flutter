import 'package:admiralui_flutter/theme/admiral_font.dart';
import 'package:admiralui_flutter/theme/font_palette.dart';

extension FontPaletteJson on FontPalette {
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'largeTitle1': largeTitle1.toJson(),
      'caption2': caption2.toJson(),
      'body1': body1.toJson(),
      'subtitle1': subtitle1.toJson(),
      'subhead1': subhead1.toJson(),
      'headline': headline.toJson(),
      'subtitle2': subtitle2.toJson(),
      'subtitle3': subtitle3.toJson(),
      'subhead4': subhead4.toJson(),
      'title2': title2.toJson(),
      'subhead2': subhead2.toJson(),
      'subhead3': subhead3.toJson(),
      'body2': body2.toJson(),
      'largeTitle2': largeTitle2.toJson(),
      'title1': title1.toJson(),
      'caption1': caption1.toJson(),
      'numberTitle': numberTitle.toJson(),
    };
  }

  static FontPalette fromJson(Map<String, dynamic> json) {
    return FontPalette(
      largeTitle1: AFont.fromJson(json['largeTitle1']),
      caption2: AFont.fromJson(json['caption2']),
      body1: AFont.fromJson(json['body1']),
      subtitle1: AFont.fromJson(json['subtitle1']),
      subhead1: AFont.fromJson(json['subhead1']),
      headline: AFont.fromJson(json['headline']),
      subtitle2: AFont.fromJson(json['subtitle2']),
      subtitle3: AFont.fromJson(json['subtitle3']),
      subhead4: AFont.fromJson(json['subhead4']),
      title2: AFont.fromJson(json['title2']),
      subhead2: AFont.fromJson(json['subhead2']),
      subhead3: AFont.fromJson(json['subhead3']),
      body2: AFont.fromJson(json['body2']),
      largeTitle2: AFont.fromJson(json['largeTitle2']),
      title1: AFont.fromJson(json['title1']),
      caption1: AFont.fromJson(json['caption1']),
      numberTitle: AFont.fromJson(json['numberTitle']),
    );
  }
}
