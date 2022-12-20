import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

// SmallInformer - The component is in four status 
// colors with different pop-up positions. Multiline (up to six lines), 
// changes its width depending on the 
// content, the maximum width of the component is 288 px.
class SmallInformerWidget extends StatefulWidget {
  const SmallInformerWidget({
    super.key,
    this.title,
    this.style = InformerStyle.normal,
    this.arrowDirectionStyle = InformerDirectionStyle.topLeft,
    this.isEnable = true,
    this.scheme,
  });

  final String? title;
  final InformerStyle style;
  final InformerDirectionStyle arrowDirectionStyle;
  final bool isEnable;
  final SmallInformerScheme? scheme;

  @override
  State<SmallInformerWidget> createState() => _SmallInformerState();
}

class _SmallInformerState extends State<SmallInformerWidget> {
  late SmallInformerScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? SmallInformerScheme(theme: theme);

    final Color backgroundColor = scheme.backgroundColor.unsafeParameter(
      widget.isEnable,
      widget.style,
    );
    final Color textColor =
        widget.isEnable ? scheme.enabledTextColor : scheme.disabledTextColor;

    final List<Widget> children = <Widget>[];
    final List<Widget> mainWidgetChildren = <Widget>[];
    final Positioned positionedWidget;

    final DecoratedBox mainWidget = DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(LayoutGrid.halfModule),
      ),
      child: Container(
        constraints: const BoxConstraints(
          minHeight: LayoutGrid.halfModule * 10,
          minWidth: LayoutGrid.halfModule * 10,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: LayoutGrid.module,
          horizontal: LayoutGrid.halfModule * 3,
        ),
        child: Center(
          widthFactor: 1.0,
          child: Text(
            widget.title ?? '',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: scheme.font.fontSize,
              fontFamily: scheme.font.fontFamily,
              fontWeight: scheme.font.fontWeight,
            ),
          ),
        ),
      ),
    );

    switch (widget.arrowDirectionStyle) {
      case InformerDirectionStyle.topLeft:
        mainWidgetChildren.add(
          const SizedBox(
            height: LayoutGrid.doubleModule,
          ),
        );
        mainWidgetChildren.add(mainWidget);
        positionedWidget = Positioned(
          left: 0,
          top: -LayoutGrid.halfModule * 3,
          child: Icon(
            AdmiralIcons.admiral_ic_sort_up_solid,
            color: backgroundColor,
            size: LayoutGrid.doubleModule * 3,
          ),
        );
        break;

      case InformerDirectionStyle.topRight:
        mainWidgetChildren.add(
          const SizedBox(
            height: LayoutGrid.doubleModule,
          ),
        );
        mainWidgetChildren.add(mainWidget);
        positionedWidget = Positioned(
          right: 0,
          top: -LayoutGrid.halfModule * 3,
          child: Icon(
            AdmiralIcons.admiral_ic_sort_up_solid,
            color: backgroundColor,
            size: LayoutGrid.doubleModule * 3,
          ),
        );
        break;

      case InformerDirectionStyle.bottomLeft:
        positionedWidget = Positioned(
          left: 0,
          bottom: -LayoutGrid.halfModule * 3,
          child: Icon(
            AdmiralIcons.admiral_ic_sort_down_solid,
            color: backgroundColor,
            size: LayoutGrid.doubleModule * 3,
          ),
        );
        mainWidgetChildren.add(mainWidget);
        mainWidgetChildren.add(
          const SizedBox(
            height: LayoutGrid.doubleModule,
          ),
        );
        break;

      case InformerDirectionStyle.bottomRight:
        positionedWidget = Positioned(
          right: 0,
          bottom: -LayoutGrid.halfModule * 3,
          child: Icon(
            AdmiralIcons.admiral_ic_sort_down_solid,
            color: backgroundColor,
            size: LayoutGrid.doubleModule * 3,
          ),
        );
        mainWidgetChildren.add(mainWidget);
        mainWidgetChildren.add(
          const SizedBox(
            height: LayoutGrid.doubleModule,
          ),
        );
        break;
    }

    final Column columnWidget = Column(
      children: mainWidgetChildren,
    );
    children.add(columnWidget);
    children.add(positionedWidget);

    return Stack(
      children: children,
    );
  }
}
