import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class CodeInputWidget extends StatefulWidget {
  const CodeInputWidget({
    super.key,
    this.text = '',
    this.itemCount = 4,
    this.status = CodeInputStatus.normal,
    this.scheme,
  });

  final String text;
  final int itemCount;
  final CodeInputStatus status;
  final PinCodeItemScheme? scheme;

  @override
  State<CodeInputWidget> createState() => _CodeInputWidgetState();
}

class _CodeInputWidgetState extends State<CodeInputWidget> {
  late PinCodeItemScheme scheme;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? PinCodeItemScheme(theme: theme);
    final int currentIndex = widget.text.characters.length;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (int i = 0; i < widget.itemCount; i++) ...<Widget>[
          PinCodeItemWidget(
            scheme: scheme,
            status: widget.status,
            isActive: i < currentIndex,
          ),
          SizedBox(
            width: LayoutGrid.halfModule * 5,
          ),
        ],
      ],
    );
  }
}
