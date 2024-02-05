import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'badge_cell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NormalBadgesScreen extends StatefulWidget {
  const NormalBadgesScreen({
    super.key,
    required this.title,
    this.appBarHidden = false,
  });

  final String title;
  final bool appBarHidden;

  @override
  State<NormalBadgesScreen> createState() => _NormalBadgesScreenState();
}

class _NormalBadgesScreenState extends State<NormalBadgesScreen> {
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    return Scaffold(
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
        title: Text(
          widget.title,
          style: fonts.largeTitle1.toTextStyle(
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
                  isEnabled: isEnabled),
              BadgeCellWidget(
                  title: 'Natural',
                  badgeStyle: BadgeStyle.natural,
                  isEnabled: isEnabled),
              BadgeCellWidget(
                  title: 'Default',
                  badgeStyle: BadgeStyle.normal,
                  isEnabled: isEnabled),
              BadgeCellWidget(
                  title: 'Success',
                  badgeStyle: BadgeStyle.success,
                  isEnabled: isEnabled),
              BadgeCellWidget(
                  title: 'Error',
                  badgeStyle: BadgeStyle.error,
                  isEnabled: isEnabled),
              BadgeCellWidget(
                  title: 'Attention',
                  badgeStyle: BadgeStyle.attention,
                  isEnabled: isEnabled)
            ],
          ),
        ),
      ),
    );
  }
}
