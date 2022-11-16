import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

typedef RatingChangeCallback = void Function(double rating);

class FeedbackInputControl extends StatefulWidget {
  /// Creates a FeedbackInputControl.
  const FeedbackInputControl({
    required this.onRatingChanged,
    this.starCount = 5,
    this.rating = 0.0,
    this.scheme,
  });

  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final FeedbackInputControlScheme? scheme;

  @override
  State<FeedbackInputControl> createState() => _FeedbackInputControlState();
}

class _FeedbackInputControlState extends State<FeedbackInputControl> {
  late FeedbackInputControlScheme scheme;
  double _newRating = 0;

  Widget buildStar(
    BuildContext context, 
    FeedbackInputControl widget, 
    int index,) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? FeedbackInputControlScheme(theme: theme);

    Icon icon;
    if (index >= _newRating) {
      icon = Icon(
        AdmiralIcons.admiral_ic_star_solid,
        color: scheme.defaultColor.unsafeParameter(ControlState.normal),
        size: LayoutGrid.halfModule * 6,
      );
    } else {
      icon = Icon(
        AdmiralIcons.admiral_ic_star_solid,
        color: scheme.selectedColor.unsafeParameter(ControlState.normal),
        size: LayoutGrid.halfModule * 6,
      );
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          if (this.widget.onRatingChanged != null) widget.onRatingChanged(index + 1.0);
          _newRating = index + 1.0;
        });
      },
      onHorizontalDragUpdate: (dragDetails) {
        setState(() {
          RenderObject? obj = context.findRenderObject();
          if (obj == null) {
            return;
          }
          var isBox = obj is RenderBox;
          if (isBox == false) {
            return;
          }
          RenderBox box = obj as RenderBox;
          final _pos = box.globalToLocal(dragDetails.globalPosition);
          final i = _pos.dx / (LayoutGrid.halfModule * 6);

          _newRating = i;
          if (_newRating > widget.starCount) {
            _newRating = widget.starCount.toDouble();
          }
          if (_newRating < 0) {
            _newRating = 0.0;
          }
          if (this.widget.onRatingChanged != null) widget.onRatingChanged(_newRating);
        });
      },
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
            widget.starCount, (index) => buildStar(context, widget, index)));
  }
}
