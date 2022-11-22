import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:admiralui_flutter/src/widgets/radio_button/radio_button.dart';
import 'package:flutter/material.dart';

///A Material Design radio button.
///
/// Used to select between a number of mutually exclusive values. When one radio
/// button in a group is selected, the other radio buttons in the group cease to
/// be selected. The values are of type [String], the [RadioButton.title]
/// parameter of the [RadioButton] class. Enums are commonly used for
/// this purpose.
///
/// The radio button itself does not maintain any state. Instead, selecting the
/// radio invokes the [onChanged] callback, passing value as a parameter.
/// If [groupValue] and [RadioButton.title] match, this radio will be selected.
///
/// Most widgets will respond to [onChanged] by calling State.setState to update
/// the radio button's [groupValue].
class RadioGroup extends StatefulWidget {
  /// Creates a [RadioButton] group
  ///
  /// The [groupValue] is the selected value. Must be one of the [items]' value.
  /// The [items] are elements to contruct the group
  /// [onChanged] will called every time a radio is selected. The clouser
  /// return the selected item.
  /// [verticalPadding] represent the space between elements.
  const RadioGroup({
    required this.items,
    this.groupValue,
    this.onChanged,
    this.verticalPadding = 12,
    this.scheme,
    this.isEnabled = true,
  });

  final List<String> items;
  final String? groupValue;
  final void Function(String?)? onChanged;
  final double verticalPadding;
  final RadioButtonScheme? scheme;
  final bool isEnabled;

  @override
  State<StatefulWidget> createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  String? _groupValue;
  late RadioButtonScheme scheme;

  @override
  void initState() {
    super.initState();
    _groupValue = widget.groupValue;
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? RadioButtonScheme(theme: theme);

    return Column(
      children: <Widget>[
        for (String item in widget.items)
          SizedBox(
            height: LayoutGrid.module / 2 * 5 + widget.verticalPadding,
            child: RadioButton(
              title: item,
              groupValue: _groupValue,
              onChanged: _mergeFunction,
              scheme: scheme,
              isEnabled: widget.isEnabled,
            ),
          )
      ],
    );
  }

  void _mergeFunction(String? text) {
    widget.onChanged?.call(text);

    setState(() {
      _groupValue = text;
    });
  }
}
