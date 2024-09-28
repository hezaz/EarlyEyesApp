
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../components/coreComponents/TextView.dart';
import '../../../../components/coreComponents/common_button.dart';
import '../../../controller/onboarding_controller.dart';
import '../../widgets/page_indicator.dart';



class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: OnboardingController(),
      builder: (OnboardingController controller) {
        return AnnotatedRegion(
          value: SystemUiOverlayStyle.dark,
          child: Scaffold(
              backgroundColor: Colors.white,
              body: Stack(
            children: [

              Column(children: [
                Expanded(
                  child: Obx(() =>
                    PageView.builder(
                      controller: controller.pageController,
                        onPageChanged: (index) {
                          controller.selectedPage.value = index;
                        },
                        itemCount: controller.pages.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 80),
                                height: 370,
                                padding: const EdgeInsets.all(16.0),
                                child: Image.asset(
                                    controller.pages[index].image.toString()),
                              ),
                              TextView(

                                text: controller.pages[index].title.toString(),
                                style: 18.txtSBoldBlack,
                                margin:
                                    const EdgeInsets.only(left: 16,right: 16,top: 16),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          );
                        }),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 60),
                    height: 3,
                    child: Obx(
                      () => PageIndicator(
                          selectedIndex: controller.selectedPage.value,
                          length: 3),
                    ),
                  ),
                ),
                Obx(() =>
                  CommonButton(
                      clickAction: () {
                        controller.nextPage(context);

                      },
                      height: 45,

                      borderRadius: 30,
                      margin:
                          const EdgeInsets.only(left: 40, right: 40, bottom: 40),
                      text: controller.selectedPage.value < 2 ? AppStrings.next : AppStrings.getStarted),
                )
              ]),
            ],
          )),
        );
      },
    );
  }
}
