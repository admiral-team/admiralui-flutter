import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/root_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppThemeProviderWrapper(
      child: MaterialApp(
        title: 'Дизайн-система  «Адмирал»',
        home: RootScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
