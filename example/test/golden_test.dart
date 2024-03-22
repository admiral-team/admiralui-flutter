import 'package:golden_toolkit/golden_toolkit.dart';
import 'device_config.dart';
import 'links_screen_golden.dart';
import 'main_screen_golden.dart';
import 'radio_buttons_screen_golden.dart';
import 'tags_and_chips_screen_golden.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  for (final Device device in devices) {
    // Main
    runMainScreen(device);
    // Links
    runLinksScreen(device);
    // Radio buttons
    runRadioButtonsScreen(device);
    // Tags and Chips
    runTagsAndChipsScreen(device);
  }
}
