import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:example/data/repository/interface/templates_repo.dart';
import 'package:example/domain/use_cases/template/interface/template_case.dart';
import 'package:example/models/template_details_model.dart';
import 'package:example/screens/ai/view_models/badge_view_model.dart';
import 'package:example/screens/ai/view_models/base_cell_view_model.dart';
import 'package:example/screens/ai/view_models/big_informer_view_model.dart';
import 'package:example/screens/ai/view_models/calendar_view_model.dart';
import 'package:example/screens/ai/view_models/button_drop_down_view_model.dart';
import 'package:example/screens/ai/view_models/check_box_view_model.dart';
import 'package:example/screens/ai/view_models/column_view_model.dart';
import 'package:example/screens/ai/view_models/expanded_view_model.dart';
import 'package:example/screens/ai/view_models/ghost_button_view_model.dart';
import 'package:example/screens/ai/view_models/double_slider_text_field_view_model.dart';
import 'package:example/screens/ai/view_models/icon_view_model.dart';
import 'package:example/screens/ai/view_models/informer_tabs_view_model.dart';
import 'package:example/screens/ai/view_models/interfaces/actions/action_item_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/actions/deeplink_action_model.dart';
import 'package:example/screens/ai/view_models/interfaces/actions/update_items_action_model.dart';
import 'package:example/screens/ai/view_models/interfaces/actions/update_page_action_model.dart';
import 'package:example/screens/ai/view_models/link_control_view_model.dart';
import 'package:example/screens/ai/view_models/logo_tabs_view_model.dart';
import 'package:example/screens/ai/view_models/outline_tabs_view_model.dart';
import 'package:example/screens/ai/view_models/padding_view_model.dart';
import 'package:example/screens/ai/view_models/paragraph_view_model.dart';
import 'package:example/screens/ai/view_models/primary_button_view_model.dart';
import 'package:example/screens/ai/view_models/radio_button_view_model.dart';
import 'package:example/screens/ai/view_models/row_view_model.dart';
import 'package:example/screens/ai/view_models/scroll_view_model.dart';
import 'package:example/screens/ai/view_models/secondary_button_view_model.dart';
import 'package:example/screens/ai/view_models/slider_text_field_view_model.dart';
import 'package:example/screens/ai/view_models/small_informer_view_model.dart';
import 'package:example/screens/ai/view_models/spacer_view_model.dart';
import 'package:example/screens/ai/view_models/tag_view_model.dart';
import 'package:example/screens/ai/view_models/text_view_model.dart';
import 'package:example/screens/ai/view_models/standard_text_field_view_model.dart';
import 'package:example/screens/ai/view_models/standard_tabs_view_model.dart';
import 'package:example/screens/ai/view_models/title_button_drop_down.dart';
import 'package:example/screens/ai/view_models/title_header_widget_view_model.dart';
import 'package:example/screens/ai/view_models/underline_tabs_view_model.dart';
import 'package:example/screens/ai/view_models/zero_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/src/response.dart';
import 'package:flutter/services.dart' show rootBundle;

class TemplateCaseImpl extends TemplateCase {
  TemplateCaseImpl(this._templatesRepository);
  final TemplatesRepository _templatesRepository;

  @override
  Future<TemplateDetailModel> getTemplate(
      bool isLocal, String templateName) async {
    if (isLocal) {
      try {
        final String response =
            await rootBundle.loadString('assets/templates/$templateName');
        final Map<String, dynamic> data = await json.decode(response);
        List<dynamic> items = _parseItems(data);
        return TemplateDetailModel(items: items, json: response);
      } catch (e) {
        print('Error parsing item: $e');
        return TemplateDetailModel(items: <dynamic>[]);
      }
    } else {
      final Response response =
          await _templatesRepository.getRemoteTemplate(templateName);
      if (response.statusCode == 200) {
        try {
          Map<String, dynamic> data = jsonDecode(response.body);
          // Костыль(ии иногда не добавляет блок data items)
          if (data['data']['data']['id'] != null ||
              data['data']['id'] != null) {
            data = <String, dynamic>{
              'data': <String, dynamic>{
                'data': <String, dynamic>{
                  'items': <dynamic>[data['data']]
                }
              }
            };
          }
          List<dynamic> items = _parseItems(data['data']);
          return TemplateDetailModel(items: items, json: response.body);
        } catch (e) {
          print('Error parsing item: $e');
          return TemplateDetailModel(items: <dynamic>[]);
        }
      } else {
        return TemplateDetailModel(items: <dynamic>[]);
      }
    }
  }

