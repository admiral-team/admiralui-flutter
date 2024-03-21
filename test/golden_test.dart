import 'package:golden_toolkit/golden_toolkit.dart';
import 'check_box_sreen_golden.dart';
import 'device_config.dart';
import 'links_screen_golden.dart';
import 'main_screen_golden.dart';
import 'radio_buttons_screen_golden.dart';


void main() {
    for (final Device device in devices) {
      // Main
      runMainScreen(device);
      // Links
      runLinksScreen(device);
      // Radio buttons
      runRadioButtonsScreen(device);
      // Check box
      runCheckBoxScreen(device);
    }
}
