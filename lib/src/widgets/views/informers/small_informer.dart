import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:admiralui_flutter/src/widgets/views/informers/small_informer_scheme.dart';
import 'package:flutter/material.dart';

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
  State<SmallInformerWidget> createState() => _BadgeWidgetState();
}

class _BadgeWidgetState extends State<SmallInformerWidget> {
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

    final List<Widget> childrens = <Widget>[];

    final Column mainWidget = Column(
      children: <Widget>[
        SizedBox(
          height: LayoutGrid.doubleModule,
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(LayoutGrid.halfModule),
          ),
          child: Container(
            constraints: BoxConstraints(
              minHeight: LayoutGrid.halfModule * 10,
              minWidth: LayoutGrid.halfModule * 10,
            ),
            padding: EdgeInsets.symmetric(
              vertical: LayoutGrid.module,
              horizontal: LayoutGrid.halfModule * 3,
            ),
            child: Center(
        widthFactor: 1.0,
        child:
            Text(
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
        ),
        SizedBox(
          height: LayoutGrid.doubleModule,
        ),
      ],
    );

    switch (widget.arrowDirectionStyle) {
      case InformerDirectionStyle.topLeft:
        childrens.add(
          SizedBox(
            height: LayoutGrid.doubleModule,
          ),
        );
        childrens.add(mainWidget);
        childrens.add(
          Positioned(
            left: 0,
            top: -LayoutGrid.halfModule * 3,
            child: Icon(
              AdmiralIcons.admiral_ic_sort_up_solid,
              color: backgroundColor,
              size: LayoutGrid.doubleModule * 3,
            ),
          ),
        );
        break;

      case InformerDirectionStyle.topRight:
        childrens.add(
          SizedBox(
            height: LayoutGrid.doubleModule,
          ),
        );
        childrens.add(mainWidget);
        childrens.add(
          Positioned(
            right: 0,
            top: -LayoutGrid.halfModule * 3,
            child: Icon(
              AdmiralIcons.admiral_ic_sort_up_solid,
              color: backgroundColor,
              size: LayoutGrid.doubleModule * 3,
            ),
          ),
        );
        break;

      case InformerDirectionStyle.bottomLeft:
        childrens.add(
          Positioned(
            left: 0,
            bottom: -LayoutGrid.halfModule * 3,
            child: Icon(
              AdmiralIcons.admiral_ic_sort_down_solid,
              color: backgroundColor,
              size: LayoutGrid.doubleModule * 3,
            ),
          ),
        );
        childrens.add(mainWidget);
        childrens.add(
          SizedBox(
            height: LayoutGrid.doubleModule,
          ),
        );
        break;

      case InformerDirectionStyle.bottomRight:
        childrens.add(
          Positioned(
            right: 0,
            bottom: -LayoutGrid.halfModule * 3,
            child: Icon(
              AdmiralIcons.admiral_ic_sort_down_solid,
              color: backgroundColor,
              size: LayoutGrid.doubleModule * 3,
            ),
          ),
        );
        childrens.add(mainWidget);
        childrens.add(
          SizedBox(
            height: LayoutGrid.doubleModule,
          ),
        );
        break;
    }

    return Stack(
      children: childrens,
    );
  }
}
