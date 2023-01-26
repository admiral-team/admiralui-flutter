import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// The ErrorView.
/// The component is used to attract the user's attention as a message.

class ErrorView extends StatefulWidget {
  const ErrorView(
    this.text,
    this.buttonTitle, {
    this.isEnabled = true,
    this.isLoading = false,
    this.onPressed,
    this.scheme,
  });

  final String text;
  final String buttonTitle;
  final bool isEnabled;
  final bool isLoading;
  final void Function()? onPressed;
  final ErrorViewScheme? scheme;

  @override
  State<StatefulWidget> createState() => _ErrorViewState();
}

class _ErrorViewState extends State<ErrorView> {
  late ErrorViewScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? ErrorViewScheme(theme: theme);

    return Column(
      children: <Widget>[
        TextView(
          widget.text,
          isEnabled: widget.isEnabled,
          font: scheme.titleFont,
          textColorNormal: scheme.titleColor.color(),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: LayoutGrid.module * 8,
        ),
        GhostButton(
          onPressed: widget.onPressed,
          title: widget.buttonTitle,
          isEnable: widget.isEnabled,
          isLoading: widget.isLoading,
          scheme: scheme.ghostButtonScheme,
        )
      ],
    );
  }
}
