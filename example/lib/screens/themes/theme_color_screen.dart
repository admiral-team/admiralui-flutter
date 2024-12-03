import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:admiralui_flutter/theme/admiral_color.dart';
import 'package:admiralui_flutter/theme/colors_palette_json.dart';
import 'package:example/screens/themes/color_picker_ring.dart';
import 'package:example/storage/app_theme_storage.dart';
import 'package:flutter/material.dart';

class ThemeColorInitModel {
  const ThemeColorInitModel(this.color, this.theme, this.nameColor);

  final AColor color;
  final AppTheme theme;
  final String nameColor;
}

class ThemeColorScreen extends StatefulWidget {
  const ThemeColorScreen({
    super.key,
  });

  @override
  State<ThemeColorScreen> createState() => _ThemeColorScreenState();
}

class _ThemeColorScreenState extends State<ThemeColorScreen> {
  final AppThemeStorage appThemeStorage = AppThemeStorage();
  TextEditingController textController = TextEditingController();
  AppTheme? choseTheme;
  Color? _selectedColor;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    final ThemeColorInitModel model =
        ModalRoute.of(context)!.settings.arguments as ThemeColorInitModel;
    final Color selectedColor = _selectedColor ?? model.color.color();
    textController.text = colorToHexString(selectedColor);

    return Scaffold(
      backgroundColor: colors.backgroundBasic.color(),
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          model.nameColor,
          style: fonts.subtitle2.toTextStyle(
            colors.textPrimary.color(),
          ),
        ),
        bottomOpacity: 0.0,
        backgroundColor: colors.backgroundBasic.color(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(LayoutGrid.doubleModule),
            child: TextFieldWidget(
              textController,
              labelText: 'Hex Color',
              placeHolderText: 'Hex Color',
              onChanged: (String value) {
                if (_isValidHex(value)) {
                  final Color newColor = _hexToColor(value);
                  setState(() {
                    _selectedColor = newColor;
                  });
                }
              },
            ),
          ),
          SizedBox(height: LayoutGrid.doubleModule * 6),
          Center(
            child: ColorPickerHueRing(
              color: selectedColor,
              onColorChanged: _onColorPickerChanged,
            ),
          ),
          const Spacer(),
          if (model.theme != darkTheme && model.theme != lightTheme)
          Padding(
            padding: const EdgeInsets.all(LayoutGrid.doubleModule),
            child: PrimaryButton(
              title: 'Сохранить',
              sizeType: ButtonSizeType.big,
              onPressed: () {
                  final Map<String, dynamic> colorJSON = 
                  model.theme.colors.toJson();
                  colorJSON[model.nameColor] = 
                  AColor(selectedColor.value).toJson();
                  final ColorPalette updatedColors = 
                  ColorPaletteJson.fromJson(colorJSON);

                  final AppTheme updatedTheme = AppTheme(
                    name: model.theme.name,
                    colors: updatedColors,
                    fonts: model.theme.fonts,
                  );

                  // Сохраняем новую тему
                  appThemeStorage.saveTheme(updatedTheme);

                  Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onColorPickerChanged(Color color) {
    setState(() {
      _selectedColor = color;
    });
  }

  bool _isValidHex(String value) {
    final RegExp hexRegex = RegExp(r'^#([A-Fa-f0-9]{6})$');
    return hexRegex.hasMatch(value);
  }

  Color _hexToColor(String hex) {
    return Color(int.parse(hex.substring(1), radix: 16) + 0xFF000000);
  }
}

String colorToHexString(Color color) {
  return '#${color.value.toRadixString(16).substring(2, 8).toUpperCase()}';
}
