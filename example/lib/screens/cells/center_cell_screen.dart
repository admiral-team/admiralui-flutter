import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CenterCellsScreen extends StatefulWidget {
  const CenterCellsScreen({
    super.key,
    this.appBarHidden = false,
  });

  final bool appBarHidden;

  @override
  State<CenterCellsScreen> createState() => _CenterCellsScreenState();
}

class _CenterCellsScreenState extends State<CenterCellsScreen> {
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;

    return Scaffold(
      backgroundColor: colors.backgroundBasic.color(),
      appBar: AppBar(
        leading: CupertinoButton(
          child: Icon(
            Icons.arrow_back_ios,
            color: colors.elementSecondary.color(),
          ),
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
              BaseCellWidget(
                centerCell: TitleListWidget(
                  title: 'Title', 
                  isEnabled: isEnabled),
                trailingCell: ArrowListWidget(isEnabled: isEnabled),
              ),
              BaseCellWidget(
                centerCell: SubtitleTitleListWidget(
                    title: 'Title', 
                    subtitle: 'Subtitle', 
                  isEnabled: isEnabled),
                trailingCell: ArrowListWidget(isEnabled: isEnabled),
              ),
              BaseCellWidget(
                centerCell: TitleSubtitleListWidget(
                    title: 'Title', 
                    subtitle: 'Subtitle', 
                  isEnabled: isEnabled),
                trailingCell: ArrowListWidget(isEnabled: isEnabled),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
