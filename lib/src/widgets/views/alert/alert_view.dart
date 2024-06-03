import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// A customizable alert dialog widget for displaying messages with optional
/// image, title, description, and buttons.
///
/// This widget extends [StatefulWidget] to allow dynamic updates to its state.
///
/// Constructor:
/// ```
/// AlertView({
///   Image? image,
///   String? title,
///   String? description,
///   bool isEnabled = true,
///   String? buttonTitle,
///   String? additionalButtonTitle,
///   Function()? buttonAction,
///   Function()? additionalButtonAction,
///   AlertViewScheme? scheme,
/// })
/// ```
///
/// Parameters:
/// - `image`: An optional image to display in the alert. Defaults to `null`.
/// - `title`: An optional title to display in the alert. Defaults to `null`.
/// - `description`: An optional description to display in the alert.
///   Defaults to `null`.
/// - `isEnabled`: A boolean indicating whether the alert and its components
///   are enabled or disabled. Defaults to `true`.
/// - `buttonTitle`: The title text for the main button in the alert.
///   Defaults to `null`.
/// - `additionalButtonTitle`: The title text for an additional
/// button in the alert,
///   typically used for secondary actions. Defaults to `null`.
/// - `buttonAction`: The callback function to execute when the
/// main button is pressed.
///   Defaults to `null`.
/// - `additionalButtonAction`: The callback function to execute
/// when the additional button
///   is pressed. Defaults to `null`.
/// - `scheme`: An optional `AlertViewScheme` object defining
/// the appearance of the alert.
///
/// Example usage:
/// ```dart
/// AlertView(
///   title: 'Alert Title',
///   description: 'This is a description of the alert.',
///   buttonTitle: 'OK',
///   buttonAction: () {
///     // Handle button press
///   },
/// )
/// ```
class AlertView extends StatefulWidget {
  const AlertView({
    this.image,
    this.title,
    this.description,
    this.isEnabled = true,
    this.buttonTitle,
    this.buttonAction,
    this.additionalButtonTitle,
    this.additionalButtonAction,
    this.buttonActionKey,
    this.additionalButtonKey,
    this.scheme,
  });

  final Image? image;
  final String? title;
  final String? description;
  final bool isEnabled;
  final String? buttonTitle;
  final String? additionalButtonTitle;
  final Function()? buttonAction;
  final Function()? additionalButtonAction;
  final Key? buttonActionKey;
  final Key? additionalButtonKey;
  final AlertViewScheme? scheme;

  @override
  State<AlertView> createState() => _AlertViewState();
}

class _AlertViewState extends State<AlertView> {
  late AlertViewScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? AlertViewScheme(theme: theme);

    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(LayoutGrid.doubleModule)),
      ),
      elevation: 0,
      contentPadding: const EdgeInsets.symmetric(horizontal: LayoutGrid.module),
      backgroundColor: scheme.backgroundColor.color(),
      insetPadding: const EdgeInsets.all(LayoutGrid.doubleModule),
      content: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (widget.image != null)
                  SizedBox(
                    width: LayoutGrid.halfModule * 35,
                    height: LayoutGrid.halfModule * 35,
                    child: widget.image,
                  ),
                const SizedBox(height: LayoutGrid.halfModule * 5),
                if (widget.title != null)
                  TextView(
                    widget.title!,
                    isEnabled: widget.isEnabled,
                    font: scheme.titleFont,
                    textColorNormal: scheme.titleColor.color(),
                    textAlign: TextAlign.center,
                  ),
                const SizedBox(height: LayoutGrid.doubleModule),
                if (widget.description != null)
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: LayoutGrid.quadrupleModule * 16,
                    ),
                    child: TextView(
                      widget.description!,
                      isEnabled: widget.isEnabled,
                      font: scheme.descriptionFont,
                      textColorNormal: scheme.descriptionColor.color(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                const SizedBox(height: LayoutGrid.halfModule * 10),
                if (widget.buttonTitle != null)
                  PrimaryButton(
                    key: widget.buttonActionKey,
                    title: widget.buttonTitle!,
                    isEnable: widget.isEnabled,
                    onPressed: widget.buttonAction,
                  ),
                if (widget.additionalButtonTitle != null)
                  const SizedBox(height: LayoutGrid.doubleModule),
                GhostButton(
                  key: widget.additionalButtonKey,
                  title: widget.additionalButtonTitle!,
                  isEnable: widget.isEnabled,
                  onPressed: widget.additionalButtonAction,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
