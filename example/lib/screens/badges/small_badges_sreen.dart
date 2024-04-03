import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'badge_cell.dart';
import 'package:flutter/material.dart';

class SmallBadgesScreen extends StatefulWidget {
  const SmallBadgesScreen({super.key, required this.title});

  final String title;

  @override
  State<SmallBadgesScreen> createState() => _SmallBadgesScreenState();
}

class _SmallBadgesScreenState extends State<SmallBadgesScreen> {
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
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: colors.backgroundBasic.color(),
        title: Text(
          widget.title,
          style: fonts.subtitle2.toTextStyle(
            colors.textPrimary.color(),
          ),
        ),
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
              BadgeCellWidget(
                  title: 'Additional',
                  badgeStyle: BadgeStyle.additional,
                  isSmallBadge: true,
                  isEnabled: isEnabled),
              BadgeCellWidget(
                  title: 'Natural',
                  badgeStyle: BadgeStyle.natural,
                  isSmallBadge: true,
                  isEnabled: isEnabled),
              BadgeCellWidget(
                  title: 'Default',
                  badgeStyle: BadgeStyle.normal,
                  isSmallBadge: true,
                  isEnabled: isEnabled),
              BadgeCellWidget(
                  title: 'Success',
                  badgeStyle: BadgeStyle.success,
                  isSmallBadge: true,
                  isEnabled: isEnabled),
              BadgeCellWidget(
                  title: 'Error',
                  badgeStyle: BadgeStyle.error,
                  isSmallBadge: true,
                  isEnabled: isEnabled),
              BadgeCellWidget(
                  title: 'Attention',
                  badgeStyle: BadgeStyle.attention,
                  isSmallBadge: true,
                  isEnabled: isEnabled)
            ],
          ),
        ),
      ),
    );
  }
}
