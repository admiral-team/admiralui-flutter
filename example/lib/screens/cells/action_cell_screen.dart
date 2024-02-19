import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
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
              TextView(
                'Default',
                font: theme.fonts.body1,
                textColorNormal: colors.textSecondary.color(),
              ),
              Slidable(
                endActionPane: const ActionPane(
                  motion: ScrollMotion(),
                  children: <SlidableAction>[
                    SlidableAction(
                      onPressed: null,
                      backgroundColor: Color(0xFF3A83F1),
                      foregroundColor: Colors.white,
                      icon: AdmiralIcons.admiral_ic_email_outline,
                      label: 'Text',
                      padding: EdgeInsets.zero,
                    ),
                    SlidableAction(
                      onPressed: null,
                      backgroundColor: Color(0xFF44BF78),
                      foregroundColor: Colors.white,
                      icon: AdmiralIcons.admiral_ic_edit_outline,
                      label: 'Text',
                      padding: EdgeInsets.zero,
                    ),
                    SlidableAction(
                      onPressed: null,
                      backgroundColor: Color(0xFFFB9130),
                      foregroundColor: Colors.white,
                      icon: AdmiralIcons.admiral_ic_star_outline,
                      label: 'Text',
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
                child: BaseCellWidget(
                  centerCell:
                      TitleCellWidget(title: 'Title', isEnabled: isEnabled),
                  trailingCell: ArrowCellWidget(isEnabled: isEnabled),
                  horizontalPadding: 0,
                ),
              ),
              SizedBox(
                height: LayoutGrid.doubleModule,
              ),
              TextView(
                'Secondary',
                font: theme.fonts.body1,
                textColorNormal: colors.textSecondary.color(),
              ),
              Slidable(
                endActionPane: const ActionPane(
                  motion: ScrollMotion(),
                  children: <SlidableAction>[
                    SlidableAction(
                      onPressed: null,
                      backgroundColor: Color(0xFF3A83F1),
                      foregroundColor: Colors.white,
                      icon: AdmiralIcons.admiral_ic_email_outline,
                      label: 'Text',
                      padding: EdgeInsets.zero,
                    ),
                    SlidableAction(
                      onPressed: null,
                      backgroundColor: Color(0xFF44BF78),
                      foregroundColor: Colors.white,
                      icon: AdmiralIcons.admiral_ic_edit_outline,
                      label: 'Text',
                      padding: EdgeInsets.zero,
                    ),
                    SlidableAction(
                      onPressed: null,
                      backgroundColor: Color(0xFFFB9130),
                      foregroundColor: Colors.white,
                      icon: AdmiralIcons.admiral_ic_star_outline,
                      label: 'Text',
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
                child: BaseCellWidget(
                  centerCell:
                      TitleCellWidget(title: 'Title', isEnabled: isEnabled),
                  trailingCell: ArrowCellWidget(isEnabled: isEnabled),
                  horizontalPadding: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
