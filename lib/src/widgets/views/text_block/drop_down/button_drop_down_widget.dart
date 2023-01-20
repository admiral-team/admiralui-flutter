import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class ButtonDropDownWidget extends StatefulWidget {
  const ButtonDropDownWidget({
    super.key,
    this.buttonTitle,
    this.isEnable = true,
    this.onPressed,
    this.scheme,
  });

  final String? buttonTitle;
  final bool isEnable;
  final TitleButtonDropDownWidgetScheme? scheme;
  final VoidCallback? onPressed;

  @override
  State<ButtonDropDownWidget> createState() => _ButtonDropDownWidgetState();
}

class _ButtonDropDownWidgetState extends State<ButtonDropDownWidget> {
  late TitleButtonDropDownWidgetScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? TitleButtonDropDownWidgetScheme(theme: theme);

    return Container(
      constraints: const BoxConstraints(
        minHeight: LayoutGrid.module * 9,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: LayoutGrid.halfModule * 3,
      ),
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
      ButtonArrow(
        title: widget.buttonTitle ?? '',
        isEnable: widget.isEnable,
        onPressed: widget.onPressed,
        scheme: scheme.ghostButtonScheme,
      ),
      const Spacer()
        ],
      ),
    );
  }
}
