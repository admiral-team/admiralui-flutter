import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class PinCodeItemWidget extends StatefulWidget {
  const PinCodeItemWidget({
    super.key,
    this.status = CodeInputStatus.normal,
    this.isActive = false,
    this.scheme,
  });

  final CodeInputStatus status;
  final PinCodeItemScheme? scheme;
  final bool isActive;

  @override
  State<PinCodeItemWidget> createState() => _PinCodeItemWidgetState();
}

class _PinCodeItemWidgetState extends State<PinCodeItemWidget> {
  late PinCodeItemScheme scheme;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? PinCodeItemScheme(theme: theme);
    Color backgroundColor = scheme.backgroundColor.unsafeParameter(
      widget.status,
    );
    if (widget.isActive && widget.status == CodeInputStatus.normal) {
      backgroundColor = scheme.activeColor;
    }

    return DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular((LayoutGrid.halfModule / 2) * 3),
        ),
        child: const SizedBox(
          width: LayoutGrid.halfModule * 3, 
          height: LayoutGrid.halfModule * 3,),
    );
  }
}
