import 'package:golden_toolkit/golden_toolkit.dart';
import 'buttons/ghost_buttons_screen_golden.dart';
import 'buttons/other_buttons_screen_golder.dart';
import 'buttons/primary_buttons_screen_golden.dart';
import 'buttons/rules_buttons_screen_golden.dart';
import 'check_box_sreen_golden.dart';
import 'device_config.dart';
import 'links_screen_golden.dart';
import 'main_screen_golden.dart';
import 'radio_buttons_screen_golden.dart';
import 'switcher_golden.dart';
import 'tags_and_chips_screen_golden.dart';
import 'package:flutter_test/flutter_test.dart';

import 'toolbar_screen_golden.dart';

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
    // Check box
    runCheckBoxScreen(device);
    // Switcher
    runSwitcherScreen(device);
    // Primary Buttons
    runPrimaryButtonsScreen(device);
    // Secondary Buttons
    // Исправить кнопки Secondary
    //runSecondaryButtonsScreen(device);
    // Ghost Buttons
    runGhostButtonsScreen(device);
    // Rules Buttons
    runRulesButtonsScreen(device);
    // Other Buttons
    runOtherButtonsScreen(device);
    // Toolbar
    runToolbarScreen(device);
  }
}
