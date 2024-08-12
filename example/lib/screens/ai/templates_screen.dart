import 'package:example/navigation/tab_navigation_ai.dart';
import 'package:example/screens/ai/block/templates/templates_screen_cubit.dart';
import 'package:example/screens/ai/block/templates/templates_screen_state.dart';
import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TemplatesScreen extends StatefulWidget {
  const TemplatesScreen({
    super.key,
    required this.onPush,
    this.appBarHidden = false,
    this.isLocal = true,
  });

  final Function(TabNavigatorAIRoutes route, String templateName) onPush;
  final bool appBarHidden;
  final bool isLocal;

  @override
  State<TemplatesScreen> createState() => _TemplatesScreenState();
}

class _TemplatesScreenState extends State<TemplatesScreen> {
  final TemplatesScreenCubit cubit = TemplatesScreenCubit();

  @override
  void initState() {
    super.initState();
    cubit.getTemplates(widget.isLocal);
  }

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
        title: Text(
          'Templates',
          style: fonts.subtitle2.toTextStyle(
            colors.textPrimary.color(),
          ),
        ),
        centerTitle: true,
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: colors.backgroundBasic.color(),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: LayoutGrid.doubleModule,
          ),
          child: BlocBuilder<TemplatesScreenCubit, TemplatesScreenState>(
            bloc: cubit,
            builder: (BuildContext context, TemplatesScreenState state) {
              return Container(
                color: colors.backgroundBasic.color(),
                child: ListView.builder(
                  itemCount: state.templates.length,
                  itemBuilder: (BuildContext context, int index) {
                    return BaseCellWidget(
                        centerCell: TitleCellWidget(
                          title: state.templates[index].name
                        ),
                        trailingCell: ArrowCellWidget(),
                        horizontalPadding: 0,
                        isEnabled: true,
                        onPressed: () => {
                              widget.onPush.call(
                                  widget.isLocal ? 
                                  TabNavigatorAIRoutes.localTemplate : 
                                  TabNavigatorAIRoutes.remoteTemplate, 
                                  state.templates[index].name ?? ''
                              )
                            });
                  },
                ),
              );
            },
          )),
    );
  }
}
