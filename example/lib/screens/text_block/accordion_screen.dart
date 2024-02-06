import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class AccordionScreen extends StatefulWidget {
  const AccordionScreen({
    super.key,
    this.appBarHidden = false,
  });

  final bool appBarHidden;

  @override
  State<AccordionScreen> createState() => _AccordionScreenState();
}

class _AccordionScreenState extends State<AccordionScreen> {
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;

    return Scaffold(
      backgroundColor: colors.backgroundBasic.color(),
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
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
              TitleButtonDropDownWidget(
                title: 'Title',
                buttonTitle: 'Button',
                isEnable: isEnabled,
              ),
              ButtonDropDownWidget(
                buttonTitle: 'Button',
                isEnable: isEnabled,
              )
            ],
          ),
        ),
      ),
    );
  }
}
