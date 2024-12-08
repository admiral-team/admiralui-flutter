import 'package:admiralui_flutter/theme/admiral_color.dart';
import 'package:admiralui_flutter/theme/colors_palette.dart';

// ignore_for_file: type=lint
extension ColorPaletteJson on ColorPalette {
  Map<String, dynamic> toJson() {
    return allColors().map((key, color) => MapEntry(key, color.toJson()));
  }

  static ColorPalette fromJson(Map<String, dynamic> json) {
    return ColorPalette(
      backgroundAccent: AColor.fromJson(json['backgroundAccent']),
      backgroundAccentDark: AColor.fromJson(json['backgroundAccentDark']),
      backgroundAccentPressed: AColor.fromJson(json['backgroundAccentPressed']),
      backgroundAdditionalOne: AColor.fromJson(json['backgroundAdditionalOne']),
      backgroundAdditionalOnePressed: AColor.fromJson(json['backgroundAdditionalOnePressed']),
      backgroundAdditionalTwo: AColor.fromJson(json['backgroundAdditionalTwo']),
      backgroundAdditionalTwoPressed: AColor.fromJson(json['backgroundAdditionalTwoPressed']),
      backgroundAttention: AColor.fromJson(json['backgroundAttention']),
      backgroundAttentionPressed: AColor.fromJson(json['backgroundAttentionPressed']),
      backgroundBasic: AColor.fromJson(json['backgroundBasic']),
      backgroundError: AColor.fromJson(json['backgroundError']),
      backgroundErrorPressed: AColor.fromJson(json['backgroundErrorPressed']),
      backgroundExtraSurface: AColor.fromJson(json['backgroundExtraSurface']),
      backgroundModalControl: AColor.fromJson(json['backgroundModalControl']),
      backgroundModalView: AColor.fromJson(json['backgroundModalView']),
      backgroundSecondary: AColor.fromJson(json['backgroundSecondary']),
      backgroundSelected: AColor.fromJson(json['backgroundSelected']),
      backgroundSelectedPressed: AColor.fromJson(json['backgroundSelectedPressed']),
      backgroundShadow: AColor.fromJson(json['backgroundShadow']),
      backgroundSuccess: AColor.fromJson(json['backgroundSuccess']),
      backgroundSuccessPressed: AColor.fromJson(json['backgroundSuccessPressed']),
      elementAccent: AColor.fromJson(json['elementAccent']),
      elementAccentAdditional: AColor.fromJson(json['elementAccentAdditional']),
      elementAccentPressed: AColor.fromJson(json['elementAccentPressed']),
      elementAdditional: AColor.fromJson(json['elementAdditional']),
      elementAttention: AColor.fromJson(json['elementAttention']),
      elementAttentionPressed: AColor.fromJson(json['elementAttentionPressed']),
      elementBarDivider: AColor.fromJson(json['elementBarDivider']),
      elementContrast: AColor.fromJson(json['elementContrast']),
      elementError: AColor.fromJson(json['elementError']),
      elementErrorPressed: AColor.fromJson(json['elementErrorPressed']),
      elementExtra: AColor.fromJson(json['elementExtra']),
      elementPrimary: AColor.fromJson(json['elementPrimary']),
      elementSecondary: AColor.fromJson(json['elementSecondary']),
      elementStaticWhite: AColor.fromJson(json['elementStaticWhite']),
      elementSuccess: AColor.fromJson(json['elementSuccess']),
      elementSuccessPressed: AColor.fromJson(json['elementSuccessPressed']),
      specialExtra01: AColor.fromJson(json['specialExtra01']),
      specialExtra02: AColor.fromJson(json['specialExtra02']),
      specialExtra03: AColor.fromJson(json['specialExtra03']),
      specialExtra04: AColor.fromJson(json['specialExtra04']),
      specialExtra05: AColor.fromJson(json['specialExtra05']),
      specialExtra06: AColor.fromJson(json['specialExtra06']),
      specialExtra07: AColor.fromJson(json['specialExtra07']),
      specialExtra08: AColor.fromJson(json['specialExtra08']),
      specialExtra09: AColor.fromJson(json['specialExtra09']),
      specialExtra10: AColor.fromJson(json['specialExtra10']),
      specialExtra11: AColor.fromJson(json['specialExtra11']),
      specialExtra12: AColor.fromJson(json['specialExtra12']),
      specialExtra13: AColor.fromJson(json['specialExtra13']),
      specialExtra14: AColor.fromJson(json['specialExtra14']),
      specialExtra15: AColor.fromJson(json['specialExtra15']),
      specialExtra16: AColor.fromJson(json['specialExtra16']),
      specialExtra17: AColor.fromJson(json['specialExtra17']),
      specialExtra18: AColor.fromJson(json['specialExtra18']),
      specialExtra19: AColor.fromJson(json['specialExtra19']),
      specialExtra20: AColor.fromJson(json['specialExtra20']),
      specialExtra21: AColor.fromJson(json['specialExtra21']),
      specialExtra22: AColor.fromJson(json['specialExtra22']),
      specialExtra23: AColor.fromJson(json['specialExtra23']),
      specialExtra24: AColor.fromJson(json['specialExtra24']),
      specialExtra25: AColor.fromJson(json['specialExtra25']),
      specialExtra26: AColor.fromJson(json['specialExtra26']),
      specialExtra27: AColor.fromJson(json['specialExtra27']),
      textAccent: AColor.fromJson(json['textAccent']),
      textAccentAdditional: AColor.fromJson(json['textAccentAdditional']),
      textAccentPressed: AColor.fromJson(json['textAccentPressed']),
      textAdditional: AColor.fromJson(json['textAdditional']),
      textAttention: AColor.fromJson(json['textAttention']),
      textAttentionPressed: AColor.fromJson(json['textAttentionPressed']),
      textContrast: AColor.fromJson(json['textContrast']),
      textError: AColor.fromJson(json['textError']),
      textErrorPressed: AColor.fromJson(json['textErrorPressed']),
      textMask: AColor.fromJson(json['textMask']),
      textPrimary: AColor.fromJson(json['textPrimary']),
      textSecondary: AColor.fromJson(json['textSecondary']),
      textStaticWhite: AColor.fromJson(json['textStaticWhite']),
      textSuccess: AColor.fromJson(json['textSuccess']),
      textSuccessPressed: AColor.fromJson(json['textSuccessPressed']),
    );
  }
}