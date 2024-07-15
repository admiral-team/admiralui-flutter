import 'package:golden_toolkit/golden_toolkit.dart';
import 'alert/alert_view_screen_golden.dart';
import 'alert/error_view_screen_golden.dart';
import 'alert/onboarding_view_screen_golden.dart';
import 'alert/zero_screen_golden.dart';
import 'badges_screen_golden.dart';
import 'buttons/ghost_buttons_screen_golden.dart';
import 'buttons/other_buttons_screen_golder.dart';
import 'buttons/primary_buttons_screen_golden.dart';
import 'buttons/rules_buttons_screen_golden.dart';
import 'buttons/secondary_buttons_screen_golden.dart';
import 'calendar/horizontal_calendar_screen_golden.dart';
import 'calendar/vertical_calendar_screen_golden.dart';
import 'cell/action_bar_cell_screen_golden.dart';
import 'cell/base_cell_screen_golden.dart';
import 'check_box_sreen_golden.dart';
import 'currency_screen_golden.dart';
import 'device_config.dart';
import 'links_screen_golden.dart';
import 'main_screen_golden.dart';
import 'radio_buttons_screen_golden.dart';
import 'shimmer_screen_golden.dart';
import 'spinner_screen_golden.dart';
import 'switcher_golden.dart';
import 'tabs/icon_tabs_screen_golden.dart';
import 'tabs/informer_tabs_screen_golden.dart';
import 'tabs/logo_tabs_screen_golden.dart';
import 'tabs/outline_slider_tabs_screen_golden.dart';
import 'tabs/standard_tabs_screen_golden.dart';
import 'tabs/underline_tabs_screen_golden.dart';
import 'tags_and_chips_screen_golden.dart';
import 'package:flutter_test/flutter_test.dart';
import 'textblocks/text_block_header_screen_golden.dart';
import 'textblocks/text_block_accordion_screen_golden.dart';
import 'textblocks/text_block_link_screen_golden.dart';
import 'textblocks/text_block_paragraph_screen_golden.dart';
import 'textfields/card_textfield_screen_golden.dart';
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
    runShimmerScreen(device);
    // Spinner
    runSpinnerScreen(device);
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
    // Card TextFields
    runCardTextFieldsScreen(device);
    // Pincode
    runPincodeScreen(device);
    // Vertical Calendar
    runVerticalCalendarScreen(device);
    // Horizontal
    runHorizontalCalendarScreen(device);
    // Currency
    runCurrencyScreen(device);
    // ErrorView
    runErrorViewScreen(device);
    // ZeroScreen
    runZeroScreen(device);
    // AlertView
    runAlertViewScreen(device);
    // Cells
    runBaseCellScreen(device);
    // Action bar
    runActionBarCellScreen(device);
    // Onboarding
    runOnboardingViewScreen(device);
    // Standard Tabs
    runStandardTabsScreen(device);
    // Logo Tabs
    runLogoTabsScreen(device);
    // Informer Tabs
    runInformerTabsScreen(device);
    // Icon Tabs
    runIconTabsScreen(device);
    // Underline Slider Tabs
    runUnderlineTabsScreen(device);
    // Outline Slider Tabs
    runOutlineSliderTabsScreen(device);
    // Text Block Header
    runTextBlockHeaderScreen(device);
    // Text Block Accordion
    runTextBlockAccordionScreen(device);
    // Text Block Link
    runTextBlockLinkScreen(device);
    // Text Block Paragraph 
    runTextBlockParagraphScreen(device);
  }
}
