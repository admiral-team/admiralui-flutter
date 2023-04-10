import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:admiralui_flutter/src/widgets/checkbox/checkbox.dart';
import 'package:flutter/material.dart';

/// This is a private class for creating each [CheckBoxTitle]
/// for the [CheckBoxGroup].
class CheckBoxTitle extends StatefulWidget {
  const CheckBoxTitle({
    required this.title,
    this.style = CheckboxStyle.normal,
    this.isChecked,
    this.verticalPadding,
    this.isEnabled = true,
    this.scheme,
    this.onChanged,
  });

  final String title;
  final CheckboxScheme? scheme;
  final CheckboxStyle style;
  final void Function(MapEntry<String, bool>)? onChanged;
  final bool? isChecked;
  final double? verticalPadding;
  final bool isEnabled;

  @override
  State<StatefulWidget> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBoxTitle> {
  bool _isChecked = false;
  double _verticalPadding = LayoutGrid.halfModule;
  late CheckboxScheme scheme;

  @override
  void initState() {
    _isChecked = widget.isChecked ?? false;
    _verticalPadding = widget.verticalPadding ?? LayoutGrid.halfModule;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? CheckboxScheme(theme: theme);

    return InkWell(
      splashColor: widget.isEnabled ? null : Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        if (widget.isEnabled) {
          onClicked();
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: _verticalPadding),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: LayoutGrid.tripleModule,
              height: LayoutGrid.tripleModule,
              child: CustomCheckBox(
                fillColor: scheme.checkboxColor.unsafeParameter(
                  widget.isEnabled
                      ? ControlState.normal
                      : ControlState.disabled,
                  widget.style,
                ),
                value: _isChecked,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                right: LayoutGrid.module,
              ),
            ),
            TextView(
              widget.title,
              font: scheme.textFont,
              textColorNormal: scheme.textColor.unsafeParameter(
                widget.isEnabled ? ControlState.normal : ControlState.disabled,
                widget.style,
              ),
              textAlign: TextAlign.start,
            ),
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