  List<ActionItemModelInterface>? _parseActions(Map<String, dynamic> data) {
    final dynamic actions = data['actions'];
    if (actions == null) {
      return null;
    }
    List<ActionItemModelInterface> actionItems = <ActionItemModelInterface>[];

    for (dynamic item in actions) {
      try {
        final String actionName = item['actionName'];
        final String type = item['type'];
        switch (type) {
          case 'deeplink':
            final String link = item['data']['link'];
            actionItems.add(DeeplinkActionModel(
                link: link, type: type, actionName: actionName));
            break;
          case 'updateItems':
            if (item.containsKey('data') && item['data'].containsKey('items')) {
              final List<dynamic> updateItems = _parseItems(item);

              actionItems.add(UpdateItemsActionModel(
                  items: updateItems, type: type, actionName: actionName));
            }
            break;
          case 'updatePage':
            final String link = item['data']['link'];
            actionItems.add(UpdatePageActionModel(
                link: link, type: type, actionName: actionName));
            break;
          default:
            break;
        }
      } catch (e) {
        // Handle the error if parsing fails
        print('Error parsing action: $e');
      }
    }
    return actionItems;
  }

  List<dynamic> _parseItems(Map<String, dynamic> data) {
    List<dynamic> items = data['data']['items'].map((dynamic item) {
      try {
        String id = item?['id'] ?? '0';
        double? width = (item?['layout']?['width'] as num?)?.toDouble();
        double? height = (item?['layout']?['height'] as num?)?.toDouble();
        List<ActionItemModelInterface>? actions = _parseActions(item);
        switch (item['type']) {
          case 'primary_button':
            final dynamic sizeTypeJSON = item['data']['sizeType'];
            ButtonSizeType sizeType;
            switch (sizeTypeJSON) {
              case 'small':
                sizeType = ButtonSizeType.small;
                break;
              case 'medium':
                sizeType = ButtonSizeType.medium;
                break;
              case 'big':
                sizeType = ButtonSizeType.big;
                break;
              case 'custom':
                if (width != null && height != null) {
                  sizeType = ButtonSizeType.custom(width, height);
                } else {
                  sizeType = ButtonSizeType.big;
                }
                break;
              default:
                sizeType = ButtonSizeType.big;
            }

            IconData? iconData;
            if (item['data']['iconData'] != null) {
              iconData = _parseIconData(item['data']['iconData']);
            }

            IconPosition? iconPosition;
            if (item['data']['iconPosition'] != null) {
              switch (item['data']['iconPosition']) {
                case 'left':
                  iconPosition = IconPosition.left;
                  break;
                case 'right':
                  iconPosition = IconPosition.right;
                  break;
                default:
                  iconPosition = IconPosition.left;
              }
            }

            return PrimaryButtonViewModel(
                id: id,
                title: item['data']['title'],
                isEnabled: item['data']['isEnabled'] ?? true,
                sizeType: sizeType,
                iconData: iconData,
                iconPosition: iconPosition,
                actions: actions);
          case 'secondary_button':
            final dynamic sizeTypeJSON = item['data']['sizeType'];
            ButtonSizeType sizeType;
            switch (sizeTypeJSON) {
              case 'small':
                sizeType = ButtonSizeType.small;
                break;
              case 'medium':
                sizeType = ButtonSizeType.medium;
                break;
              case 'big':
                sizeType = ButtonSizeType.big;
                break;
              case 'custom':
                if (width != null && height != null) {
                  sizeType = ButtonSizeType.custom(width, height);
                } else {
                  sizeType = ButtonSizeType.big;
                }
                break;
              default:
                sizeType = ButtonSizeType.big;
            }

            IconData? iconData;
            if (item['data']['iconData'] != null) {
              iconData = _parseIconData(item['data']['iconData']);
            }

            IconPosition? iconPosition;
            if (item['data']['iconPosition'] != null) {
              switch (item['data']['iconPosition']) {
                case 'left':
                  iconPosition = IconPosition.left;
                  break;
                case 'right':
                  iconPosition = IconPosition.right;
                  break;
                default:
                  iconPosition = IconPosition.left;
              }
            }

            return SecondaryButtonViewModel(
                id: id,
                title: item['data']['title'],
                isEnabled: item['data']['isEnabled'] ?? true,
                sizeType: sizeType,
                iconData: iconData,
                iconPosition: iconPosition,
                actions: actions);
          case 'ghost_button':
            final dynamic sizeTypeJSON = item['data']['sizeType'];
            ButtonSizeType sizeType;
            switch (sizeTypeJSON) {
              case 'small':
                sizeType = ButtonSizeType.small;
                break;
              case 'medium':
                sizeType = ButtonSizeType.medium;
                break;
              case 'big':
                sizeType = ButtonSizeType.big;
                break;
              case 'custom':
                if (width != null && height != null) {
                  sizeType = ButtonSizeType.custom(width, height);
                } else {
                  sizeType = ButtonSizeType.big;
                }
                break;
              default:
                sizeType = ButtonSizeType.big;
            }

            IconData? iconData;
            if (item['data']['iconData'] != null) {
              iconData = _parseIconData(item['data']['iconData']);
            }

            IconPosition? iconPosition;
            if (item['data']['iconPosition'] != null) {
              switch (item['data']['iconPosition']) {
                case 'left':
                  iconPosition = IconPosition.left;
                  break;
                case 'right':
                  iconPosition = IconPosition.right;
                  break;
                default:
                  iconPosition = IconPosition.left;
              }
            }
            return GhostButtonViewModel(
                id: id,
                title: item['data']['title'],
                isEnabled: item['data']['isEnabled'] ?? true,
                sizeType: sizeType,
                iconData: iconData,
                iconPosition: iconPosition,
                actions: actions);
          case 'big_informer':
            InformerStyle style;
            switch (item['data']['style']) {
              case 'normal':
                style = InformerStyle.normal;
                break;
              case 'success':
                style = InformerStyle.success;
                break;
              case 'error':
                style = InformerStyle.error;
                break;
              case 'attention':
                style = InformerStyle.attention;
                break;
              default:
                style = InformerStyle.normal;
            }
            return BigInformerViewModel(
                title: item['data']['title'] ?? '',
                subtitle: item['data']['subtitle'] ?? '',
                style: style,
                linkText: item['data']['linkText'],
                isEnabled: item['data']['isEnabled'] ?? true,
                id: id);
          case 'link_control':
            final dynamic linkControllStyleJSON = item['data']['style'];
            LinkStyle linkControllStyle;
            switch (linkControllStyleJSON) {
              case 'normal':
                linkControllStyle = LinkStyle.normal;
                break;
              case 'medium':
                linkControllStyle = LinkStyle.medium;
                break;
              default:
                linkControllStyle = LinkStyle.normal;
            }

            IconData? leadingIconData;
            if (item['data']['leadingIconData'] != null) {
              leadingIconData = _parseIconData(item['data']['leadingIconData']);
            }

            IconData? trailingIconData;
            if (item['data']['trailingIconData'] != null) {
              trailingIconData =
                  _parseIconData(item['data']['trailingIconData']);
            }

            return LinkControlViewModel(
                id: id,
                title: item['data']['title'],
                isEnabled: item['data']['isEnabled'] ?? true,
                style: linkControllStyle,
                leadingIcon: leadingIconData,
                trailingIcon: trailingIconData,
                actions: actions);
          case 'check_box':
            final dynamic checkBoxStyleJSON = item['data']['style'];
            CheckboxStyle checkBoxStyle;
            switch (checkBoxStyleJSON) {
              case 'normal':
                checkBoxStyle = CheckboxStyle.normal;
                break;
              case 'error':
                checkBoxStyle = CheckboxStyle.error;
                break;
              default:
                checkBoxStyle = CheckboxStyle.normal;
            }
            List<String> checkBoxItems =
                List<String>.from(item['data']['items'] ?? <dynamic>[]);
            if (checkBoxItems.isEmpty) {
              checkBoxItems = <String>[''];
            }
            return CheckBoxViewModel(
                id: id,
                items: checkBoxItems,
                isEnabled: item['data']['isEnabled'] ?? true,
                style: checkBoxStyle,
                actions: actions);
          case 'radio_button':
            final dynamic radioButtonStyleJSON = item['data']['style'];
            RadioButtonStyle radioButtonStyle;
            switch (radioButtonStyleJSON) {
              case 'normal':
                radioButtonStyle = RadioButtonStyle.normal;
                break;
              case 'error':
                radioButtonStyle = RadioButtonStyle.error;
                break;
              default:
                radioButtonStyle = RadioButtonStyle.normal;
            }
            List<String> checkBoxItems =
                List<String>.from(item['data']['items'] ?? <dynamic>[]);
            if (checkBoxItems.isEmpty) {
              checkBoxItems = <String>[''];
            }
            return RadioButtonViewModel(
                id: id,
                items: checkBoxItems,
                isEnabled: item['data']['isEnabled'] ?? true,
                style: radioButtonStyle,
                actions: actions);
          case 'spacer':
            return SpacerViewModel(id: id, width: width, height: height);
          case 'scroll_view':
            Axis direction = Axis.vertical;
            switch (item['data']['scroll_direction']) {
              case 'vertical':
                direction = Axis.vertical;
                break;
              case 'horizontal':
                direction = Axis.horizontal;
                break;
              default:
                direction = Axis.vertical;
            }
            return ScrollViewModel(
                id: id,
                items: _parseItems(item),
                scrollDirection: direction,
                width: width,
                height: height);
          case 'title_header_widget':
            TitleHeaderStyle style = TitleHeaderStyle.title;
            switch (item['data']['style']) {
              case 'title':
                style = TitleHeaderStyle.title;
                break;
              case 'subtitle':
                style = TitleHeaderStyle.subtitle;
                break;
              case 'headline':
                style = TitleHeaderStyle.headline;
                break;
              case 'headlineSecondary':
                style = TitleHeaderStyle.headlineSecondary;
                break;
              default:
                style = TitleHeaderStyle.title;
            }
            return TitleHeaderWidgetViewModel(
                id: id,
                text: item['data']['text'],
                style: style,
                textAlign: _textAlign(item),
                width: width,
                height: height);
          case 'zero_screen_view':
            return ZeroScreenViewModel(
                id: id,
                title: item['data']['title'] ?? '',
                subtitle: item['data']['subtitle'] ?? '',
                buttonTitle: item['data']['buttonTitle'] ?? '',
                isEnabled: item['data']['isEnabled'] ?? true);
          case 'slider_text_field':
            TextEditingController textController =
                TextEditingController(text: item['data']['text']);
            TextInputState state = _getTextInputState(item);
            return SliderTextFieldViewModel(
                id: id,
                controller: textController,
                labelText: item['data']['label_text'] ?? '',
                placeHolderText: item['data']['placeholder_text'] ?? '',
                informerText: item['data']['informer_text'],
                minLabelText: item['data']['minLabelText'] ?? 0.0,
                maxLabelText: item['data']['maxLabelText'] ?? 0.0,
                divisions: (item['data']['divisions'] ??
                        item['data']['maxLabelText']) ??
                    1,
                trailingText: item['data']['trailingText'] ?? '',
                currentSliderValue: item['data']['currentSliderValue'],
                state: state,
                width: width,
                height: height);
          case 'double_slider_text_field':
            TextEditingController leftTextController =
                TextEditingController(text: item['data']['left_text']);
            TextEditingController rightTextController =
                TextEditingController(text: item['data']['right_text']);
            TextInputState state = _getTextInputState(item);
            dynamic minValue = item['data']['minValue'] ?? 0.0;
            dynamic maxValue = item['data']['maxValue'] ?? 0.0;
            dynamic minCurrentSliderValue =
                item['data']['minCurrentSliderValue'] ?? 0.0;
            dynamic maxCurrentSliderValue =
                item['data']['maxCurrentSliderValue'] ?? 0.0;
            dynamic currentRangeValues = RangeValues(
                minCurrentSliderValue.toDouble(),
                maxCurrentSliderValue.toDouble());
            print(currentRangeValues);
            print(state);
            return DoubleSliderTextFieldViewModel(
                id: id,
                leadingController: leftTextController,
                trailingController: rightTextController,
                labelText: item['data']['label_text'] ?? '',
                informerText: item['data']['informer_text'] ?? '',
                minValue: minValue.toDouble(),
                maxValue: maxValue.toDouble(),
                divisions: (item['data']['divisions'] ??
                        item['data']['maxLabelText']) ??
                    1,
                trailingText: item['data']['trailingText'] ?? '',
                currentRangeValues: currentRangeValues,
                placeholderFrom: item['data']['placeholderFrom'] ?? '',
                placeholderTo: item['data']['placeholderTo'] ?? '',
                state: state,
                width: width,
                height: height);
          case 'standard_text_field':
            TextEditingController textController =
                TextEditingController(text: item['data']['text'].toString());
            TextInputState state = _getTextInputState(item);
            int? numberOfLines = 1;
            if (item['data']['number_of_lines'] == 0) {
              numberOfLines = null;
            } else if (item['data']['number_of_lines'] != null) {
              numberOfLines = item['data']['number_of_lines'] ?? 1;
            }
            String labelText = item['data']['label_text'] ?? '';
            String placeHolderText = item['data']['placeholder_text'] ?? '';
            String informerText = item['data']['informer_text'] ?? '';
            bool isSecure = item['data']['is_secure'] ?? false;
            return StandardTextFieldViewModel(
                id: id,
                controller: textController,
                labelText: labelText.toString(),
                placeHolderText: placeHolderText.toString(),
                informerText: informerText,
                isSecure: isSecure,
                numberOfLines: numberOfLines,
                state: state,
                width: width,
                height: height);
          case 'row':
            return RowViewModel(
                id: id, items: _parseItems(item), width: width, height: height);
          case 'column':
            return ColumnViewModel(
                id: id, items: _parseItems(item), width: width, height: height);
          case 'expanded':
            return ExpandedViewModel(id: id, items: _parseItems(item));
          case 'text':
            return TextViewModel(
                id: id,
                text: item['data']['text'],
                width: width,
                height: height);
          case 'standard_tabs':
            List<dynamic> standardTabsItems = item['items'];
            final List<String> titleItems = standardTabsItems
                .map((dynamic e) => e['title'].toString())
                .toList();
            return StandardTabsViewModel(
                items: titleItems, id: id, actions: actions);
          case 'calendar':
            return _parseCalendar(item, id, actions);
          case 'tag_control':
            final dynamic tagStyleJSON = item['data']['style'];
            TagStyle tagStyle;
            switch (tagStyleJSON) {
              case 'normal':
                tagStyle = TagStyle.normal;
                break;
              case 'success':
                tagStyle = TagStyle.success;
                break;
              case 'additional':
                tagStyle = TagStyle.additional;
                break;
              case 'error':
                tagStyle = TagStyle.error;
                break;
              case 'attention':
                tagStyle = TagStyle.attention;
                break;
              default:
                tagStyle = TagStyle.normal;
            }

            IconData? leadingIcon;
            if (item['data']['leadingIcon'] != null) {
              leadingIcon = _parseIconData(item['data']['leadingIcon']);
            }

            IconData? trailingIcon;
            if (item['data']['trailingIcon'] != null) {
              trailingIcon = _parseIconData(item['data']['trailingIcon']);
            }

            return TagViewModel(
              id: id,
              isEnabled: item['data']['isEnabled'],
              style: tagStyle,
              leadingText: item['data']['leadingText'],
              leadingIcon: leadingIcon,
              title: item['data']['title'],
              trailingText: item['data']['trailingText'],
              trailingIcon: trailingIcon,
              actions: actions,
            );

          case 'title_button_drop_down':
            return TitleButtonDropDownViewModel(
                id: id,
                title: item['data']['title'],
                buttonTitle: item['data']['buttonTitle'],
                isEnabled: item['data']['isEnabled'] ?? true,
                actions: actions);
          case 'button_drop_down':
            return ButtonDropDownViewModel(
                id: id,
                buttonTitle: item['data']['buttonTitle'],
                isEnabled: item['data']['isEnabled'] ?? true,
                actions: actions);
          case 'paragraph_view':
            ParagraphLeadingImageType? paragraphImageType;
            if (item['data']['paragraphImageType'] != null) {
              switch (item['data']['paragraphImageType']) {
                case 'point':
                  paragraphImageType = ParagraphLeadingImageType.point;
                  break;
                case 'check':
                  paragraphImageType = ParagraphLeadingImageType.check;
                  break;
                default:
                  paragraphImageType = null;
              }
            }

            ParagraphStyle paragraphStyle;
            switch (item['data']['paragraphStyle']) {
              case 'secondary':
                paragraphStyle = ParagraphStyle.secondary;
                break;
              case 'primary':
              default:
                paragraphStyle = ParagraphStyle.primary;
            }

            IconData? trailingIcon;
            if (item['data']['trailingIcon'] != null) {
              trailingIcon = _parseIconData(item['data']['trailingIcon']);
            }

            return ParagraphViewModel(
              id: id,
              title: item['data']['title'],
              paragraphImageType: paragraphImageType,
              trailingIcon: trailingIcon,
              textAligment: _textAlign(item),
              paragraphStyle: paragraphStyle,
              isEnabled: item['data']['isEnabled'] ?? true,
            );
          case 'big_informer':
            return BigInformerViewModel(
              id: id,
              title: item['data']['title'],
              subtitle: item['data']['subtitle'],
              linkText: item['data']['linkText'],
              isEnabled: item['data']['isEnabled'] ?? true,
              style: _parseInformerStyle(item['data']['style']),
              actions: actions,
            );
          case 'small_informer':
            return SmallInformerViewModel(
              id: id,
              title: item['data']['title'],
              style: _parseInformerStyle(item['data']['style']),
              arrowDirectionStyle: _parseInformerDirectionStyle(
                  item['data']['arrowDirectionStyle']),
              isEnabled: item['data']['isEnabled'] ?? true,
              actions: actions,
            );
          case 'outline_tabs':
            List<dynamic> tabs = item['data']['items'];
            final List<OutlineTabItem> outlineTabItems = <OutlineTabItem>[];
            tabs.forEach((dynamic tab) {
              final String text = tab['text'].toString();

              BadgeStyle badgeStyle = _getTabBadgeStyle(tab['badgeStyle']);
              outlineTabItems.add(OutlineTabItem(text, badgeStyle: badgeStyle));
            });

            final int selectedIndex = item['data']['selectedIndex'] ?? 0;
            final bool isEnabled = item['data']['isEnabled'] ?? true;
            final double horizontalPadding =
                item['data']['horizontalPadding']?.toDouble() ?? 0.0;

            return OutlineTabsViewModel(
              tabs: outlineTabItems,
              selectedIndex: selectedIndex,
              isEnabled: isEnabled,
              horizontalPadding: horizontalPadding,
              id: id,
              actions: actions,
            );
          case 'logo_tabs':
            List<IconData> iconsData =
                (item['data']['iconsData'] as List<dynamic>)
                    .map<IconData?>((dynamic icon) =>
                        _parseIconData(icon as Map<String, dynamic>))
                    .whereType<IconData>()
                    .toList();
            return LogoTabsViewModel(
              id: id,
              iconsData: iconsData,
              isEnabled: item['data']['isEnabled'] ?? true,
              actions: actions,
            );
          case 'padding_widget':
            PaddingStyle paddingStyle;
            switch (item['data']['style']) {
              case 'long':
                paddingStyle = PaddingStyle.long;
                break;
              case 'short':
              default:
                paddingStyle = PaddingStyle.short;
            }
            return PaddingWidgetViewModel(id: id, style: paddingStyle);
          case 'underline_tabs':
            List<dynamic> tabs = item['data']['items'];
            final List<UnderlineTabItem> underlineTabItems =
                <UnderlineTabItem>[];

            tabs.forEach((dynamic tab) {
              final String text = tab['text'].toString();
              final BadgeStyle badgeStyle =
                  _getTabBadgeStyle(tab['badgeStyle']);

              underlineTabItems
                  .add(UnderlineTabItem(text, badgeStyle: badgeStyle));
            });

            final int selectedIndex = item['data']['selectedIndex'] ?? 0;
            final bool isEnabled = item['data']['isEnabled'] ?? true;
            final bool isCenterTabs = item['data']['isCenterTabs'] ?? true;
            final double horizontalPadding =
                item['data']['horizontalPadding']?.toDouble() ?? 0.0;

            return UnderlineTabsViewModel(
              tabs: underlineTabItems,
              selectedIndex: selectedIndex,
              isEnabled: isEnabled,
              isCenterTabs: isCenterTabs,
              horizontalPadding: horizontalPadding,
              id: id,
              actions: actions,
            );
          case 'informer_tabs':
            List<dynamic> items = item['data']['items'];
            final List<InformerTabItem> informerTabItems = <InformerTabItem>[];

            items.forEach((dynamic tab) {
              final String title = tab['title'].toString();
              final String subtitle = tab['subtitle'].toString();

              informerTabItems.add(InformerTabItem(title, subtitle));
            });

            final int selectedIndex = item['data']['selectedIndex'] ?? 0;
            final bool isEnabled = item['data']['isEnabled'] ?? true;
            final double paddingHorizontal =
                item['data']['paddingHorizontal']?.toDouble() ?? 0.0;

            return InformerTabsViewModel(
              tabs: informerTabItems,
              selectedIndex: selectedIndex,
              isEnabled: isEnabled,
              paddingHorizontal: paddingHorizontal,
              id: id,
              actions: actions,
            );

          case 'badge':
            BadgeStyle badgeStyle;
            switch (item['data']['style']) {
              case 'natural':
                badgeStyle = BadgeStyle.natural;
                break;
              case 'additional':
                badgeStyle = BadgeStyle.additional;
                break;
              case 'success':
                badgeStyle = BadgeStyle.success;
                break;
              case 'error':
                badgeStyle = BadgeStyle.error;
                break;
              case 'attention':
                badgeStyle = BadgeStyle.attention;
                break;
              case 'clear':
                badgeStyle = BadgeStyle.clear;
                break;
              case 'normal':
              default:
                badgeStyle = BadgeStyle.normal;
            }

            final bool isEnabled = item['data']['isEnabled'] ?? true;
            final String? title = item['data']['title'];

            return BadgeViewModel(
              id: id,
              style: badgeStyle,
              isEnabled: isEnabled,
              title: title == '' ? null : title,
            );
          case 'base_cell':
            return BaseCellViewModel(
              leadingCell: _parseItems(item['data']['leadingCell']),
              centerCell: _parseItems(item['data']['centerCell']),
              trailingCell: _parseItems(item['data']['trailingCell']),
              borderRadius: item['data']['borderRadius'] ?? 0.0,
              isEnabled: item['data']['isEnabled'] ?? true,
              id: id,
              horizontalPadding: item['data']['horizontalPadding'] ?? 0.0,
              actions: actions,
            );

          case 'icon':
            IconData? iconData;
            if (item['data']['iconData'] != null) {
              iconData = _parseIconData(item['data']['iconData']);
            }

            final double? size = item['data']['size'];
            final String? colorHex = item['data']['color'];
            Color? color;
            if (colorHex != null) {
              color = _parseColor(colorHex);
            }

            return IconViewModel(
              id: id,
              iconData: iconData,
              size: size,
              color: color,
            );

          default:
            return null;
        }
      } catch (e) {
        print('Error parsing item: $e');
        return null;
      }
    }).toList();
    return items;
  }

