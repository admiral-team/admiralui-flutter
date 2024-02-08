import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class ParagraphScreen extends StatefulWidget {
  const ParagraphScreen({
    super.key,
    this.appBarHidden = false,
  });

  final bool appBarHidden;

  @override
  State<ParagraphScreen> createState() => _ParagraphScreenState();
}

class _ParagraphScreenState extends State<ParagraphScreen> {
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
              TextView(
                'Primary',
                font: theme.fonts.body1,
                textColorNormal: colors.textSecondary.color(),
              ),
              SizedBox(
                height: LayoutGrid.module * 5,
              ),
              ParagrapgWidget(
                title: 'Lorem ipsum dolor sit amet',
                paragraphImageType: ParagraphLeadingImageType.point,
                isEnable: isEnabled,
              ),
              ParagrapgWidget(
                title: 'Lorem ipsum dolor sit amet',
                paragraphImageType: ParagraphLeadingImageType.check,
                isEnable: isEnabled,
              ),
              ParagrapgWidget(
                title: 'Lorem ipsum dolor sit amet, consectetur adipiscing'
                    'elit, sed do eiusmod tempor incididunt ut labore et dolore'
                    'magna aliqua.',
                isEnable: isEnabled,
              ),
              ParagrapgWidget(
                title: 'Lorem ipsum dolor sit amet, consectetur adipiscing'
                    'elit, sed do eiusmod tempor incididunt ut labore et dolore'
                    'magna aliqua.',
                trailingImageWidget: Icon(
                  AdmiralIcons.admiral_ic_check_clear_outline,
                ),
                isEnable: isEnabled,
              ),
              ParagrapgWidget(
                title: 'Lorem ipsum dolor sit amet, consectetur adipiscing'
                    'elit, sed do eiusmod tempor incididunt ut labore et dolore'
                    'magna aliqua.',
                textAligment: TextAlign.center,
                isEnable: isEnabled,
              ),
              SizedBox(
                height: LayoutGrid.module * 5,
              ),
              TextView(
                'Secondary',
                font: theme.fonts.body1,
                textColorNormal: colors.textSecondary.color(),
              ),
              SizedBox(
                height: LayoutGrid.module * 5,
              ),
              ParagrapgWidget(
                title: 'Lorem ipsum dolor sit amet',
                paragraphImageType: ParagraphLeadingImageType.point,
                paragraphStyle: ParagraphStyle.secondary,
                isEnable: isEnabled,
              ),
              ParagrapgWidget(
                title: 'Lorem ipsum dolor sit amet',
                paragraphImageType: ParagraphLeadingImageType.check,
                paragraphStyle: ParagraphStyle.secondary,
                isEnable: isEnabled,
              ),
              ParagrapgWidget(
                title: 'Lorem ipsum dolor sit amet, consectetur adipiscing'
                    'elit, sed do eiusmod tempor incididunt ut labore et dolore'
                    'magna aliqua.',
                paragraphStyle: ParagraphStyle.secondary,
                isEnable: isEnabled,
              ),
              ParagrapgWidget(
                title: 'Lorem ipsum dolor sit amet, consectetur adipiscing'
                    'elit, sed do eiusmod tempor incididunt ut labore et dolore'
                    'magna aliqua.',
                paragraphStyle: ParagraphStyle.secondary,
                trailingImageWidget: Icon(
                  AdmiralIcons.admiral_ic_check_clear_outline,
                ),
                isEnable: isEnabled,
              ),
              ParagrapgWidget(
                title: 'Lorem ipsum dolor sit amet, consectetur adipiscing'
                    'elit, sed do eiusmod tempor incididunt ut labore et dolore'
                    'magna aliqua.',
                paragraphStyle: ParagraphStyle.secondary,
                textAligment: TextAlign.center,
                isEnable: isEnabled,
              )
            ],
          ),
        ),
      ),
    );
  }
}
