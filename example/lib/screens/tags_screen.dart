import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class TagsScreen extends StatefulWidget {
  const TagsScreen({super.key, this.appBarHidden = false});

  final bool appBarHidden;

  @override
  State<TagsScreen> createState() => _TagsScreenState();
}

class _TagsScreenState extends State<TagsScreen> {
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;

    return Scaffold(
      backgroundColor: colors.backgroundBasic.color(),
      appBar: AppBar(
        backgroundColor: colors.backgroundBasic.color(),
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Tags & Chips',
          style: theme.fonts.subtitle2.toTextStyle(
            colors.textPrimary.color(),
          ),
        ),
      ),
      body: Container(
        color: colors.backgroundBasic.color(),
        padding: EdgeInsets.all(
          LayoutGrid.doubleModule,
        ),
        child: Column(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Default',
                  textAlign: TextAlign.left,
                  style: theme.fonts.body1.toTextStyle(
                    colors.textSecondary.color(),
                  ),
                ),
              ],
            ),
            SizedBox(height: LayoutGrid.doubleModule),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TagControlWidget(
                    leadingImage: AdmiralIcons.admiral_ic_car_solid,
                    title: 'Text',
                    trailingButtonWidget: GestureDetector(
                      onTap: () {},
                      child: Image(
                        image: AssetImage('assets/tagsChips/close.png'),
                        fit: BoxFit.cover,
                        height: 20,
                      ),
                    ),
                    style: TagStyle.normal,
                    isEnabled: isEnabled,
                  ),
                  SizedBox(width: LayoutGrid.module),
                  TagControlWidget(
                    title: 'Text',
                    trailingButtonWidget: GestureDetector(
                      onTap: () {},
                      child: Image(
                        image: AssetImage('assets/tagsChips/close.png'),
                        fit: BoxFit.cover,
                        height: 20,
                      ),
                    ),
                    style: TagStyle.normal,
                    isEnabled: isEnabled,
                  ),
                  SizedBox(width: LayoutGrid.module),
                  TagControlWidget(
                    leadingImage: AdmiralIcons.admiral_ic_car_solid,
                    title: 'Icons',
                    style: TagStyle.normal,
                    isEnabled: isEnabled,
                  ),
                  SizedBox(width: LayoutGrid.module),
                  TagControlWidget(
                      leadingImage: AdmiralIcons.admiral_ic_car_solid,
                      style: TagStyle.normal,
                      isEnabled: isEnabled),
                  SizedBox(width: LayoutGrid.module),
                  TagControlWidget(
                    leadingText: '🐶',
                    title: 'Emoji',
                    style: TagStyle.normal,
                    isEnabled: isEnabled,
                  ),
                  SizedBox(width: LayoutGrid.module),
                  TagControlWidget(
                    leadingWidget: Image(
                      image: AssetImage('assets/tagsChips/russiaFlag.png'),
                      fit: BoxFit.cover,
                      height: LayoutGrid.halfModule * 7,
                    ),
                    title: 'Flags',
                    style: TagStyle.normal,
                    isEnabled: isEnabled,
                  ),
                ],
              ),
            ),
            SizedBox(height: LayoutGrid.doubleModule),
            // Additional
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Additional',
                  textAlign: TextAlign.left,
                  style: theme.fonts.body1.toTextStyle(
                    colors.textSecondary.color(),
                  ),
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
                    TagControlWidget(
                      leadingImage: AdmiralIcons.admiral_ic_car_solid,
                      title: 'Icons',
                      style: TagStyle.additional,
                      isEnabled: isEnabled,
                    ),
                    SizedBox(width: LayoutGrid.module),
                    TagControlWidget(
                      leadingText: '🐶',
                      title: 'Emoji',
                      style: TagStyle.additional,
                      isEnabled: isEnabled,
                    ),
                    SizedBox(width: LayoutGrid.module),
                    TagControlWidget(
                      leadingWidget: Image(
                        image: AssetImage('assets/tagsChips/russiaFlag.png'),
                        fit: BoxFit.cover,
                        height: LayoutGrid.halfModule * 7,
                      ),
                      title: 'Flags',
                      style: TagStyle.additional,
                      isEnabled: isEnabled,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: LayoutGrid.doubleModule),
            // Success
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Success',
                  textAlign: TextAlign.left,
                  style: theme.fonts.body1.toTextStyle(
                    colors.textSecondary.color(),
                  ),
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
                    TagControlWidget(
                      leadingImage: AdmiralIcons.admiral_ic_car_solid,
                      title: 'Icons',
                      style: TagStyle.success,
                      isEnabled: isEnabled,
                    ),
                    SizedBox(width: LayoutGrid.module),
                    TagControlWidget(
                      leadingText: '🐶',
                      title: 'Emoji',
                      style: TagStyle.success,
                      isEnabled: isEnabled,
                    ),
                    SizedBox(width: LayoutGrid.module),
                    TagControlWidget(
                      leadingWidget: Image(
                        image: AssetImage('assets/tagsChips/russiaFlag.png'),
                        fit: BoxFit.cover,
                        height: LayoutGrid.halfModule * 7,
                      ),
                      title: 'Flags',
                      style: TagStyle.success,
                      isEnabled: isEnabled,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: LayoutGrid.doubleModule),
            // Error
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Error',
                  textAlign: TextAlign.left,
                  style: theme.fonts.body1.toTextStyle(
                    colors.textSecondary.color(),
                  ),
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
                    TagControlWidget(
                      leadingImage: AdmiralIcons.admiral_ic_car_solid,
                      title: 'Icons',
                      style: TagStyle.error,
                      isEnabled: isEnabled,
                    ),
                    SizedBox(width: LayoutGrid.module),
                    TagControlWidget(
                      leadingText: '🐶',
                      title: 'Emoji',
                      style: TagStyle.error,
                      isEnabled: isEnabled,
                    ),
                    SizedBox(width: LayoutGrid.module),
                    TagControlWidget(
                      leadingWidget: Image(
                        image: AssetImage('assets/tagsChips/russiaFlag.png'),
                        fit: BoxFit.cover,
                        height: LayoutGrid.halfModule * 7,
                      ),
                      title: 'Flags',
                      style: TagStyle.error,
                      isEnabled: isEnabled,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: LayoutGrid.doubleModule),
            // Attention
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Attention',
                  textAlign: TextAlign.left,
                  style: theme.fonts.body1.toTextStyle(
                    colors.textSecondary.color(),
                  ),
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
                    TagControlWidget(
                      leadingImage: AdmiralIcons.admiral_ic_car_solid,
                      title: 'Icons',
                      style: TagStyle.attention,
                      isEnabled: isEnabled,
                    ),
                    SizedBox(width: LayoutGrid.module),
                    TagControlWidget(
                      leadingText: '🐶',
                      title: 'Emoji',
                      style: TagStyle.attention,
                      isEnabled: isEnabled,
                    ),
                    SizedBox(width: LayoutGrid.module),
                    TagControlWidget(
                      leadingWidget: Image(
                        image: AssetImage('assets/tagsChips/russiaFlag.png'),
                        fit: BoxFit.cover,
                        height: LayoutGrid.halfModule * 7,
                      ),
                      title: 'Flags',
                      style: TagStyle.attention,
                      isEnabled: isEnabled,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
