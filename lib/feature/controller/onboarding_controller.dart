import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/styles/appImages.dart';
import '../../components/styles/app_strings.dart';
import '../../services/prefrences/prefrences.dart';
import '../data/models/dataModels/common_model.dart';
import '../presentation/pages/auth/login/login_screen.dart';


class OnboardingController extends GetxController {
  PageController pageController = PageController(initialPage: 0);
  RxInt selectedPage = 0.obs;
  var pages = <CommonModel>[
    CommonModel(title: AppStrings.title1, image: AppImages.onboarding1),
    CommonModel(title: AppStrings.title2, image: AppImages.onboarding2),
    CommonModel(title: AppStrings.title3, image: AppImages.onboarding3)
  ].obs;

  nextPage(BuildContext context) {
    if (selectedPage < pages.length - 1) {
      selectedPage.value++;
      pageController.animateToPage(selectedPage.value,
          duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
    } else {
      Preferences.save2Pref(Preferences.prefKeyIsFirstLaunch, false);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return LoginScreen();
      }));
    }
  }
}
