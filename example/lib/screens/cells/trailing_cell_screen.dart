import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class TrailingCellsScreen extends StatefulWidget {
  const TrailingCellsScreen({
    super.key,
    this.appBarHidden = false,
  });

  final bool appBarHidden;

  @override
  State<TrailingCellsScreen> createState() => _TrailingCellsScreenState();
}

class _TrailingCellsScreenState extends State<TrailingCellsScreen> {
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
                centerCell: TitleCellWidget(
                  title: 'Title',
                  isEnabled: isEnabled,
                ),
                trailingCell: ArrowCellWidget(isEnabled: isEnabled),
                horizontalPadding: 0,
              ),
              BaseCellWidget(
                centerCell: TitleCellWidget(
                  title: 'Title',
                  isEnabled: isEnabled,
                ),
                trailingCell: RadioButton(
                  title: '',
                  groupValue: '',
                  isEnabled: isEnabled,
                ),
                horizontalPadding: 0,
              ),
              BaseCellWidget(
                centerCell: TitleCellWidget(
                  title: 'Title',
                  isEnabled: isEnabled,
                ),
                trailingCell: CheckBoxTitle(
                  title: '',
                  style: CheckboxStyle.normal,
                  isEnabled: isEnabled,
                ),
                horizontalPadding: 0,
              ),
              BaseCellWidget(
                centerCell: TitleCellWidget(
                  title: 'Title',
                  isEnabled: isEnabled,
                ),
                trailingCell: Switcher(
                  isEnabled: isEnabled,
                ),
                horizontalPadding: 0,
              ),
              BaseCellWidget(
                centerCell: TitleCellWidget(
                  title: 'Title',
                  isEnabled: isEnabled,
                ),
                trailingCell: Assets.card.rnb.image(),
                horizontalPadding: 0,
              ),
              BaseCellWidget(
                centerCell: TitleCellWidget(
                  title: 'Title',
                  isEnabled: isEnabled,
                ),
                trailingCell: Assets.card.visa.image(),
                horizontalPadding: 0,
              ),
              BaseCellWidget(
                centerCell: TitleCellWidget(
                  title: 'Title',
                  isEnabled: isEnabled,
                ),
                trailingCell: DatePercentCellWidget(
                  dateText: 'Date',
                  percentText: 'Percent',
                  isEnabled: isEnabled,
                ),
                horizontalPadding: 0,
              ),
              BaseCellWidget(
                centerCell: TitleCellWidget(
                  title: 'Title',
                  isEnabled: isEnabled,
                ),
                trailingCell: ImageSubtitleCellWidget(
                  subtitle: 'Date',
                  imageWidget: Assets.card.mir.image(),
                  isEnabled: isEnabled,
                ),
                horizontalPadding: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
