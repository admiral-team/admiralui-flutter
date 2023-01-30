import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleTextBlockScreen extends StatefulWidget {
  const TitleTextBlockScreen({
    super.key,
    this.appBarHidden = false,
  });

  final bool appBarHidden;

  @override
  State<TitleTextBlockScreen> createState() => _TitleTextBlockScreenState();
}

class _TitleTextBlockScreenState extends State<TitleTextBlockScreen> {
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
        title: Text(
          'Title',
          style: theme.fonts.subtitle2.toTextStyle(
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
              const SizedBox(height: LayoutGrid.quadrupleModule),
              TitleHeaderWidget(
                title: 'Title', 
                style: TitleHeaderStyle.headlineSecondary,
                textAlign: TextAlign.left
              ),
              const SizedBox(height: LayoutGrid.quadrupleModule),
              TitleHeaderWidget(
                title: 'Title', 
                style: TitleHeaderStyle.title,
                textAlign: TextAlign.left
              ),
              const SizedBox(height: LayoutGrid.doubleModule),
              TitleHeaderWidget(
                title: 'Title', 
                style: TitleHeaderStyle.title,
                textAlign: TextAlign.center
              ),
              const SizedBox(height: LayoutGrid.doubleModule),
              SubtitleTitleHeaderWidget(
                title: 'Title', 
                subtitle: 'Subtitle',
                style: TitleHeaderStyle.title,
              ),
              const SizedBox(height: LayoutGrid.doubleModule),
              TitleSubtitleHeaderWidget(
                title: 'Title', 
                subtitle: 'Subtitle',
                style: TitleHeaderStyle.title,
              ),

              const SizedBox(height: LayoutGrid.quadrupleModule),
              TitleHeaderWidget(
                title: 'Subtitle', 
                style: TitleHeaderStyle.headlineSecondary,
                textAlign: TextAlign.left
              ),
              const SizedBox(height: LayoutGrid.quadrupleModule),
              TitleHeaderWidget(
                title: 'Title', 
                style: TitleHeaderStyle.subtitle,
                textAlign: TextAlign.left
              ),
              const SizedBox(height: LayoutGrid.doubleModule),
              TitleHeaderWidget(
                title: 'Title', 
                style: TitleHeaderStyle.subtitle,
                textAlign: TextAlign.center
              ),
              const SizedBox(height: LayoutGrid.doubleModule),
              SubtitleTitleHeaderWidget(
                title: 'Title', 
                subtitle: 'Subtitle',
                style: TitleHeaderStyle.subtitle,
              ),
              const SizedBox(height: LayoutGrid.doubleModule),
              TitleSubtitleHeaderWidget(
                title: 'Title', 
                subtitle: 'Subtitle',
                style: TitleHeaderStyle.subtitle,
              ),

              const SizedBox(height: LayoutGrid.quadrupleModule),
              TitleHeaderWidget(
                title: 'Headline', 
                style: TitleHeaderStyle.headlineSecondary,
                textAlign: TextAlign.left
              ),
              const SizedBox(height: LayoutGrid.quadrupleModule),
              TitleHeaderWidget(
                title: 'Title', 
                style: TitleHeaderStyle.headline,
                textAlign: TextAlign.left
              ),
              const SizedBox(height: LayoutGrid.doubleModule),
              TitleHeaderWidget(
                title: 'Title', 
                style: TitleHeaderStyle.headline,
                textAlign: TextAlign.center
              ),
              const SizedBox(height: LayoutGrid.doubleModule),
              SubtitleTitleHeaderWidget(
                title: 'Title', 
                subtitle: 'Subtitle',
                style: TitleHeaderStyle.headline,
              ),
              const SizedBox(height: LayoutGrid.doubleModule),
              TitleSubtitleHeaderWidget(
                title: 'Title', 
                subtitle: 'Subtitle',
                style: TitleHeaderStyle.headline,
              ),

              const SizedBox(height: LayoutGrid.quadrupleModule),
              TitleHeaderWidget(
                title: 'Headline 2', 
                style: TitleHeaderStyle.headlineSecondary,
                textAlign: TextAlign.left
              ),
              const SizedBox(height: LayoutGrid.quadrupleModule),
              TitleHeaderWidget(
                title: 'Title', 
                style: TitleHeaderStyle.headlineSecondary,
                textAlign: TextAlign.left
              ),
              const SizedBox(height: LayoutGrid.doubleModule),
              TitleHeaderWidget(
                title: 'Title', 
                style: TitleHeaderStyle.headlineSecondary,
                textAlign: TextAlign.center
              ),
              const SizedBox(height: LayoutGrid.doubleModule),
              SubtitleTitleHeaderWidget(
                title: 'Title', 
                subtitle: 'Subtitle',
                style: TitleHeaderStyle.headlineSecondary,
              ),
              const SizedBox(height: LayoutGrid.doubleModule),
              TitleSubtitleHeaderWidget(
                title: 'Title', 
                subtitle: 'Subtitle',
                style: TitleHeaderStyle.headlineSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}