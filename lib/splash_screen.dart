import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:handy_man/onboarding.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashTransition: SplashTransition.scaleTransition,
      splash: Center(
        child: LottieBuilder.asset(
          "assets/animations/Splash2.json",
        ),
      ),
      nextScreen: const Onboard(),
      splashIconSize: 250,
    );
  }
}