  TextInputState _getTextInputState(Map<String, dynamic> item) {
    TextInputState state = TextInputState.normal;
    switch (item['data']['state']) {
      case 'normal':
        state = TextInputState.normal;
        break;
      case 'error':
        state = TextInputState.error;
        break;
      case 'disabled':
        state = TextInputState.disabled;
        break;
      case 'readOnly':
        state = TextInputState.readOnly;
        break;
      default:
        state = TextInputState.normal;
    }
    return state;
  }

  IconData? _parseIconData(Map<String, dynamic> iconData) {
    final int codePoint = int.parse(iconData['codePoint']);
    final String? fontFamily = iconData['fontFamily'];
    if (codePoint < 0 || codePoint > 0x10FFFF) {
      return null;
    }
    return IconData(0xef4e, fontFamily: fontFamily);
  }

  CalendarViewModel _parseCalendar(Map<String, dynamic> item, String id,
      List<ActionItemModelInterface>? actions) {
    CalendarStyle style;
    switch (item['data']['style']) {
      case 'horizontal':
        style = CalendarStyle.horizontal;
        break;
      case 'vertical':
      default:
        style = CalendarStyle.vertical;
    }

    DateTime? parseDate(String? dateString) {
      if (dateString != null && dateString.isNotEmpty) {
        List<String> parts = dateString.split('.');
        if (parts.length == 3) {
          int day = int.parse(parts[0]);
          int month = int.parse(parts[1]);
          int year = int.parse(parts[2]);
          return DateTime(year, month, day);
        }
      }
      return null;
    }

    return CalendarViewModel(
      id: id,
      style: style,
      startDate: parseDate(item['data']['startDate']),
      currentDate: parseDate(item['data']['currentDate']),
      endDate: parseDate(item['data']['endDate']),
      selectedStartDate: parseDate(item['data']['selectedStartDate']),
      selectedEndDate: parseDate(item['data']['selectedEndDate']),
    );
  }

