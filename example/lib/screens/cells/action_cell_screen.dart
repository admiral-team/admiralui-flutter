import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import '../../gen/assets.gen.dart';
import 'package:flutter/material.dart';

class ActionCellsScreen extends StatefulWidget {
  const ActionCellsScreen({
    super.key,
    this.appBarHidden = false,
  });

  final bool appBarHidden;

  @override
  State<ActionCellsScreen> createState() => _ActionCellsScreenState();
}

class _ActionCellsScreenState extends State<ActionCellsScreen> {
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;

    return Scaffold(
      backgroundColor: colors.backgroundBasic.color(),
      appBar: AppBar(
        title: Text(
          'Action cell',
          style: theme.fonts.subtitle2.toTextStyle(
            colors.textPrimary.color(),
          ),
        ),
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: colors.backgroundBasic.color(),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: LayoutGrid.doubleModule,
              ),
              child: StandardTabs(
                <String>['Default', 'Disabled'],
                onTap: (String value) {
                  setState(() {
                    isEnabled = value == 'Default';
                  });
                },
              ),
            ),
            SizedBox(
              height: LayoutGrid.module * 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: LayoutGrid.doubleModule,
              ),
              child: TextView(
                'Default',
                font: theme.fonts.body1,
                textColorNormal: colors.textSecondary.color(),
              ),
            ),
            Slidable(
              endActionPane: ActionPane(
                motion: ScrollMotion(),
                children: <SlidableAction>[
                  SlidableAction.withImage(
                    onPressed: null,
                    backgroundColor:
                        theme.colors.backgroundAdditionalOne.color(),
                    image: Assets.actionBar.moreOutline.image(),
                    padding: EdgeInsets.zero,
                  ),
                  SlidableAction.withImage(
                    onPressed: null,
                    backgroundColor:
                        theme.colors.backgroundAdditionalOne.color(),
                    image: Assets.actionBar.arrowUpOutline.image(),
                    padding: EdgeInsets.zero,
                  ),
                  SlidableAction.withImage(
                    onPressed: null,
                    backgroundColor:
                        theme.colors.backgroundAdditionalOne.color(),
                    image: Assets.actionBar.arrowDownOutline.image(),
                    padding: EdgeInsets.zero,
                  ),
                  SlidableAction.withImage(
                    onPressed: null,
                    backgroundColor:
                        theme.colors.backgroundAdditionalOne.color(),
                    image: Assets.actionBar.union.image(),
                    padding: EdgeInsets.zero,
                  ),
                  SlidableAction.withImage(
                    onPressed: null,
                    backgroundColor:
                        theme.colors.backgroundAdditionalOne.color(),
                    image: Assets.actionBar.closeOutline.image(),
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
              child: BaseCellWidget(
                leadingCell: Assets.card.visa.image(),
                centerCell: TitleMoreDetailTextMessageWidget(
                  title: 'Card',
                  detaile: '50 000.00 ₽',
                ),
                trailingCell: SubtitleImageCellWidget(
                  subtitle: 'Swipe',
                  imageWidget: AdmiralIcons.admiral_ic_arrow_left_outline,
                ),
                horizontalPadding: LayoutGrid.doubleModule,
              ),
            ),
            SizedBox(
              height: LayoutGrid.doubleModule,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: LayoutGrid.doubleModule,
              ),
              child: TextView(
                'Secondary',
                font: theme.fonts.body1,
                textColorNormal: colors.textSecondary.color(),
              ),
            ),
            Slidable(
              endActionPane: ActionPane(
                motion: ScrollMotion(),
                children: <SlidableAction>[
                  SlidableAction(
                    onPressed: null,
                    backgroundColor: theme.colors.elementAccent.color(),
                    foregroundColor: theme.colors.elementStaticWhite.color(),
                    icon: AdmiralIcons.admiral_ic_email_outline,
                    label: 'Text',
                    padding: EdgeInsets.zero,
                  ),
                  SlidableAction(
                    onPressed: null,
                    backgroundColor: theme.colors.elementSuccess.color(),
                    foregroundColor: theme.colors.elementStaticWhite.color(),
                    icon: AdmiralIcons.admiral_ic_edit_outline,
                    label: 'Text',
                    padding: EdgeInsets.zero,
                  ),
                  SlidableAction(
                    onPressed: null,
                    backgroundColor: theme.colors.elementAttention.color(),
                    foregroundColor: theme.colors.elementStaticWhite.color(),
                    icon: AdmiralIcons.admiral_ic_star_outline,
                    label: 'Text',
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
              child: BaseCellWidget(
                leadingCell: Assets.card.visa.image(),
                centerCell: TitleMoreDetailTextMessageWidget(
                  title: 'Card',
                  detaile: '50 000.00 ₽',
                ),
                trailingCell: SubtitleImageCellWidget(
                  subtitle: 'Swipe',
                  imageWidget: AdmiralIcons.admiral_ic_arrow_left_outline,
                ),
                horizontalPadding: LayoutGrid.doubleModule,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
