import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToastStaticScreen extends StatefulWidget {
  const ToastStaticScreen({super.key, this.appBarHidden = false});

  final bool appBarHidden;

  @override
  State<ToastStaticScreen> createState() => _ToastStaticScreenState();
}

class _ToastStaticScreenState extends State<ToastStaticScreen> {
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    return Scaffold(
      backgroundColor: colors.backgroundBasic.color(),
      appBar: AppBar(
        centerTitle: true,
        leading: CupertinoButton(
          child: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: colors.backgroundBasic.color(),
        title: TextView(
          'Toast',
          font: fonts.subtitle2,
          textColorNormal: colors.textPrimary.color(),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(
          LayoutGrid.doubleModule,
        ),
        child: SizedBox.expand(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: LayoutGrid.doubleModule,
                ),
                StandardTabs(
                  <String>['Default', 'Disabled'],
                  onTap: (String value) {
                    setState(() {
                      isEnabled = value == 'Default';
                    });
                  },
                ),
                SizedBox(
                  height: LayoutGrid.quadrupleModule,
                ),
                TextView(
                  'Default',
                  font: fonts.body1,
                  textColorNormal: colors.textSecondary.color(),
                ),
                SizedBox(
                  height: LayoutGrid.doubleModule,
                ),
                ToastWidget(
                    title:
                        'At breakpoint boundaries, mini units divide the screen'
                        ' into a fixed master grid.',
                    linkText: 'Link text',
                    image: AdmiralIcons.admiral_ic_info_outline,
                    style: ToastStyle.normal,
                    isEnable: isEnabled,
                    onClosePressed: () {}),
                const SizedBox(
                  height: LayoutGrid.module,
                ),
                ToastWidget(
                    title:
                        'At breakpoint boundaries, mini units divide the screen'
                        ' into a fixed master grid.',
                    linkText: 'Link text',
                    image: AdmiralIcons.admiral_ic_info_outline,
                    style: ToastStyle.additional,
                    isEnable: isEnabled,
                    onClosePressed: () {}),
                SizedBox(
                  height: LayoutGrid.doubleModule,
                ),
                TextView(
                  'Success',
                  font: fonts.body1,
                  textColorNormal: colors.textSecondary.color(),
                ),
                SizedBox(
                  height: LayoutGrid.doubleModule,
                ),
                ToastWidget(
                    title:
                        'At breakpoint boundaries, mini units divide the screen'
                        ' into a fixed master grid.',
                    linkText: 'Link text',
                    image: AdmiralIcons.admiral_ic_check_solid,
                    style: ToastStyle.normal,
                    isEnable: isEnabled,
                    onClosePressed: () {}),
                const SizedBox(
                  height: LayoutGrid.module,
                ),
                ToastWidget(
                    title:
                        'At breakpoint boundaries, mini units divide the screen'
                        ' into a fixed master grid.',
                    linkText: 'Link text',
                    image: AdmiralIcons.admiral_ic_check_solid,
                    style: ToastStyle.success,
                    isEnable: isEnabled,
                    onClosePressed: () {}),
                SizedBox(
                  height: LayoutGrid.doubleModule,
                ),
                TextView(
                  'Attention',
                  font: fonts.body1,
                  textColorNormal: colors.textSecondary.color(),
                ),
                SizedBox(
                  height: LayoutGrid.doubleModule,
                ),
                ToastWidget(
                    title:
                        'At breakpoint boundaries, mini units divide the screen'
                        ' into a fixed master grid.',
                    linkText: 'Link text',
                    image: AdmiralIcons.admiral_ic_error_triangle_solid,
                    style: ToastStyle.normal,
                    isEnable: isEnabled,
                    onClosePressed: () {}),
                const SizedBox(
                  height: LayoutGrid.module,
                ),
                ToastWidget(
                    title:
                        'At breakpoint boundaries, mini units divide the screen'
                        ' into a fixed master grid.',
                    linkText: 'Link text',
                    image: AdmiralIcons.admiral_ic_error_triangle_solid,
                    style: ToastStyle.attention,
                    isEnable: isEnabled,
                    onClosePressed: () {}),
                SizedBox(
                  height: LayoutGrid.doubleModule,
                ),
                TextView(
                  'Error',
                  font: fonts.body1,
                  textColorNormal: colors.textSecondary.color(),
                ),
                SizedBox(
                  height: LayoutGrid.doubleModule,
                ),
                ToastWidget(
                    title:
                        'At breakpoint boundaries, mini units divide the screen'
                        ' into a fixed master grid.',
                    linkText: 'Link text',
                    image: AdmiralIcons.admiral_ic_error_outline,
                    style: ToastStyle.normal,
                    isEnable: isEnabled,
                    onClosePressed: () {}),
                const SizedBox(
                  height: LayoutGrid.module,
                ),
                ToastWidget(
                    title:
                        'At breakpoint boundaries, mini units divide the screen'
                        ' into a fixed master grid.',
                    linkText: 'Link text',
                    image: AdmiralIcons.admiral_ic_error_outline,
                    style: ToastStyle.error,
                    isEnable: isEnabled,
                    onClosePressed: () {}),
                SizedBox(
                  height: LayoutGrid.doubleModule,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
