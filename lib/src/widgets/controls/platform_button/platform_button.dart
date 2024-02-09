import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// A customizable platform-aware button widget
///
/// Constructor:
/// ```
/// PlatformButton({
///   Key? key,
///   VoidCallback? onPressed,
///   String title = '',
///   bool isEnable = true,
///   Image? iconData,
///   IconPosition? iconPosition,
///   PlatformButtonScheme? scheme,
/// })
/// ```
///
/// Parameters:
/// - `key`: An optional key to uniquely identify this widget.
/// - `onPressed`: Callback function triggered when the button is pressed.
/// - `title`: The text displayed on the button.
/// - `isEnable`: A boolean indicating whether the button
/// is enabled or disabled.
///   Defaults to `true`.
/// - `iconData`: An optional image to be displayed on the button.
/// - `iconPosition`: An optional position for the image
/// (left, right, or null for none).
/// - `scheme`: An optional scheme defining the appearance of the button.
///
/// Example usage:
/// ```dart
/// PlatformButton(
///   onPressed: () {
///     // Handle button press
///   },
///   title: 'Submit',
///   isEnable: true,
///   iconData: Image.asset('assets/icon.png'),
///   iconPosition: IconPosition.left,
///   scheme: PlatformButtonScheme.light(),
/// )
/// ```
///
class PlatformButton extends StatefulWidget {
  /// Creates a PlatformButton.
  const PlatformButton({
    super.key,
    this.onPressed,
    this.title = '',
    this.isEnable = true,
    this.iconData,
    this.iconPosition,
    this.scheme,
  });

  final VoidCallback? onPressed;
  final String title;
  final bool isEnable;
  final Image? iconData;
  final IconPosition? iconPosition;
  final PlatformButtonScheme? scheme;

  @override
  State<PlatformButton> createState() => _PlatformButtonState();
}

class _PlatformButtonState extends State<PlatformButton> {
  bool _isPressed = false;
  late PlatformButtonScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? PlatformButtonScheme(theme: theme);

    final Color backgroundNormal =
        scheme.buttonColor.unsafeParameter(ControlState.normal);
    final Color backgroundHighlighted =
        scheme.buttonColor.unsafeParameter(ControlState.highlighted);
    final Color backgroundDisabled =
        scheme.buttonColor.unsafeParameter(ControlState.disabled);
    final Color background = widget.isEnable
        ? (_isPressed ? backgroundHighlighted : backgroundNormal)
        : backgroundDisabled;

    final Color textColorNormal =
        scheme.textColor.unsafeParameter(ControlState.normal);
    final Color textColorDisabled =
        scheme.textColor.unsafeParameter(ControlState.disabled);
    final Color textColor =
        widget.isEnable ? textColorNormal : textColorDisabled;

    return GestureDetector(
      onTap: () => widget.onPressed?.call(),
      onTapUp: (_) => setHighlighted(highlighted: false),
      onTapDown: (_) => setHighlighted(highlighted: true),
      onTapCancel: () => setHighlighted(highlighted: false),
      child: Container(
        constraints: const BoxConstraints(
          minWidth: double.infinity,
          minHeight: LayoutGrid.doubleModule * 3,
        ),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(
            LayoutGrid.module,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: LayoutGrid.halfModule * 3,
          horizontal: LayoutGrid.doubleModule,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: (widget.iconData != null &&
                      (widget.iconPosition == IconPosition.left ||
                          widget.iconPosition == null))
                  ? widget.iconData
                  : null,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                LayoutGrid.doubleModule,
                0,
                LayoutGrid.module,
                0,
              ),
              child: Center(
                widthFactor: 1,
                child: TextView(
                  widget.title,
                  font: scheme.font,
                  textColorNormal: textColor,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              child: (widget.iconData != null &&
                      widget.iconPosition == IconPosition.right)
                  ? widget.iconData
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  void setHighlighted({required bool highlighted}) {
    setState(() {
      _isPressed = highlighted;
    });
  }
}
