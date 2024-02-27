import 'package:admiralui_flutter/admiralui_flutter.dart';

/// Represents an individual tab item for use with the UnderlineTabs widget.
///
/// Parameters:
/// - `text`: The text label for the tab item.
/// - `badgeStyle`: The style for any associated badge on the tab item.
/// Defaults to `BadgeStyle.clear`.
///
class UnderlineTabItem {
  const UnderlineTabItem(
    this.text, {
    this.badgeStyle = BadgeStyle.clear,
  });
  final String text;
  final BadgeStyle badgeStyle;
}
