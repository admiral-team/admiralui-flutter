import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

// BigInformer - The component is in four status colors, does not have a Pop-up.
// It consists of several elements that can be disabled in layers.
// Adapts to the width of the device screen. The maximum height
// of the component is 400 px.
class BigInformerWidget extends StatefulWidget {
  const BigInformerWidget({
    super.key,
    this.title,
    this.subtitle,
    this.linkText,
    this.onLinkPressed,
    this.style = InformerStyle.normal,
    this.isEnable = true,
    this.scheme,
  });

  final String? title;
  final String? subtitle;
  final String? linkText;
  final VoidCallback? onLinkPressed;
  final InformerStyle style;
  final bool isEnable;
  final BigInformerScheme? scheme;

  @override
  State<BigInformerWidget> createState() => _BigInformerWidgetState();
}

class _BigInformerWidgetState extends State<BigInformerWidget> {
  late BigInformerScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? BigInformerScheme(theme: theme);

    final Color backgroundColor = scheme.backgroundColor.unsafeParameter(
      widget.isEnable,
      widget.style,
    );
    final Color textColor =
        widget.isEnable ? scheme.enabledTextColor : scheme.disabledTextColor;

    final List<Widget> childrens = <Widget>[];
    if (widget.title != null) {
      childrens.add(
        TextView(
          widget.title ?? '',
          font: scheme.titleFont,
          textColorNormal: textColor,
        ),
      );
    }
    if (widget.subtitle != null) {
      if (widget.title != null) {
        childrens.add(
          const SizedBox(
            height: LayoutGrid.module,
          ),
        );
      }
      childrens.add(
        TextView(
          widget.subtitle ?? '',
          font: scheme.subtitleFont,
          textColorNormal: textColor,
        ),
      );
    }
    if (widget.linkText != null) {
      if (widget.title != null || widget.subtitle != null) {
        childrens.add(
          const SizedBox(
            height: LayoutGrid.doubleModule,
          ),
        );
      }
      childrens.add(
        LinkControl(
          title: widget.linkText ?? '',
          scheme: scheme.linkControlScheme,
          isEnable: widget.isEnable,
        ),
      );
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(LayoutGrid.halfModule * 3),
      ),
      child: Container(
        constraints: const BoxConstraints(
          minHeight: LayoutGrid.halfModule * 10,
          minWidth: LayoutGrid.halfModule * 10,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: LayoutGrid.halfModule * 5,
          horizontal: LayoutGrid.doubleModule,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: childrens,
        ),
      ),
    );
  }
}
