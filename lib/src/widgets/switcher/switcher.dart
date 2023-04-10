import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/cupertino.dart';

/// An iOS-style switch.
///
/// Used to toggle the on/off state of a single setting.
///
/// The switch itself does not maintain any state. Instead, when the state of
/// the switch changes, the widget calls the [onChanged] callback. Most widgets
/// that use a switch will listen for the [onChanged] callback and rebuild the
/// switch with a new [value] to update the visual appearance of the switch.
///
/// See also:
///
///  * [Switch], the Material Design equivalent.
///  * <https://developer.apple.com/ios/human-interface-guidelines/controls/switches/>
class Switcher extends StatefulWidget {
  /// Creates an iOS-style switch.
  const Switcher({
    super.key,
    this.onChanged,
    this.value = false,
    this.isEnabled = true,
    this.scheme,
  });

  final ValueChanged<bool>? onChanged;
  final bool value;
  final bool isEnabled;
  final SwitcherScheme? scheme;

  @override
  State<StatefulWidget> createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  bool _isSwitched = false;
  late SwitcherScheme scheme;

  @override
  void initState() {
    super.initState();
    _isSwitched = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? SwitcherScheme(theme: theme);

    final Color thumbColorNormal =
        scheme.thumbColor.unsafeParameter(ControlState.normal);
    final Color thumbColorDisabled =
        scheme.thumbColor.unsafeParameter(ControlState.disabled);
    final Color thumbColor =
        widget.isEnabled ? thumbColorNormal : thumbColorDisabled;

    final Color trackColorNormal =
        scheme.trackColor.unsafeParameter(ControlState.normal);
    final Color trackColorDisabled =
        scheme.trackColor.unsafeParameter(ControlState.disabled);
    final Color trackColor =
        widget.isEnabled ? trackColorNormal : trackColorDisabled;

    final Color activeTrackColorNormal =
        scheme.activeTrackColor.unsafeParameter(ControlState.normal);
    final Color activeTrackColorDisabled =
        scheme.activeTrackColor.unsafeParameter(ControlState.disabled);
    final Color activeTrackColor =
        widget.isEnabled ? activeTrackColorNormal : activeTrackColorDisabled;

    return CupertinoSwitch(
      value: _isSwitched,
      thumbColor: thumbColor,
      trackColor: trackColor,
      activeColor: activeTrackColor,
      onChanged: (bool value) {
        setState(() {
          _isSwitched = value;
          widget.onChanged?.call(value);
        });
      },
    );
  }
}
