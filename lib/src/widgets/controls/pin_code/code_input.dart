import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:admiralui_flutter/src/widgets/controls/pin_code/pin_code_item.dart';
import 'package:flutter/material.dart';

//  CodeInputControl - A control of the entered user characters. Used for
//  secure password entry.
//  You can create a PrimaryButton by specifying the following parameters
//  in the initializer:
//  - text - Binding<String> Observable property for control count input text
//  - itemsCount - value of Int. The property is responsible for the possible
//  number of input characters
//  - status - this parameter is responsible for the display style
//  CodeInputControl. Can be in three states: normal, success, error. Default
//  state is a normal.
//  ## Example to create :
//  # Code
//  CodeInputWidget(
//                 text: .constant("1234"),
//                 itemsCount: 5,
//                 status: .normal
//  )
//
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
          if (i == 0)
            const SizedBox(
              width: LayoutGrid.halfModule * 5,
            ),
          PinCodeItemWidget(
            scheme: scheme,
            status: widget.status,
            isActive: i < currentIndex,
          ),
          const SizedBox(
            width: LayoutGrid.halfModule * 5,
          ),
        ],
      ],
    );
  }
}
