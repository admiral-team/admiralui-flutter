import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:example/data/repository/interface/templates_repo.dart';
import 'package:example/domain/use_cases/template/interface/template_case.dart';
import 'package:example/models/template_details_model.dart';
import 'package:example/screens/ai/view_models/check_box_view_model.dart';
import 'package:example/screens/ai/view_models/column_view_model.dart';
import 'package:example/screens/ai/view_models/expanded_view_model.dart';
import 'package:example/screens/ai/view_models/ghost_button_view_model.dart';
import 'package:example/screens/ai/view_models/double_slider_text_field_view_model.dart';
import 'package:example/screens/ai/view_models/interfaces/actions/action_item_model_interface.dart';
import 'package:example/screens/ai/view_models/interfaces/actions/deeplink_action_model.dart';
import 'package:example/screens/ai/view_models/interfaces/actions/update_items_action_model.dart';
import 'package:example/screens/ai/view_models/interfaces/actions/update_page_action_model.dart';
import 'package:example/screens/ai/view_models/link_control_view_model.dart';
import 'package:example/screens/ai/view_models/primary_button_view_model.dart';
import 'package:example/screens/ai/view_models/radio_button_view_model.dart';
import 'package:example/screens/ai/view_models/row_view_model.dart';
import 'package:example/screens/ai/view_models/scroll_view_model.dart';
import 'package:example/screens/ai/view_models/secondary_button_view_model.dart';
import 'package:example/screens/ai/view_models/slider_text_field_view_model.dart';
import 'package:example/screens/ai/view_models/spacer_view_model.dart';
import 'package:example/screens/ai/view_models/text_view_model.dart';
import 'package:example/screens/ai/view_models/standard_text_field_view_model.dart';
import 'package:example/screens/ai/view_models/standard_tabs_view_model.dart';
import 'package:example/screens/ai/view_models/title_header_widget_view_model.dart';
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
        return TemplateDetailModel(items: items);
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
          List<dynamic> items = _parseItems(data['data']);
          return TemplateDetailModel(items: items);
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
        String id = item?['id'];
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
                isEnabled: item['data']['isEnabled'],
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
                isEnabled: item['data']['isEnabled'],
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
                isEnabled: item['data']['isEnabled'],
                sizeType: sizeType,
                iconData: iconData,
                iconPosition: iconPosition,
                actions: actions);
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
                isEnabled: item['data']['isEnabled'],
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
                isEnabled: item['data']['isEnabled'],
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
                isEnabled: item['data']['isEnabled'],
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
            TextAlign textAlign = TextAlign.left;
            // ВЫНЕСТИ ПОТОМ В ОТДЕЛЬНЫЙ МЕТОД
            switch (item['data']['textAlign']) {
              case 'left':
                textAlign = TextAlign.left;
                break;
              case 'center':
                textAlign = TextAlign.center;
                break;
              case 'right':
                textAlign = TextAlign.right;
                break;
              default:
                textAlign = TextAlign.left;
            }
            return TitleHeaderWidgetViewModel(
                id: id,
                text: item['data']['text'],
                style: style,
                textAlign: textAlign,
                width: width,
                height: height);
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
                minLabelText: item['data']['minLabelText'],
                maxLabelText: item['data']['maxLabelText'],
                divisions: (item['data']['divisions'] 
                ?? item['data']['maxLabelText']) ?? 1,
                trailingText: item['data']['trailingText'],
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
            return DoubleSliderTextFieldViewModel(
                id: id,
                leadingController: leftTextController,
                trailingController: rightTextController,
                labelText: item['data']['label_text'] ?? '',
                informerText: item['data']['informer_text'],
                minValue: item['data']['minValue'],
                maxValue: item['data']['maxValue'],
                divisions: (item['data']['divisions'] 
                ?? item['data']['maxLabelText']) ?? 1,
                trailingText: item['data']['trailingText'],
                currentRangeValues: RangeValues(
                  item['data']['minCurrentSliderValue'] ?? 0.0,
                   item['data']['maxCurrentSliderValue'] ?? 0.0
                ),
                placeholderFrom: item['data']['placeholderFrom'] ?? '',
                placeholderTo: item['data']['placeholderTo'] ?? '',
                state: state,
                width: width,
                height: height);
          case 'standard_text_field':
            TextEditingController textController =
                TextEditingController(text: item['data']['text']);
            TextInputState state = _getTextInputState(item);
            int? numberOfLines = 1;
            if (item['data']['number_of_lines'] == 0) {
              numberOfLines = null;
            } else if (item['data']['number_of_lines'] != null) {
              numberOfLines = item['data']['number_of_lines'] ?? 1;
            }
            return StandardTextFieldViewModel(
                id: id,
                controller: textController,
                labelText: item['data']['label_text'] ?? '',
                placeHolderText: item['data']['placeholder_text'] ?? '',
                informerText: item['data']['informer_text'],
                isSecure: item['data']['is_secure'] ?? false,
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
            final dynamic child = _parseItems(<String, dynamic>{
              'data': <String, dynamic>{
                'items': <dynamic>[item['data']['child']]
              }
            });
            return ExpandedViewModel(
                id: id, child: child.isNotEmpty ? child.first : null);
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
    return IconData(codePoint, fontFamily: fontFamily);
  }
}
