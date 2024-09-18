import 'package:example/gen/assets.gen.dart';
import 'package:example/navigation/tab_navigation_ai.dart';
import 'package:example/screens/ai/block/template/template_screen_cubit.dart';
import 'package:example/screens/ai/block/template/template_screen_state.dart';
import 'package:example/screens/ai/view_models/big_informer_view_model.dart';
import 'package:example/screens/ai/view_models/calendar_view_model.dart';
import 'package:example/screens/ai/view_models/button_drop_down_view_model.dart';
import 'package:example/screens/ai/view_models/check_box_view_model.dart';
import 'package:example/screens/ai/view_models/column_view_model.dart';
import 'package:example/screens/ai/view_models/expanded_view_model.dart';
import 'package:example/screens/ai/view_models/ghost_button_view_model.dart';
import 'package:example/screens/ai/view_models/informer_tabs_view_model.dart';
import 'package:example/screens/ai/view_models/link_control_view_model.dart';
import 'package:example/screens/ai/view_models/logo_tabs_view_model.dart';
import 'package:example/screens/ai/view_models/outline_tabs_view_model.dart';
import 'package:example/screens/ai/view_models/padding_view_model.dart';
import 'package:example/screens/ai/view_models/paragraph_view_model.dart';
import 'package:example/screens/ai/view_models/radio_button_view_model.dart';
import 'package:example/screens/ai/view_models/double_slider_text_field_view_model.dart';
import 'package:example/screens/ai/view_models/row_view_model.dart';
import 'package:example/screens/ai/view_models/scroll_view_model.dart';
import 'package:example/screens/ai/view_models/slider_text_field_view_model.dart';
import 'package:example/screens/ai/view_models/small_informer_view_model.dart';
import 'package:example/screens/ai/view_models/spacer_view_model.dart';
import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:example/screens/ai/view_models/primary_button_view_model.dart';
import 'package:example/screens/ai/view_models/secondary_button_view_model.dart';
import 'package:example/screens/ai/view_models/tag_view_model.dart';
import 'package:example/screens/ai/view_models/text_view_model.dart';
import 'package:example/screens/ai/view_models/standard_text_field_view_model.dart';
import 'package:example/screens/ai/view_models/standard_tabs_view_model.dart';
import 'package:example/screens/ai/view_models/title_button_drop_down.dart';
import 'package:example/screens/ai/view_models/title_header_widget_view_model.dart';
import 'package:example/screens/ai/view_models/underline_tabs_view_model.dart';
import 'package:example/screens/ai/view_models/zero_screen_view_model.dart';
import 'package:example/storage/app_theme_storage.dart';
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
  final AppThemeStorage appThemeButtonStorage = AppThemeStorage();

  @override
  void initState() {
    super.initState();
    appThemeButtonStorage.setThemeButtonHidden(true);
  }

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
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.copy),
            tooltip: 'Copy json',
            onPressed: () {
              cubit.copyJSON();
            },
          ),
        ],
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
      case SecondaryButtonViewModel:
        return Align(
          alignment: Alignment.centerLeft,
          child: SecondaryButton(
              title: item.title,
              isEnable: item.isEnabled,
              sizeType: item.sizeType,
              iconData: item.iconData,
              iconPosition: item.iconPosition,
              onPressed: () => <Future<void>>{
                    cubit.didAction(widget.isLocal, item.actions, widget.onPush)
                  }),
        );
      case GhostButtonViewModel:
        return Align(
          alignment: Alignment.centerLeft,
          child: GhostButton(
              title: item.title,
              isEnable: item.isEnabled,
              sizeType: item.sizeType,
              iconData: item.iconData,
              iconPosition: item.iconPosition,
              onPressed: () => <Future<void>>{
                    cubit.didAction(widget.isLocal, item.actions, widget.onPush)
                  }),
        );
      case LinkControlViewModel:
        return LinkControl(
            title: item.title,
            isEnable: item.isEnabled,
            style: item.style,
            leadingImage: item.leadingIcon,
            trailingImage: item.trailingIcon,
            onPressed: () => <Future<void>>{
                  cubit.didAction(widget.isLocal, item.actions, widget.onPush)
                });
      case CheckBoxViewModel:
        return CheckBoxGroup(
          items: item.items,
          isEnabled: item.isEnabled,
          selectedValues: item.selectedValues,
          style: item.style ?? CheckboxStyle.normal,
          onChanged: ((Map<String, bool> _) {
            cubit.didAction(widget.isLocal, item.actions, widget.onPush);
          }),
        );
      case RadioButtonViewModel:
        return RadioGroup(
            items: item.items,
            isEnabled: item.isEnabled,
            style: item.style ?? CheckboxStyle.normal,
            onChanged: (_) => <Future<void>>{
                  cubit.didAction(widget.isLocal, item.actions, widget.onPush)
                });
      case TextViewModel:
        return Text(item.text);
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
            ));
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
      case BigInformerViewModel:
        return Container(
          child: BigInformerWidget(
            title: item.title,
            subtitle: item.subtitle,
            linkText: item.linkText,
            style: item.style,
            isEnable: item.isEnabled,
            onLinkPressed: () {}, // Добавить обработку action
          ),
        );
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
      case ExpandedViewModel:
        return Expanded(
          child: _buildView(
            ctx,
            0,
            colors,
            fonts,
            item.items,
          ),
        );

      case SliderTextFieldViewModel:
        return SliderTextField(
          item.controller,
          state: item.state,
          labelText: item.labelText,
          placeHolderText: item.placeHolderText,
          informerText: item.informerText,
          trailingText: item.trailingText,
          minLabelText: item.minLabelText,
          maxLabelText: item.maxLabelText,
          divisions: item.divisions,
          currentValue: item.currentSliderValue,
        );
      case DoubleSliderTextFieldViewModel:
        return DoubleSliderTextField(
          textControllerLeading: item.leadingController,
          textControllerTrailing: item.trailingController,
          state: item.state,
          labelText: item.labelText,
          placeholderFrom: item.placeholderFrom,
          placeholderTo: item.placeholderTo,
          informerText: item.informerText,
          trailingText: item.trailingText,
          minValue: item.minValue,
          maxValue: item.maxValue,
          divisions: item.divisions,
          currentRangeValues: item.currentRangeValues,
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
      case CalendarViewModel:
        switch (item.style) {
          case CalendarStyle.vertical:
            return CalendarVerticalView(
              selectedEndDate: item.selectedEndDate,
              selectedStartDate: item.selectedStartDate,
              startDate: item.startDate,
              currentDate: item.currentDate,
              endDate: item.endDate,
              onChangedRangeDates: (List<DateTime?> datesRange) {
                cubit.didAction(widget.isLocal, item.actions, widget.onPush);
              },
            );
          case CalendarStyle.horizontal:
            return CalendarHorizontalView(
              startDate: item.startDate,
              endDate: item.endDate,
              currentDate: item.currentDate,
              selectedEndDate: item.selectedEndDate,
              selectedStartDate: item.selectedStartDate,
              onChangedRangeDates: (List<DateTime?> datesRange) {
                cubit.didAction(widget.isLocal, item.actions, widget.onPush);
              },
            );
          default:
            return Container();
        }

      case ZeroScreenViewModel:
        return ZeroScreenView(
          // Добавить, чтобы иконка бралась из модели
          image: Assets.zeroScreen.success.image(),
          title: item.title,
          subTitle: item.subtitle,
          buttonTitle: item.buttonTitle,
          isEnabled: item.isEnabled,
        );
      case TagViewModel:
        return TagControlWidget(
            leadingText: item.leadingText,
            leadingImage: item.leadingIcon,
            title: item.title,
            trailingText: item.trailingText,
            trailingImage: item.trailingIcon,
            style: item.style,
            onPressed: () => <Future<void>>{
                  cubit.didAction(widget.isLocal, item.actions, widget.onPush)
                });
      case TitleButtonDropDownViewModel:
        return TitleButtonDropDownWidget(
            title: item.title,
            buttonTitle: item.buttonTitle,
            isEnable: item.isEnabled,
            onPressed: () => <Future<void>>{
                  cubit.didAction(widget.isLocal, item.actions, widget.onPush)
                });
      case ButtonDropDownViewModel:
        return ButtonDropDownWidget(
            buttonTitle: item.buttonTitle,
            isEnable: item.isEnabled,
            onPressed: () => <Future<void>>{
                  cubit.didAction(widget.isLocal, item.actions, widget.onPush)
                });
      case PaddingWidgetViewModel:
        return PaddingWidget(
          style: item.style,
        );
      case ParagraphViewModel:
        return ParagrapgWidget(
          title: item.title,
          paragraphImageType: item.paragraphImageType,
          trailingImageWidget: Icon(item.trailingIcon),
          textAligment: item.textAligment,
          paragraphStyle: item.paragraphStyle,
          isEnabled: item.isEnabled,
        );
      case BigInformerViewModel:
        return BigInformerWidget(
          title: item.title,
          subtitle: item.subtitle,
          linkText: item.linkText,
          onLinkPressed: () =>
              cubit.didAction(widget.isLocal, item.actions, widget.onPush),
          style: item.style,
          isEnable: item.isEnabled,
        );
      case SmallInformerViewModel:
        return SmallInformerWidget(
          title: item.title,
          style: item.style,
          arrowDirectionStyle: item.arrowDirectionStyle,
          isEnable: item.isEnabled,
        );
      case OutlineTabsViewModel:
        return OutlineTabs(
          item.tabs,
          selectedIndex: item.selectedIndex,
          isEnabled: item.isEnabled,
          horizontalPadding: item.horizontalPadding,
          onSelected: (_) {
            cubit.didAction(widget.isLocal, item.actions, widget.onPush);
          },
        );

      case LogoTabsViewModel:
        final List<Widget> images =
            item.iconsData.map<Widget>((dynamic iconData) {
          if (iconData is IconData) {
            return Icon(iconData);
          } else {
            return SizedBox();
          }
        }).toList();

        return LogoTabs(
          images,
          isEnabled: item.isEnabled,
          onSelected: (int index) =>
              cubit.didAction(widget.isLocal, item.actions, widget.onPush),
        );
      case UnderlineTabsViewModel:
        return UnderlineTabs(
          item.tabs,
          selectedIndex: item.selectedIndex,
          isEnable: item.isEnabled,
          horizontalPadding: item.horizontalPadding,
          isCenterTabs: item.isCenterTabs,
          onTap: (_) {
            cubit.didAction(widget.isLocal, item.actions, widget.onPush);
          },
        );
      case InformerTabsViewModel:
        return InformerTabs(
          item.tabs,
          selectedIndex: item.selectedIndex,
          isEnabled: item.isEnabled,
          paddingHorizontal: item.paddingHorizontal,
          onTap: (_) {
            cubit.didAction(widget.isLocal, item.actions, widget.onPush);
          },
        );

      default:
        return Container();
    }
  }
}
