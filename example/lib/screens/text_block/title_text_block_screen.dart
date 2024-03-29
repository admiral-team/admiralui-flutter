import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
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
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Header',
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
                textAlign: TextAlign.left,
                isEnable: isEnabled,
              ),
              const SizedBox(height: LayoutGrid.quadrupleModule),
              TitleHeaderWidget(
                title: 'Title',
                style: TitleHeaderStyle.title,
                textAlign: TextAlign.left,
                isEnable: isEnabled,
              ),
              const SizedBox(height: LayoutGrid.doubleModule),
              TitleHeaderWidget(
                title: 'Title',
                style: TitleHeaderStyle.title,
                textAlign: TextAlign.center,
                isEnable: isEnabled,
              ),
              const SizedBox(height: LayoutGrid.doubleModule),
              DropDownHeaderWidget(
                title: 'Title',
                style: TitleHeaderStyle.title,
                isEnable: isEnabled,
                dropDownStyle: DropDownHeaderStyle.down,
              ),
              const SizedBox(height: LayoutGrid.doubleModule),
              SubtitleTitleHeaderWidget(
                title: 'Title',
                subtitle: 'Subtitle',
                style: TitleHeaderStyle.title,
                isEnable: isEnabled,
              ),
              const SizedBox(height: LayoutGrid.doubleModule),
              TitleSubtitleHeaderWidget(
                title: 'Title',
                subtitle: 'Subtitle',
                style: TitleHeaderStyle.title,
                isEnable: isEnabled,
              ),
              const SizedBox(height: LayoutGrid.doubleModule),
              ArrowWithButtonWidget(
                  title: 'Title',
                  style: TitleHeaderStyle.title,
                  dropDownStyle: DropDownHeaderStyle.down,
                  isEnable: isEnabled,
                  buttonTitle: 'Button'),
              const SizedBox(height: LayoutGrid.doubleModule),
              ArrowWithButtonWidget(
                  title: 'Title',
                  style: TitleHeaderStyle.title,
                  isEnable: isEnabled,
                  buttonTitle: 'Button'),
              const SizedBox(height: LayoutGrid.quadrupleModule),
              TitleHeaderWidget(
                  title: 'Subtitle',
                  style: TitleHeaderStyle.headlineSecondary,
                  isEnable: isEnabled,
                  textAlign: TextAlign.left),
              const SizedBox(height: LayoutGrid.quadrupleModule),
              TitleHeaderWidget(
                  title: 'Title',
                  style: TitleHeaderStyle.subtitle,
                  isEnable: isEnabled,
                  textAlign: TextAlign.left),
              const SizedBox(height: LayoutGrid.doubleModule),
              TitleHeaderWidget(
                  title: 'Title',
                  style: TitleHeaderStyle.subtitle,
                  isEnable: isEnabled,
                  textAlign: TextAlign.center),
              const SizedBox(height: LayoutGrid.doubleModule),
              DropDownHeaderWidget(
                title: 'Title',
                style: TitleHeaderStyle.subtitle,
                isEnable: isEnabled,
                dropDownStyle: DropDownHeaderStyle.down,
              ),
              const SizedBox(height: LayoutGrid.doubleModule),
              SubtitleTitleHeaderWidget(
                title: 'Title',
                subtitle: 'Subtitle',
                isEnable: isEnabled,
                style: TitleHeaderStyle.subtitle,
              ),
              const SizedBox(height: LayoutGrid.doubleModule),
              TitleSubtitleHeaderWidget(
                title: 'Title',
                subtitle: 'Subtitle',
                isEnable: isEnabled,
                style: TitleHeaderStyle.subtitle,
              ),
              const SizedBox(height: LayoutGrid.doubleModule),
              ArrowWithButtonWidget(
                  title: 'Title',
                  style: TitleHeaderStyle.subtitle,
                  isEnable: isEnabled,
                  dropDownStyle: DropDownHeaderStyle.down,
                  buttonTitle: 'Button'),
              const SizedBox(height: LayoutGrid.doubleModule),
              ArrowWithButtonWidget(
                  title: 'Title',
                  style: TitleHeaderStyle.subtitle,
                  isEnable: isEnabled,
                  buttonTitle: 'Button'),
              const SizedBox(height: LayoutGrid.quadrupleModule),
              TitleHeaderWidget(
                  title: 'Headline',
                  style: TitleHeaderStyle.headlineSecondary,
                  isEnable: isEnabled,
                  textAlign: TextAlign.left),
              const SizedBox(height: LayoutGrid.quadrupleModule),
              TitleHeaderWidget(
                  title: 'Title',
                  style: TitleHeaderStyle.headline,
                  isEnable: isEnabled,
                  textAlign: TextAlign.left),
              const SizedBox(height: LayoutGrid.doubleModule),
              TitleHeaderWidget(
                  title: 'Title',
                  style: TitleHeaderStyle.headline,
                  isEnable: isEnabled,
                  textAlign: TextAlign.center),
              const SizedBox(height: LayoutGrid.doubleModule),
              DropDownHeaderWidget(
                title: 'Title',
                style: TitleHeaderStyle.headline,
                isEnable: isEnabled,
                dropDownStyle: DropDownHeaderStyle.down,
              ),
              const SizedBox(height: LayoutGrid.doubleModule),
              SubtitleTitleHeaderWidget(
                title: 'Title',
                subtitle: 'Subtitle',
                style: TitleHeaderStyle.headline,
                isEnable: isEnabled,
              ),
              const SizedBox(height: LayoutGrid.doubleModule),
              TitleSubtitleHeaderWidget(
                title: 'Title',
                subtitle: 'Subtitle',
                style: TitleHeaderStyle.headline,
                isEnable: isEnabled,
              ),
              const SizedBox(height: LayoutGrid.doubleModule),
              ArrowWithButtonWidget(
                  title: 'Title',
                  style: TitleHeaderStyle.headline,
                  dropDownStyle: DropDownHeaderStyle.down,
                  isEnable: isEnabled,
                  buttonTitle: 'Button'),
              const SizedBox(height: LayoutGrid.doubleModule),
              ArrowWithButtonWidget(
                  title: 'Title',
                  style: TitleHeaderStyle.headline,
                  isEnable: isEnabled,
                  buttonTitle: 'Button'),
              const SizedBox(height: LayoutGrid.quadrupleModule),
              TitleHeaderWidget(
                  title: 'Headline 2',
                  style: TitleHeaderStyle.headlineSecondary,
                  isEnable: isEnabled,
                  textAlign: TextAlign.left),
              const SizedBox(height: LayoutGrid.quadrupleModule),
              TitleHeaderWidget(
                  title: 'Title',
                  style: TitleHeaderStyle.headlineSecondary,
                  isEnable: isEnabled,
                  textAlign: TextAlign.left),
              const SizedBox(height: LayoutGrid.doubleModule),
              TitleHeaderWidget(
                  title: 'Title',
                  style: TitleHeaderStyle.headlineSecondary,
                  isEnable: isEnabled,
                  textAlign: TextAlign.center),
              const SizedBox(height: LayoutGrid.doubleModule),
              DropDownHeaderWidget(
                title: 'Title',
                style: TitleHeaderStyle.headlineSecondary,
                isEnable: isEnabled,
                dropDownStyle: DropDownHeaderStyle.down,
              ),
              const SizedBox(height: LayoutGrid.doubleModule),
              SubtitleTitleHeaderWidget(
                title: 'Title',
                isEnable: isEnabled,
                subtitle: 'Subtitle',
                style: TitleHeaderStyle.headlineSecondary,
              ),
              const SizedBox(height: LayoutGrid.doubleModule),
              TitleSubtitleHeaderWidget(
                title: 'Title',
                subtitle: 'Subtitle',
                isEnable: isEnabled,
                style: TitleHeaderStyle.headlineSecondary,
              ),
              const SizedBox(height: LayoutGrid.doubleModule),
              ArrowWithButtonWidget(
                title: 'Title',
                style: TitleHeaderStyle.headlineSecondary,
                dropDownStyle: DropDownHeaderStyle.down,
                buttonTitle: 'Button',
                isEnable: isEnabled,
              ),
              const SizedBox(height: LayoutGrid.doubleModule),
              ArrowWithButtonWidget(
                title: 'Title',
                style: TitleHeaderStyle.headlineSecondary,
                buttonTitle: 'Button',
                isEnable: isEnabled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
