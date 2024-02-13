import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class ButtonsGhostScreen extends StatefulWidget {
  const ButtonsGhostScreen({
    super.key,
    this.appBarHidden = false,
  });

  final bool appBarHidden;

  @override
  State<ButtonsGhostScreen> createState() => _ButtonsGhostScreenState();
}

class _ButtonsGhostScreenState extends State<ButtonsGhostScreen> {
  bool isEnabled = true;

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
        title: Text(
          'Ghost buttons',
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
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              StandardTabs(
                <String>['Default', 'Disabled'],
                onTap: (String value) {
                  setState(() {
                    isEnabled = value == 'Default';
                  });
                },
              ),
              SizedBox(
                height: LayoutGrid.module * 5,
              ),
              TwoTitleGhostButton(
                isEnable: isEnabled,
                leftTitle: 'Выбрать все карты',
                rightTitle: 'Готово',
              ),
              SizedBox(
                height: LayoutGrid.halfModule * 5,
              ),
              GhostButton(
                isEnable: isEnabled,
                iconData: AdmiralIcons.admiral_ic_heart_outline,
                title: 'Big Button',
              ),
              SizedBox(
                height: LayoutGrid.halfModule * 5,
              ),
              GhostButton(
                isEnable: isEnabled,
                iconData: AdmiralIcons.admiral_ic_maintenance_outline,
                iconPosition: IconPosition.right,
                title: 'Big Button',
              ),
              SizedBox(
                height: LayoutGrid.halfModule * 5,
              ),
              GhostButton(
                isEnable: isEnabled,
                title: 'Big Button',
              ),
              SizedBox(
                height: LayoutGrid.halfModule * 5,
              ),
              Center(
                child: GhostButton(
                  isEnable: isEnabled,
                  title: 'Medium Button',
                  sizeType: ButtonSizeType.medium,
                  iconData: AdmiralIcons.admiral_ic_heart_outline,
                  iconPosition: IconPosition.left,
                ),
              ),
              SizedBox(
                height: LayoutGrid.halfModule * 5,
              ),
              Center(
                child: GhostButton(
                  isEnable: isEnabled,
                  title: 'Medium Button',
                  sizeType: ButtonSizeType.medium,
                  iconData: AdmiralIcons.admiral_ic_maintenance_outline,
                ),
              ),
              SizedBox(
                height: LayoutGrid.halfModule * 5,
              ),
              Center(
                child: GhostButton(
                  isEnable: isEnabled,
                  title: 'Medium Button',
                  sizeType: ButtonSizeType.medium,
                ),
              ),
              SizedBox(
                height: LayoutGrid.halfModule * 5,
              ),
              GhostButton(
                isEnable: isEnabled,
                title: 'Small Button',
                sizeType: ButtonSizeType.small,
                iconData: AdmiralIcons.admiral_ic_heart_outline,
                iconPosition: IconPosition.left,
              ),
              SizedBox(
                height: LayoutGrid.halfModule * 5,
              ),
              GhostButton(
                isEnable: isEnabled,
                title: 'Small Button',
                sizeType: ButtonSizeType.small,
                iconData: AdmiralIcons.admiral_ic_maintenance_solid,
                iconPosition: IconPosition.right,
              ),
              SizedBox(
                height: LayoutGrid.halfModule * 5,
              ),
              GhostButton(
                isEnable: isEnabled,
                title: 'Small Button',
                sizeType: ButtonSizeType.small,
                iconPosition: IconPosition.left,
              ),
              SizedBox(
                height: LayoutGrid.halfModule * 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
