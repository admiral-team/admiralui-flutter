// import 'package:bank_lite/theme/app_theme_provider.dart';
import 'package:admiralui_flutter/src/Widgets/Controlls/PrimaryButton/primary_button_scheme.dart';
import 'package:admiralui_flutter/src/Widgets/Controlls/icon_direction.dart';
import 'package:flutter/material.dart';

class PrimaryButtonWidget extends StatefulWidget {
  final VoidCallback? onPressed;
  final String title;
  final bool? isEnable;
  final ButtonStyle? buttonStyle;
  final Widget? icon;
  final IconDirection? direction;

  const PrimaryButtonWidget(
      {Key? key,
      this.onPressed,
      required this.title,
      required this.isEnable,
      required this.buttonStyle,
      required this.icon,
      required this.direction})
      : super(key: key);

  @override
  State<PrimaryButtonWidget> createState() => _PrimaryButtonWidgetState();
}

class _PrimaryButtonWidgetState extends State<PrimaryButtonWidget> {
  double _opacity = 1.0;
  var scheme = PrimaryButtoScheme();
  @override
  Widget build(BuildContext context) {
    // var theme = AppThemeProvider.of(context);
    // var fonts = theme.fonts;

    return GestureDetector(
      onTap: () => widget.onPressed?.call(),
      onTapUp: (_) => setHighlighted(false),
      onTapDown: (_) => setHighlighted(true),
      onTapCancel: () => setHighlighted(false),
      child: Container(
          width: double.infinity,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: scheme.buttonColor.withOpacity(_opacity),
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          child: contentButton()),
    );
  }

  Widget contentButton() {
    if (widget.icon != null && widget.direction == IconDirection.left) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: widget.icon,
            width: 28,
            height: 28,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              widget.title,
              style: scheme.toTextStyle(_opacity),
            ),
          ),
        ],
      );
    } else if (widget.icon != null && widget.direction == IconDirection.right) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              widget.title,
              style: scheme.toTextStyle(_opacity),
            ),
          ),
          SizedBox(
            child: widget.icon,
            width: 28,
            height: 28,
          )
        ],
      );
    } else {
      return Text(
        widget.title,
        style: scheme.toTextStyle(_opacity),
      );
    }
  }

  setHighlighted(bool highlighted) {
    setState(() {
      _opacity = highlighted ? 0.8 : 1.0;
    });
  }
}
