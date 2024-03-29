import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/cupertino.dart';

/// A run of text with a single style.
///
/// The [TextView] widget displays a string of text with single style.
/// The string might break across multiple lines or might all be displayed on
/// the same line depending on the layout constraints.
///
/// The [font] argument is optional. When omitted, the text will use the style
/// from the closest enclosing [FontPalette].
///
/// To make [Text] react to touch events, wrap it in a [GestureDetector] widget
/// with a [GestureDetector.onTap] handler.
class TextView extends StatelessWidget {
  /// Creates a text widget.
  ///
  /// If the [font] argument is null, the text will use default [AFont].
  ///
  /// The [data] parameter must not be null.
  const TextView(
    this.data, {
    super.key,
    this.isEnabled = true,
    this.font,
    this.textColorNormal,
    this.textColorDisabled,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
  });

  /// The text to display.
  ///
  /// This will be null if a [textSpan] is provided instead.
  final String data;
  final bool isEnabled;
  final AFont? font;
  final Color? textColorNormal;
  final Color? textColorDisabled;

  /// If non-null, the style to use for this text, even if there are
  /// [textColorNormal], [textColorDisabled] and [font] set
  final TextStyle? style;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// An optional maximum number of lines for the text to span, wrapping
  /// if necessary.
  /// If the text exceeds the given number of lines, it will be
  /// truncated according to [overflow].
  ///
  /// If this is 1, text will not wrap. Otherwise, text will be wrapped at the
  /// edge of the box.
  ///
  /// If this is null, but there is an ambient [DefaultTextStyle] that specifies
  /// an explicit number for its [DefaultTextStyle.maxLines], then the
  /// [DefaultTextStyle] value will take precedence. You can use a [RichText]
  /// widget directly to entirely override the [DefaultTextStyle].
  final int? maxLines;

  /// How visual overflow should be handled.
  ///
  /// If this is null [TextStyle.overflow] will be used, otherwise the value
  /// from the nearest [DefaultTextStyle] ancestor will be used.
  final TextOverflow? overflow;

  /// Whether the text should break at soft line breaks.
  ///
  /// If false, the glyphs in the text will be positioned as if there was
  /// unlimited horizontal space.
  final bool? softWrap;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    final Color textColor = isEnabled
        ? (textColorNormal ?? colors.textPrimary.color())
        : (textColorDisabled ?? colors.textPrimary.colorWithOpacity());

    return Text(
      data,
      style: style ??
          font?.toTextStyle(textColor) ??
          fonts.body1.toTextStyle(textColor),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
    );
  }
}
