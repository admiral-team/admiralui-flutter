import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'alertsOnboarding/onboarding_view_screen.dart';
import 'root_screen.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OnboardingViewScreen(
      title: '',
      isInitial: true,
      onPush: () async {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => RootScreen(),
          ),
        );
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('showOnboarding', false);
      },
    );
  }
}
