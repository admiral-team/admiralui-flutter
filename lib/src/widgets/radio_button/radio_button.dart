import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

/// This is a private class for creating each [RadioButton] for the [RadioGroup]
class RadioButton extends StatelessWidget {
  const RadioButton({
    required this.title,
    required this.scheme,
    this.groupValue,
    this.onChanged,
    required this.isEnabled,
  });

  final String title;
  final RadioButtonScheme scheme;
  final String? groupValue;
  final void Function(String?)? onChanged;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged?.call(title);
      },
      child: _RadioTitle(
        title: title,
        groupValue: groupValue,
        onChanged: onChanged,
        scheme: scheme,
        isEnabled: isEnabled,
      ),
    );
  }
}

class _RadioTitle extends StatelessWidget {
  const _RadioTitle({
    required this.title,
    required this.scheme,
    this.groupValue,
    this.onChanged,
    required this.isEnabled,
  });

  final String title;
  final RadioButtonScheme scheme;
  final String? groupValue;
  final void Function(String?)? onChanged;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Radio<String>(
          groupValue: groupValue,
          onChanged: onChanged,
          fillColor: MaterialStateColor.resolveWith(
            (Set<MaterialState> states) {
              return scheme.radioColor.unsafeParameter(
                isEnabled ? ControlState.normal : ControlState.disabled,
              );
            },
          ),
          value: title,
        ),
        TextView(
          title,
          style: scheme.textStyle,
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
