import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class ZeroScreenView extends StatefulWidget {
  const ZeroScreenView({
    this.image,
    this.title,
    this.subTitle,
    this.buttonTitle,
    this.isEnabled = true,
    this.onPressed,
    this.scheme,
  });

  final Image? image;
  final String? title;
  final String? subTitle;
  final String? buttonTitle;
  final bool isEnabled;
  final void Function()? onPressed;
  final ZeroScreenScheme? scheme;

  @override
  State<StatefulWidget> createState() => _ZeroScreeViewState();
}

class _ZeroScreeViewState extends State<ZeroScreenView> {
  late ZeroScreenScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? ZeroScreenScheme(theme: theme);

    return Flexible(
      child: Column(
        children: <Widget>[
          const Spacer(),
          if (widget.image != null) widget.image!,
          if (widget.title != null)
            const SizedBox(
              height: LayoutGrid.doubleModule * 2,
            ),
          if (widget.title != null)
            TextView(
              widget.title!,
              font: scheme.titleFont,
              textColorNormal: scheme.titleColor.color(),
            ),
          if (widget.subTitle != null)
            const SizedBox(
              height: LayoutGrid.module * 6,
            ),
          if (widget.subTitle != null)
            TextView(
              widget.subTitle!,
              font: scheme.subtitleFont,
              textColorNormal: scheme.subtitleColor.color(),
              textAlign: TextAlign.center,
            ),
          const Spacer(),
          if (widget.buttonTitle != null)
            PrimaryButton(
              onPressed: widget.onPressed,
              title: widget.buttonTitle!,
              isEnabled: widget.isEnabled,
              scheme: scheme.primaryButtonScheme,
            ),
          const SizedBox(
            height: LayoutGrid.doubleModule,
          ),
        ],
      ),
    );
  }
}
