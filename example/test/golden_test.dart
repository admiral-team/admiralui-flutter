import 'package:golden_toolkit/golden_toolkit.dart';
import 'badges_screen_golden.dart';
import 'buttons/ghost_buttons_screen_golden.dart';
import 'buttons/other_buttons_screen_golder.dart';
import 'buttons/primary_buttons_screen_golden.dart';
import 'buttons/rules_buttons_screen_golden.dart';
import 'buttons/secondary_buttons_screen_golden.dart';
import 'check_box_sreen_golden.dart';
import 'device_config.dart';
import 'links_screen_golden.dart';
import 'main_screen_golden.dart';
import 'radio_buttons_screen_golden.dart';
// import 'shimmer_screen_golden.dart';
// import 'spinner_screen_golden.dart';
import 'switcher_golden.dart';
import 'tags_and_chips_screen_golden.dart';
import 'package:flutter_test/flutter_test.dart';
import 'textfields/double_textfield_screen_golden.dart';
import 'textfields/feedback_screen_golden.dart';
import 'textfields/numbers_textfield_screen_golden.dart';
import 'textfields/pincode_screen_golden.dart';
import 'textfields/slider_textfields_screen_golden.dart';
import 'textfields/sms_textfield_screen_golden.dart';
import 'textfields/standard_textfield_screen_golden.dart';
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
    // Badges
    runBadgesScreen(device);
    // Primary Buttons
    runPrimaryButtonsScreen(device);
    // Secondary Buttons
    runSecondaryButtonsScreen(device);
    // Ghost Buttons
    runGhostButtonsScreen(device);
    // Rules Buttons
    runRulesButtonsScreen(device);
    // Other Buttons
    runOtherButtonsScreen(device);
    // Toolbar
    runToolbarScreen(device);
    // Shimmer
    // Решить проблему анимации в тесте
    // runShimmerScreen(device);
    // Spinner
    // Решить проблему анимации в тесте
    // runSpinnerScreen(device);
    // Feedback
    runFeedbackScreen(device);
    // Standard TextFields
    runStandardTextFieldsScreen(device);
    // SMS TextFields
    runSmsTextFieldsScreen(device);
    // Double Textfields
    runDoubleTextFieldsScreen(device);
    // Number Textfields
    runNumbersTextFieldsScreen(device);
    // Slider TextFields
    runSliderTextFieldsScreen(device);
    // Pincode
    runPincodeScreen(device);
  }
}
