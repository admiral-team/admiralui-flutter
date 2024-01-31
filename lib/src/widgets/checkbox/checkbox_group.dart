import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

///A Material Design checkbox.
///
/// Used to select a number of values. The values are of type [String],
/// the [CheckBoxTitle.title] parameter of the [CheckBoxTitle] class.
/// Enums are commonly used for this purpose.
///
/// The checkbox itself does not maintain any state. Instead, selecting the
/// radio invokes the [onChanged] callback, passing value as a parameter.
/// If [selectedValues] and [CheckBoxTitle.title] match, this checkbox
/// will be selected.
///
/// Most widgets will respond to [onChanged] by calling State.setState to update
/// the radio button's [selectedValues].
class CheckBoxGroup extends StatefulWidget {
  /// Creates a [CheckBoxTitle] group
  ///
  /// The [selectedValues] are the selected values. Must consist of
  /// the [items] value.The [items] are elements to contruct the group.
  ///
  /// [onChanged] will called every time a checkbox is selected. The clouser
  /// return the map of the selected items.
  /// [verticalPadding] represent the space between elements.
  const CheckBoxGroup({
    required this.items,
    this.selectedValues,
    this.onChanged,
    this.verticalPadding,
    this.checkboxScheme,
    this.isEnabled = true,
    this.style = CheckboxStyle.normal,
  });

  final List<String> items;
  final List<String>? selectedValues;
  final void Function(Map<String, bool>)? onChanged;
  final double? verticalPadding;
  final CheckboxScheme? checkboxScheme;
  final bool isEnabled;
  final CheckboxStyle style;

  @override
  State<StatefulWidget> createState() => _CheckBoxGroupState();
}

class _CheckBoxGroupState extends State<CheckBoxGroup> {
  Map<String, bool> allValues = <String, bool>{};

  @override
  void initState() {
    for (final String element in widget.items) {
      allValues[element] = widget.selectedValues?.contains(element) ?? false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);

    return Column(
      children: <Widget>[
        for (final String item in widget.items)
          SizedBox(
            child: CheckBoxTitle(
              title: item,
              onChanged: _onChangedAdapter,
              isChecked: widget.selectedValues?.contains(item) ?? false,
              scheme: widget.checkboxScheme ?? CheckboxScheme(theme: theme),
              verticalPadding: widget.verticalPadding,
              isEnabled: widget.isEnabled,
              style: widget.style,
            ),
          ),
      ],
    );
  }

  void _onChangedAdapter(MapEntry<String, bool> value) {
    allValues[value.key] = value.value;
    widget.onChanged?.call(allValues);
  }
}
