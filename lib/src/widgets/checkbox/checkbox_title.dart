import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:admiralui_flutter/src/widgets/checkbox/checkbox.dart';
import 'package:flutter/material.dart';

/// This is a private class for creating each [CheckBoxTitle]
/// for the [CheckBoxGroup].
class CheckBoxTitle extends StatefulWidget {
  const CheckBoxTitle({
    required this.title,
    this.onChanged,
    this.isChecked,
    this.verticalPadding,
    required this.scheme,
    this.isEnabled = true,
  });

  final String title;
  final void Function(MapEntry<String, bool>)? onChanged;
  final bool? isChecked;
  final double? verticalPadding;
  final CheckboxScheme scheme;
  final bool isEnabled;

  @override
  State<StatefulWidget> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBoxTitle> {
  bool _isChecked = false;
  double _verticalPadding = LayoutGrid.halfModule;

  @override
  void initState() {
    _isChecked = widget.isChecked ?? false;
    _verticalPadding = widget.verticalPadding ?? LayoutGrid.halfModule;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClicked();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: _verticalPadding),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: LayoutGrid.tripleModule,
              height: LayoutGrid.tripleModule,
              child: CustomCheckBox(
                onChanged: () {
                  onClicked();
                },
                fillColor: widget.scheme.checkboxColor.unsafeParameter(
                  widget.isEnabled
                      ? ControlState.normal
                      : ControlState.disabled,
                ),
                value: _isChecked,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: LayoutGrid.module,
              ),
            ),
            Expanded(
              child: Text(
                widget.title,
                style: widget.scheme.textStyle,
                textAlign: TextAlign.start,
              ),
            )
          ],
        ),
      ),
    );
  }

  void onClicked() {
    setState(() {
      _isChecked = !_isChecked;
    });
    widget.onChanged?.call(MapEntry<String, bool>(widget.title, _isChecked));
  }
}
