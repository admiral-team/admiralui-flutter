import 'dart:io';

import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:example/shared/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/onboarding_screen.dart';
import 'screens/root_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool showOnboarding = prefs.getBool('showOnboarding') ?? true;
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  if (!kIsWeb) {
    if (Platform.isAndroid) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    } else if (Platform.isIOS) {
      await Firebase.initializeApp();
    }
  }
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
        home: FutureBuilder<void>(
          future: DI.getInstance().init(),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return isShowOnboarding ? OnboardingScreen() : RootScreen();
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
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
