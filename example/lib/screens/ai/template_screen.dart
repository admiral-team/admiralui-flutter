import 'package:example/navigation/tab_navigation_ai.dart';
import 'package:example/screens/ai/block/template/template_screen_cubit.dart';
import 'package:example/screens/ai/block/template/template_screen_state.dart';
import 'package:example/screens/ai/view_models/column_view_model.dart';
import 'package:example/screens/ai/view_models/row_view_model.dart';
import 'package:example/screens/ai/view_models/scroll_view_model.dart';
import 'package:example/screens/ai/view_models/spacer_view_model.dart';
import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:example/screens/ai/view_models/primary_button_view_model.dart';
import 'package:example/screens/ai/view_models/standard_text_field_view_model.dart';
import 'package:example/screens/ai/view_models/standard_tabs_view_model.dart';
import 'package:example/screens/ai/view_models/title_header_widget_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TemplateScreen extends StatefulWidget {
  const TemplateScreen({
    super.key,
    required this.onPush,
    this.appBarHidden = false,
    this.isLocal = true,
  });

  final Function(TabNavigatorAIRoutes route, String templateName) onPush;
  final bool appBarHidden;
  final bool isLocal;

  @override
  State<TemplateScreen> createState() => _TemplateScreenState();
}

class _TemplateScreenState extends State<TemplateScreen> {
  final TemplateScreenCubit cubit = TemplateScreenCubit();

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;
    final String? templateName =
        ModalRoute.of(context)?.settings.arguments as String?;
    if (templateName != null) {
      cubit.getTemplate(widget.isLocal, templateName);
    }

    return Scaffold(
      backgroundColor: colors.backgroundBasic.color(),
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Template',
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
        child: BlocBuilder<TemplateScreenCubit, TemplateScreenState>(
            bloc: cubit,
            builder: (BuildContext context, TemplateScreenState state) {
              return Container(
                  color: colors.backgroundBasic.color(),
                  child: _buildView(
                    context,
                    0,
                    colors,
                    fonts,
                    state.template?.items ?? <dynamic>[],
                  ));
            }),
      ),
    );
  }

  Widget _buildView(
    BuildContext ctx,
    int index,
    ColorPalette colors,
    FontPalette fonts,
    List<dynamic> items,
  ) {
    final dynamic item = index == items.length ? null : items[index];

    switch (item.runtimeType) {
      case PrimaryButtonViewModel:
        return Align(
          alignment: Alignment.centerLeft,
          child: PrimaryButton(
              title: item.title,
              isEnabled: item.isEnabled,
              sizeType: item.sizeType,
              iconData: item.iconData,
              iconPosition: item.iconPosition,
              onPressed: () => <Future<void>>{
                    cubit.didAction(widget.isLocal, item.actions, widget.onPush)
                  }),
        );
      case SpacerViewModel:
        if (item.width != null || item.height != null) {
          return SizedBox(width: item.width, height: item.height);
        } else {
          return Spacer();
        }
      case StandardTabsViewModel:
        return SizedBox(
            width: item.width,
            height: item.height,
            child: StandardTabs(
                item.items,
                onTap: (String _) {
                  cubit.didAction(widget.isLocal, item.actions, widget.onPush);
                },
            )
        );
      case TitleHeaderWidgetViewModel:
        return TitleHeaderWidget(
          title: item.text,
          style: item.style,
          textAlign: item.textAlign,
        );
      case RowViewModel:
        return SizedBox(
            width: item.width,
            height: item.height,
            child: Row(children: <Widget>[
              for (int index = 0; index < item.items.length; index++)
                _buildView(
                  context,
                  index,
                  colors,
                  fonts,
                  item.items,
                ),
            ]));
      case ColumnViewModel:
        return SizedBox(
            width: item.width,
            height: item.height,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  for (int index = 0; index < item.items.length; index++)
                    _buildView(
                      context,
                      index,
                      colors,
                      fonts,
                      item.items,
                    ),
                ]));
      case ScrollViewModel:
        return SizedBox(
          width: item.width,
          height: item.height,
          child: ListView.builder(
            scrollDirection: item.scrollDirection,
            itemCount: item.items.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildView(
                context,
                index,
                colors,
                fonts,
                item.items,
              );
            },
          ),
        );
      case StandardTextFieldViewModel:
        return TextFieldWidget(
          item.controller,
          state: item.state,
          labelText: item.labelText,
          placeHolderText: item.placeHolderText,
          informerText: item.informerText,
          hasSecure: item.isSecure,
          numberOfLines: item.numberOfLines,
        );
      default:
        return Container();
    }
  }
}
