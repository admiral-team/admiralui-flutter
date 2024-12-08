import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class ToastWidget extends StatelessWidget {
  const ToastWidget({
    super.key,
    this.title,
    this.linkText,
    this.onLinkPressed,
    this.style = ToastStyle.normal,
    this.image,
    this.isEnable = true,
    this.onClosePressed,
    this.scheme,
  });

  final String? title;
  final String? linkText;
  final VoidCallback? onLinkPressed;
  final bool isEnable;
  final VoidCallback? onClosePressed;
  final ToastStyle style;
  final IconData? image;
  final ToastScheme? scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ToastScheme toastScheme = scheme ?? ToastScheme(theme: theme);

    final Color backgroundColor = toastScheme.backgroundColor.unsafeParameter(
      isEnable,
      style,
    );
    final Color textColor =
        isEnable ? toastScheme.textColor : toastScheme.disabledTextColor;
    final Color closeImageColor = isEnable
        ? toastScheme.closeImageColor
        : toastScheme.disabledCloseImageColor;

    final List<Widget> children = <Widget>[];
    if (title != null) {
      children.add(
        TextView(
          title ?? '',
          font: toastScheme.titleFont,
          textColorNormal: textColor,
        ),
      );
    }
    if (linkText != null) {
      if (title != null) {
        children.add(
          const SizedBox(
            height: LayoutGrid.doubleModule,
          ),
        );
      }
      children.add(const Spacer());
      children.add(
        LinkControl(
          title: linkText ?? '',
          scheme: toastScheme.linkControlScheme,
          onPressed: onLinkPressed,
          isEnable: isEnable,
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: LayoutGrid.doubleModule,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(LayoutGrid.halfModule * 3),
        ),
        child: Container(
          constraints: const BoxConstraints(
            minHeight: LayoutGrid.halfModule * 10,
            minWidth: LayoutGrid.halfModule * 10,
            maxHeight: LayoutGrid.module * 19,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: LayoutGrid.halfModule * 5,
            horizontal: LayoutGrid.doubleModule,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (image != null)
                Icon(
                  image,
                  color: toastScheme.imageColor.unsafeParameter(
                    isEnable,
                    style,
                  ),
                  size: LayoutGrid.halfModule * 5,
                ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: children,
                  ),
                ),
              ),
              if (onClosePressed != null)
                GestureDetector(
                  onTap: onClosePressed,
                  child: Icon(
                    AdmiralIcons.admiral_ic_close_outline,
                    color: closeImageColor,
                    size: LayoutGrid.halfModule * 5,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
