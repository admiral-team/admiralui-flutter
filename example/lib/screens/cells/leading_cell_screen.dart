import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class LeadingCellsScreen extends StatefulWidget {
  const LeadingCellsScreen({
    super.key,
    this.appBarHidden = false,
  });

  final bool appBarHidden;

  @override
  State<LeadingCellsScreen> createState() => _LeadingCellsScreenState();
}

class _LeadingCellsScreenState extends State<LeadingCellsScreen> {
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
              BaseCellWidget(
                leadingCell: Assets.card.visa.image(),
                centerCell: TitleCellWidget(
                  title: 'Card Place',
                  isEnabled: isEnabled,
                ),
                trailingCell: ArrowCellWidget(isEnabled: isEnabled),
                horizontalPadding: 0,
              ),
              BaseCellWidget(
                leadingCell: Assets.card.rnb.image(),
                centerCell: TitleCellWidget(
                  title: 'Lable Place',
                  isEnabled: isEnabled,
                ),
                trailingCell: ArrowCellWidget(isEnabled: isEnabled),
                horizontalPadding: 0,
              ),
              BaseCellWidget(
                leadingCell:
                    ImageNameCellWidget(text: 'IN', isEnabled: isEnabled),
                centerCell: TitleCellWidget(
                  title: 'Icon Name',
                  isEnabled: isEnabled,
                ),
                trailingCell: ArrowCellWidget(isEnabled: isEnabled),
                horizontalPadding: 0,
              ),
              BaseCellWidget(
                leadingCell: ImageBackgroundCellWidget(
                  icon: AdmiralIcons.admiral_ic_diamond_outline,
                  isEnabled: isEnabled,
                ),
                centerCell: TitleCellWidget(
                  title: 'Icon Place vs Background',
                  isEnabled: isEnabled,
                ),
                trailingCell: ArrowCellWidget(isEnabled: isEnabled),
                horizontalPadding: 0,
              ),
              BaseCellWidget(
                leadingCell: ImageCellWidget(
                    icon: AdmiralIcons.admiral_ic_diamond_outline,
                    isEnabled: isEnabled),
                centerCell: TitleCellWidget(
                  title: 'Icon Place',
                  isEnabled: isEnabled,
                ),
                trailingCell: ArrowCellWidget(isEnabled: isEnabled),
                horizontalPadding: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
