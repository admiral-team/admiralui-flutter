import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TagsScreen extends StatelessWidget {
  const TagsScreen({
    super.key,
    this.appBarHidden = false,
  });

  final bool appBarHidden;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;

    return Scaffold(
      appBar: appBarHidden
          ? null
          : AppBar(
              leading: CupertinoButton(
                child: const Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.of(context).pop(),
              ),
              bottomOpacity: 0.0,
              elevation: 0.0,
              backgroundColor: colors.backgroundBasic.color(),
            ),
      body: Container(
        color: colors.backgroundBasic.color(),
        padding: EdgeInsets.all(
          LayoutGrid.doubleModule,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Default',
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            SizedBox(height: LayoutGrid.doubleModule),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const TagControlWidget(
                      leadingImage: AdmiralIcons.admiral_ic_car_solid,
                      title: 'Text',
                      trailingButtonImage: 
                      AdmiralIcons.admiral_ic_close_circle_outline,
                      style: TagStyle.normal),
                  SizedBox(width: LayoutGrid.module),
                  const TagControlWidget(
                      leadingImage: AdmiralIcons.admiral_ic_car_solid,
                      title: 'Icons',
                      style: TagStyle.normal),
                  SizedBox(width: LayoutGrid.module),
                  const TagControlWidget(
                      leadingImage: AdmiralIcons.admiral_ic_car_solid,
                      style: TagStyle.normal),
                  SizedBox(width: LayoutGrid.module),
                  const TagControlWidget(
                      leadingText: '🐶',
                      title: 'Emoji',
                      style: TagStyle.normal),
                ],
              ),
            ),
            SizedBox(height: LayoutGrid.doubleModule),
            // Additional
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Additional',
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            SizedBox(height: LayoutGrid.doubleModule),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const TagControlWidget(
                      leadingImage: AdmiralIcons.admiral_ic_car_solid,
                      title: 'Icons',
                      style: TagStyle.additional),
                  SizedBox(width: LayoutGrid.module),
                  const TagControlWidget(
                      leadingText: '🐶',
                      title: 'Emoji',
                      style: TagStyle.additional),
                ],
              ),),
            ),
            SizedBox(height: LayoutGrid.doubleModule),
            // Success
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Success',
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            SizedBox(height: LayoutGrid.doubleModule),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const TagControlWidget(
                      leadingImage: AdmiralIcons.admiral_ic_car_solid,
                      title: 'Icons',
                      style: TagStyle.success),
                  SizedBox(width: LayoutGrid.module),
                  const TagControlWidget(
                      leadingText: '🐶',
                      title: 'Emoji',
                      style: TagStyle.success),
                ],
              ),),
            ),
            SizedBox(height: LayoutGrid.doubleModule),
            // Error
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Error',
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            SizedBox(height: LayoutGrid.doubleModule),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  const TagControlWidget(
                      leadingImage: AdmiralIcons.admiral_ic_car_solid,
                      title: 'Icons',
                      style: TagStyle.error),
                  SizedBox(width: LayoutGrid.module),
                  const TagControlWidget(
                      leadingText: '🐶',
                      title: 'Emoji',
                      style: TagStyle.error),
                ],
              ),),
            ),
            SizedBox(height: LayoutGrid.doubleModule),
            // Attention
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Attention',
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            SizedBox(height: LayoutGrid.doubleModule),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  const TagControlWidget(
                      leadingImage: AdmiralIcons.admiral_ic_car_solid,
                      title: 'Icons',
                      style: TagStyle.attention),
                  SizedBox(width: LayoutGrid.module),
                  const TagControlWidget(
                      leadingText: '🐶',
                      title: 'Emoji',
                      style: TagStyle.attention),
                ],
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
