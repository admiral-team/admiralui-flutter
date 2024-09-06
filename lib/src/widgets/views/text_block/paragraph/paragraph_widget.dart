import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class ParagrapgWidget extends StatefulWidget {
  const ParagrapgWidget({
    super.key,
    this.title,
    this.paragraphImageType,
    this.trailingImageWidget,
    this.textAligment = TextAlign.left,
    this.paragraphStyle = ParagraphStyle.primary,
    this.isEnabled = true,
    this.scheme,
  });

  final String? title;
  final ParagraphLeadingImageType? paragraphImageType;
  final Icon? trailingImageWidget;
  final TextAlign textAligment;
  final ParagraphStyle paragraphStyle;
  final bool isEnabled;
  final ParagraphWidgetScheme? scheme;

  @override
  State<ParagrapgWidget> createState() => _TitleButtonDropDownWidgetState();
}

class _TitleButtonDropDownWidgetState extends State<ParagrapgWidget> {
  late ParagraphWidgetScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? ParagraphWidgetScheme(theme: theme);
    Color textColor =
        widget.isEnabled ? scheme.textColor : scheme.disabledTextColor;
    if (widget.paragraphStyle == ParagraphStyle.secondary) {
      textColor = widget.isEnabled
          ? scheme.secondaryTextColor
          : scheme.disabledSecondaryTextColor;
    }
    final Color imageColor = widget.isEnabled
        ? scheme.leadingImageColor
        : scheme.disabledLeadingImageColor;

    Widget? trailingWidget;
    switch (widget.paragraphImageType) {
      case ParagraphLeadingImageType.point:
        trailingWidget = Padding(
          padding: const EdgeInsets.only(
            left: LayoutGrid.halfModule * 3,
            top: LayoutGrid.module,
            right: LayoutGrid.module,
          ),
          child: Container(
            width: LayoutGrid.halfModule,
            height: LayoutGrid.halfModule,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: imageColor,
            ),
          ),
        );
        break;
      case ParagraphLeadingImageType.check:
        trailingWidget = SizedBox(
          width: LayoutGrid.halfModule * 6,
          height: LayoutGrid.halfModule * 6,
          child: Icon(
            AdmiralIcons.admiral_ic_sent_outline,
            color: imageColor,
          ),
        );
        break;
      default:
        break;
    }

    return Container(
      constraints: const BoxConstraints(
        minHeight: LayoutGrid.module * 9,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: LayoutGrid.halfModule * 3,
      ),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          if (trailingWidget != null) trailingWidget,
          if (trailingWidget != null)
            const SizedBox(
              width: LayoutGrid.doubleModule,
            ),
          Expanded(
            child: TextView(
              widget.title ?? '',
              font: scheme.font,
              textColorNormal: textColor,
              textAlign: widget.textAligment,
            ),
          ),
          if (widget.trailingImageWidget != null)
            Padding(
              padding: const EdgeInsets.only(left: LayoutGrid.doubleModule),
              child: IconTheme(
                data: IconThemeData(
                  color: imageColor,
                ),
                child: widget.trailingImageWidget!,
              ),
            ),
        ],
      ),
    );
  }
}