  TextAlign _textAlign(Map<String, dynamic> item) {
    TextAlign textAlign = TextAlign.left;
    switch (item['data']['textAligment']) {
      case 'center':
        textAlign = TextAlign.center;
        break;
      case 'right':
        textAlign = TextAlign.right;
        break;
      case 'justify':
        textAlign = TextAlign.justify;
        break;
      case 'left':
      default:
        textAlign = TextAlign.left;
    }
    return textAlign;
  }

  InformerStyle _parseInformerStyle(String? style) {
    switch (style) {
      case 'success':
        return InformerStyle.success;
      case 'error':
        return InformerStyle.error;
      case 'attention':
        return InformerStyle.attention;
      case 'normal':
      default:
        return InformerStyle.normal;
    }
  }

  InformerDirectionStyle _parseInformerDirectionStyle(String directionStyle) {
    switch (directionStyle) {
      case 'topLeft':
        return InformerDirectionStyle.topLeft;
      case 'topRight':
        return InformerDirectionStyle.topRight;
      case 'bottomLeft':
        return InformerDirectionStyle.bottomLeft;
      case 'bottomRight':
        return InformerDirectionStyle.bottomRight;
      default:
        return InformerDirectionStyle.topLeft;
    }
  }

  BadgeStyle _getTabBadgeStyle(String? style) {
    switch (style) {
      case 'natural':
        return BadgeStyle.natural;
      case 'normal':
        return BadgeStyle.normal;
      case 'additional':
        return BadgeStyle.additional;
      case 'success':
        return BadgeStyle.success;
      case 'error':
        return BadgeStyle.error;
      case 'attention':
        return BadgeStyle.attention;
      default:
        return BadgeStyle.clear;
    }
  }

  Color _parseColor(String colorHex) {
    colorHex = colorHex.replaceAll('#', '');
    if (colorHex.length == 6) {
      colorHex = 'FF' + colorHex;
    }
    return Color(int.parse(colorHex, radix: 16));
  }
}
