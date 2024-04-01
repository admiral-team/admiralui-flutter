import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/onboarding_screen.dart';
import 'screens/root_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool showOnboarding = prefs.getBool('showOnboarding') ?? true;
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(
    MyApp(
      isShowOnboarding: showOnboarding,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    this.isShowOnboarding = false,
  }) : super(key: key);

  final bool isShowOnboarding;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;

    return AppThemeProviderWrapper(
      child: MaterialApp(
        title: 'Дизайн-система  «Адмирал»',
        home: isShowOnboarding ? OnboardingScreen() : RootScreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: colors.elementPrimary.color()),
          ),
        ),
      ),
    );
  }
}
