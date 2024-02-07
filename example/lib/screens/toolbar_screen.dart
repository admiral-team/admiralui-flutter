import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class ToolbarScreen extends StatefulWidget {
  const ToolbarScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<ToolbarScreen> createState() => _ToolbarScreenState();
}

class _ToolbarScreenState extends State<ToolbarScreen> {
  late List<ToolbarItem> items;
  final List<ToolbarItem> constItems = <ToolbarItem>[
    ToolbarItem(title: 'Оплатить', image: AdmiralIcons.admiral_ic_card_outline),
    ToolbarItem(
        title: 'Пополнить', image: AdmiralIcons.admiral_ic_get_cash_outline),
    ToolbarItem(
        title: 'Подробнее', image: AdmiralIcons.admiral_ic_info_outline),
    ToolbarItem(
        title: 'Настройки', image: AdmiralIcons.admiral_ic_settings_outline),
  ];

  @override
  void initState() {
    super.initState();
    setItems(4);
  }

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
        centerTitle: true,
        backgroundColor: colors.backgroundBasic.color(),
        title: Text(
          widget.title,
          style: fonts.subtitle2.toTextStyle(
            colors.textPrimary.color(),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(
          LayoutGrid.doubleModule,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            InputNumber(
                title: 'Количество пунктов',
                onChangedValue: _ChangeInputControl,
                minimumValue: 1,
                maximumValue: 4,
                numberValue: 4,
                style: InputNumberButtonStyle.normal),
            SizedBox(height: LayoutGrid.doubleModule),
            ToolbarWidget(items: items)
          ],
        ),
      ),
    );
  }

  void _ChangeInputControl(double value) {
    setItems(value.toInt());
  }

  void setItems(int count) {
    List<ToolbarItem> arrayItems = <ToolbarItem>[];
    for (int i = 0; i < count; i++) {
      arrayItems.add(constItems[i]);
    }
    items = arrayItems;
    setState(() {});
  }
}
