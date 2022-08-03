import 'package:admiralui_flutter/src/Widgets/Controlls/PrimaryButton/primary_button_scheme.dart';
import 'package:admiralui_flutter/src/Widgets/Controlls/icon_direction.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final String title;
  final bool isEnable;
  final Widget? icon;
  final IconDirection? direction;
  final PrimaryButtonScheme? scheme;

  const PrimaryButton(
      {Key? key,
      this.onPressed,
      this.title = '',
      this.isEnable = true,
      this.icon,
      this.direction,
      this.scheme})
      : super(key: key);

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    var scheme = widget.scheme ?? PrimaryButtonScheme();
    var background = widget.isEnable
        ? (_isPressed ? scheme.buttonHighLightColor : scheme.buttonNormalColor)
        : scheme.buttonDisableColor;
    var texStyle = widget.isEnable
        ? scheme.toNormalTextStyle()
        : scheme.toDisableTextStyle();

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
            color: background,
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: (widget.icon != null &&
                        widget.direction == IconDirection.left)
                    ? widget.icon
                    : null,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  widget.title,
                  style: texStyle,
                ),
              ),
              SizedBox(
                child: (widget.icon != null &&
                        widget.direction == IconDirection.right)
                    ? widget.icon
                    : null,
              ),
            ],
          )),
    );
  }

  setHighlighted(bool highlighted) {
    setState(() {
      _isPressed = highlighted;
    });
  }
}
