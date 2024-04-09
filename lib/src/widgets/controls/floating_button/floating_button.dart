import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class AdmiralFloatingButton extends StatefulWidget {
  AdmiralFloatingButton({super.key});
  final List<String> items = <String>['Light', 'Dark'];

  @override
  State<AdmiralFloatingButton> createState() => _AdmiralFloatingButtonState();
}

class _AdmiralFloatingButtonState extends State<AdmiralFloatingButton> {
  bool _isMenuOpen = false;
  int _selectedIndex = 0;

  late AdmiralFloatingButtonScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = AdmiralFloatingButtonScheme(theme: theme);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Visibility(
          visible: _isMenuOpen,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: scheme.backgroundColor.color(),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: scheme.shadowColor.color().withOpacity(0.2),
                  blurRadius: LayoutGrid.module,
                ),
              ],
              borderRadius: const BorderRadius.all(
                Radius.circular(LayoutGrid.tripleModule),
              ),
            ),
            child: IntrinsicWidth(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  for (int i = 0; i < widget.items.length; i++)
                    themeItemWidget(i),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: LayoutGrid.halfModule * 3),
        FloatingActionButton.extended(
          backgroundColor: scheme.backgroundColor.color(),
          shape: const CircleBorder(),
          label: Icon(
            _isMenuOpen
                ? AdmiralIcons.admiral_ic_close_outline
                : AdmiralIcons.admiral_ic_menu_outline,
            color: scheme.iconColor.color(),
          ),
          onPressed: () {
            setState(() {
              _isMenuOpen = !_isMenuOpen;
            });
          },
        ),
      ],
    );
  }

  Widget themeItemWidget(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
          changeTheme();
        });
      },
      child: Container(
        margin: const EdgeInsets.all(LayoutGrid.module),
        padding:
            const EdgeInsets.symmetric(horizontal: LayoutGrid.doubleModule),
        height: LayoutGrid.halfModule * 9,
        decoration: BoxDecoration(
          color: scheme.themeItemBackgroundColor.parameter(
            index == _selectedIndex
                ? ControlState.highlighted
                : ControlState.normal,
          ),
          borderRadius: BorderRadius.circular(LayoutGrid.tripleModule),
        ),
        child: Center(
          child: Text(
            widget.items[index],
            textAlign: TextAlign.center,
            style: scheme.font.toTextStyle(
              scheme.themeTextColor.unsafeParameter(
                index == _selectedIndex
                    ? ControlState.highlighted
                    : ControlState.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void changeTheme() {
    setState(() {
      final AppThemeProviderWrapperState wrapper =
          AppThemeProviderWrapper.of(context);
      wrapper.updateTheme();
    });
  }
}
