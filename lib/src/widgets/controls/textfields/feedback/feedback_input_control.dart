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
    this.isEnabled = true,
    this.scheme,
  });

  final int starCount;
  final double rating;
  final bool isEnabled;
  final RatingChangeCallback onRatingChanged;
  final FeedbackInputControlScheme? scheme;

  @override
  State<FeedbackInputControl> createState() => _FeedbackInputControlState();
}

class _FeedbackInputControlState extends State<FeedbackInputControl> {
  late FeedbackInputControlScheme scheme;
  double _newRating = 0;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? FeedbackInputControlScheme(theme: theme);

    return Row(
      children: List<Widget>.generate(
        widget.starCount,
        (int index) => GestureDetector(
          onTap: () {
            setState(() {
              widget.onRatingChanged(index + 1.0);
              _newRating = index + 1.0;
            });
          },
          onHorizontalDragUpdate: (DragUpdateDetails dragDetails) {
            setState(() {
              RenderObject? obj;
              obj = context.findRenderObject();
              if (obj == null) {
                return;
              }
              if (obj is RenderBox == false) {
                return;
              }
              RenderBox box;
              box = obj as RenderBox;
              final Offset pos = box.globalToLocal(dragDetails.globalPosition);
              final double i = pos.dx / (LayoutGrid.halfModule * 6);

              _newRating = i;
              if (_newRating > widget.starCount) {
                _newRating = widget.starCount.toDouble();
              }
              if (_newRating < 0) {
                _newRating = 0.0;
              }
              widget.onRatingChanged(_newRating);
            });
          },
          child: Icon(
            AdmiralIcons.admiral_ic_star_solid,
            color: index >= _newRating
                ? scheme.defaultColor.unsafeParameter(widget.isEnabled 
                ? ControlState.normal : ControlState.disabled,)
                : scheme.selectedColor.unsafeParameter(widget.isEnabled 
                ? ControlState.normal : ControlState.disabled,),
            size: LayoutGrid.halfModule * 6,
          ),
        ),
      ),
    );
  }
}
