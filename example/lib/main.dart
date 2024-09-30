import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:example/shared/di.dart';
import 'package:flutter/material.dart';
import 'screens/onboarding_screen.dart';
import 'screens/root_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(
      isShowOnboarding: false,
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
