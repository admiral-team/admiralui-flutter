import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// This is a private class for creating each [RadioButton] for the [RadioGroup]
class RadioButton extends StatelessWidget {
  const RadioButton({
    required this.title,
    required this.scheme,
    required this.isEnabled,
    required this.style,
    this.groupValue,
    this.onChanged,
  });

  final String title;
  final RadioButtonScheme scheme;
  final bool isEnabled;
  final RadioButtonStyle style;
  final String? groupValue;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        onChanged?.call(title);
      },
      child: _RadioTitle(
        title: title,
        groupValue: groupValue,
        onChanged: onChanged,
        scheme: scheme,
        isEnabled: isEnabled,
        style: style,
      ),
    );
  }
}

class _RadioTitle extends StatelessWidget {
  const _RadioTitle({
    required this.title,
    required this.scheme,
    required this.isEnabled,
    required this.style,
    this.groupValue,
    this.onChanged,
  });

  final String title;
  final RadioButtonScheme scheme;
  final bool isEnabled;
  final RadioButtonStyle style;
  final String? groupValue;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Radio<String>(
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity,
          ),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          groupValue: groupValue,
          splashRadius: isEnabled ? null : 0,
          onChanged: (String? value) {
            onChanged?.call(value);
          },
          fillColor: MaterialStateColor.resolveWith(
            (Set<MaterialState> states) {
              return scheme.radioColor.unsafeParameter(
                isEnabled ? ControlState.normal : ControlState.disabled,
                style,
              );
            },
          ),
          value: title,
        ),
        SizedBox(
          width: LayoutGrid.module,
        ),
        TextView(
          title,
          font: scheme.textFont,
          textColorNormal: scheme.textColor.unsafeParameter(
            isEnabled ? ControlState.normal : ControlState.disabled,
            style,
          ),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
