import 'dart:io';

import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/onboarding_screen.dart';
import 'screens/root_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

bool isTesting = false;

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

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
    this.isShowOnboarding = false,
  }) : super(key: key);

  final bool isShowOnboarding;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    if (!isTesting && !kIsWeb) {
      if (Platform.isAndroid) {
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
      } else if (Platform.isIOS) {
        await Firebase.initializeApp();
      }
    }
    if (!isTesting) {
      await Future<void>.delayed(Duration(seconds: 3));
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;

    if (isLoading && kIsWeb) {
      return MaterialApp(
        home: Scaffold(
          body: Center(
            child: Spinner(
              style: SpinnerStyle.initial,
              size: SpinnerSize.large,
            ),
          ),
        ),
      );
    }

    return AppThemeProviderWrapper(
      child: MaterialApp(
        title: 'Дизайн-система «Адмирал»',
        home: widget.isShowOnboarding ? OnboardingScreen() : RootScreen(),
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
