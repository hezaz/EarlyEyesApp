import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/coreComponents/common_app_bar.dart';
import 'package:early_eyes/components/coreComponents/common_button.dart';
import 'package:early_eyes/components/coreComponents/common_input_field.dart';
import 'package:early_eyes/components/styles/appImages.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/controller/skills_test_controller.dart';
import 'package:early_eyes/feature/presentation/widgets/common_card.dart';
import 'package:early_eyes/feature/presentation/widgets/common_scaffold_widget.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/styles/appColors.dart';
import 'start_quiz_screen.dart';

class SkillTestScreen extends StatelessWidget {
  const SkillTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SkillsTestController(),
      builder: (SkillsTestController controller) {
        return CommonScaffold(
          onBackTap: () {
            context.pop();
          },

          body: ListView(
            children: [
              TextView(
                  margin: const EdgeInsets.only(left: 16),
                  text: 'Hello,Hedi',
                  style: 14.txtRegularDBlue),
              TextView(
                  margin: const EdgeInsets.only(left: 16, top: 4),
                  text: AppStrings.knowledgeTest,
                  style: 20.txtSBoldDarkBlue),
              CommonInputField(
                  underLineBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: AppColors.darkBlue)),
                  leading: SizedBox(
                    height: 25,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(AppImages.search),
                    ),
                  ),
                  controller: controller.searchCtrl,
                  hint: AppStrings.search),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CommonCard(
                      radius: 8.0,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 100,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 8.0, bottom: 8.0, right: 16),
                              child: Image.asset(index == 1
                                  ? AppImages.test3
                                  : AppImages.test),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextView(
                                text: index == 0 ? "PYTHON" : "SCRATCH",
                                style: 14.txtSBoldDarkBlue,
                              ),
                              Row(
                                children: [
                                  Image.asset(AppImages.notes, height: 16),
                                  TextView(
                                    margin: const EdgeInsets.only(left: 4),
                                    text: index == 0
                                        ? " 10 Questions"
                                        : "30 Questions",
                                    style: 14.txtRegularDBlue,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(AppImages.clock, height: 16),
                                  TextView(
                                    margin: const EdgeInsets.only(left: 4),
                                    text: index == 0 ? " 30 min" : "15 min",
                                    style: 14.txtRegularDBlue,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 0);
                  },
                  itemCount: 2),
              TextView(
                margin: const EdgeInsets.only(left: 16,top: 8),
                text: "Continue Quiz",
                style: 18.txtMediumDBlue,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Row(
                  children: [
                    SizedBox(
                      height: 135,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 8.0, bottom: 8.0, right: 16),
                        child: Image.asset(AppImages.test1),
                      ),
                    ),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            text: "3D Animation",
                            style: 14.txtSBoldDarkBlue,
                          ),
                          Row(
                            children: [
                              Image.asset(AppImages.notes, height: 16),
                              TextView(
                                margin: const EdgeInsets.only(left: 4),
                                text: "8/10 Question",
                                style: 14.txtRegularDBlue,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(AppImages.clock, height: 16),
                              TextView(
                                margin: const EdgeInsets.only(left: 4),
                                text: "35 min",
                                style: 14.txtRegularDBlue,
                              ),
                            ],
                          ),
                          CommonButton(
                              textStyle: 12.txtMediumWhite,
                              height: 35,
                              margin: const EdgeInsets.only(top: 8,left: 16,right: 16),
                              text: "Continue Quiz",
                              clickAction: () {}),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              CommonButton(
                  textStyle: 16.txtMediumWhite,
                  height: 45,
                  margin: const EdgeInsets.only(top: 50, left: 40, right: 40,bottom: 40),
                  text: AppStrings.starQuiz,
                  clickAction: () {
                    context.pushNavigator(StartQuizScreen());
                  })
            ],
          ),
        );
      },
    );
  }
}
