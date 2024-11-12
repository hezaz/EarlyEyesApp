import 'package:early_eyes/feature/presentation/pages/home/home_screen.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../components/styles/appColors.dart';
import '../../../components/styles/appImages.dart';
import '../../../services/prefrences/prefrences.dart';
import 'auth/login/login_screen.dart';
import 'onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    moveToOnboardingScreen();
    super.initState();
  }

  moveToOnboardingScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      context.pushAndClearNavigator(
          Preferences.user != null ? HomeScreen() : Preferences.isFirstLaunch
              ? OnBoardingScreen()
              : LoginScreen());
    });
  }


  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
        ),
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: Center(child: Image.asset(AppImages.splash, fit: BoxFit.cover)),
        ));
  }
}
