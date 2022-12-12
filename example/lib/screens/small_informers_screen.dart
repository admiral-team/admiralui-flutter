import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmallInformersScreen extends StatelessWidget {
  const SmallInformersScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    return Scaffold(
      appBar: AppBar(
        leading: CupertinoButton(
          child: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: colors.backgroundBasic.color(),
        title: Text(
          title,
          style: fonts.largeTitle1.toTextStyle(
            colors.textPrimary.color(),
          ),
        ),
      ),
      body: SizedBox.expand(
        child: Container(
          color: colors.backgroundBasic.color(),
          padding: EdgeInsets.all(
            LayoutGrid.doubleModule,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Default',
                textAlign: TextAlign.left,
              ),
              SizedBox(height: LayoutGrid.doubleModule),
              SmallInformerWidget(
                title: 'Text Informer',
                style: InformerStyle.normal,
                arrowDirectionStyle: InformerDirectionStyle.topRight,
              ),
              SizedBox(height: LayoutGrid.doubleModule),
              const Text(
                'Success',
                textAlign: TextAlign.left,
              ),
              SizedBox(height: LayoutGrid.doubleModule),
              SmallInformerWidget(
                title: 'Text Informer',
                style: InformerStyle.success,
                arrowDirectionStyle: InformerDirectionStyle.topRight,
              ),
              SizedBox(height: LayoutGrid.doubleModule),
              const Text(
                'Attention',
                textAlign: TextAlign.left,
              ),
              SizedBox(height: LayoutGrid.doubleModule),
              SmallInformerWidget(
                title: 'Text Informer',
                style: InformerStyle.attention,
                arrowDirectionStyle: InformerDirectionStyle.topRight,
              ),
              SizedBox(height: LayoutGrid.doubleModule),
              const Text(
                'Error',
                textAlign: TextAlign.left,
              ),
              SizedBox(height: LayoutGrid.doubleModule),
              SmallInformerWidget(
                title: 'Text Informer',
                style: InformerStyle.error,
                arrowDirectionStyle: InformerDirectionStyle.topRight,
              ),
              SizedBox(height: LayoutGrid.doubleModule),
            ],
          ),
        ),
      ),
    );
  }
}
