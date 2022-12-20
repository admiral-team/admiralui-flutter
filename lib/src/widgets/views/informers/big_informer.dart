import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

// BigInformer - The component is in four status colors, does not have a Pop-up.
// It consists of several elements that can be disabled in layers.
// Adapts to the width of the device screen. The maximum height
// of the component is 400 px.
class BigInformerWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final BigInformerScheme informerScheme =
        scheme ?? BigInformerScheme(theme: theme);

    final Color backgroundColor =
        informerScheme.backgroundColor.unsafeParameter(
      isEnable,
      style,
    );
    final Color textColor = isEnable
        ? informerScheme.enabledTextColor
        : informerScheme.disabledTextColor;

    final List<Widget> children = <Widget>[];
    if (title != null) {
      children.add(
        TextView(
          title ?? '',
          font: informerScheme.titleFont,
          textColorNormal: textColor,
        ),
      );
    }
    if (subtitle != null) {
      if (title != null) {
        children.add(
          const SizedBox(
            height: LayoutGrid.module,
          ),
        );
      }
      children.add(
        TextView(
          subtitle ?? '',
          font: informerScheme.subtitleFont,
          textColorNormal: textColor,
        ),
      );
    }
    if (linkText != null) {
      if (title != null || subtitle != null) {
        children.add(
          const SizedBox(
            height: LayoutGrid.doubleModule,
          ),
        );
      }
      children.add(
        LinkControl(
          title: linkText ?? '',
          scheme: informerScheme.linkControlScheme,
          isEnable: isEnable,
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
          children: children,
        ),
      ),
    );
  }
}
