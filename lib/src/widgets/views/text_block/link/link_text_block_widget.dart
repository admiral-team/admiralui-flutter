import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class LinkTextBlockWidget extends StatefulWidget {
  const LinkTextBlockWidget({
    super.key,
    this.title,
    this.isEnable = true,
    this.onPressed,
    this.scheme,
  });

  final String? title;
  final bool isEnable;
  final LinkTextBlockWidgetScheme? scheme;
  final VoidCallback? onPressed;

  @override
  State<LinkTextBlockWidget> createState() => _LinkTextBlockWidgetState();
}

class _LinkTextBlockWidgetState extends State<LinkTextBlockWidget> {
  late LinkTextBlockWidgetScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? LinkTextBlockWidgetScheme(theme: theme);

    return Container(
      constraints: const BoxConstraints(
        minHeight: LayoutGrid.module * 9,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: LayoutGrid.halfModule * 3,
      ),
      width: double.infinity,
      child: LinkControl(
        title: widget.title ?? '',
        isEnable: widget.isEnable,
        onPressed: widget.onPressed,
        scheme: scheme.linkScheme,
        isExpandText: true,
      ),
    );
  }
}
