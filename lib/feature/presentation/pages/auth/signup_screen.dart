import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';

import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/coreComponents/common_button.dart';

import '../../../controller/auth_controller.dart';
import '../../widgets/common_scaffold_widget.dart';
import '../../widgets/common_tile.dart';

import 'parent_signup.dart';
import 'student_signup.dart';
import 'tutor_signup.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init:AuthController(),

      builder: (controller) {
        return CommonScaffold(

            onBackTap: () {
              controller.selectedCard.value = (-1);
              context.pop();

            },

            body: ListView(
              children: [
                Center(
                  child: TextView(
                      textAlign: TextAlign.center,
                      text: AppStrings.join_as,
                      style: 16.txtMediumBlue),
                ),
                ListView.separated(
                    padding: const EdgeInsets.only(top: 40),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CommonTile(
                          selectedIndex: controller.selectedCard,
                          currentIndex: index,
                          title: controller.joinType[index].title.toString(),
                          subtitle:
                              controller.joinType[index].subtitle.toString(),
                          image: controller.joinType[index].image.toString(),
                          onTap: controller.setIndex);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 16);
                    },
                    itemCount: controller.joinType.length),
                CommonButton(
                    clickAction: () {

                      switch (controller.selectedCard.value) {
                        case 0:
                          context.pushNavigator(StudentSignupScreen());
                        case 1:
                          context.pushNavigator(ParentSignupScreen());
                        case 2:
                          context.pushNavigator(TutorSignUpScreen());
                      }
                    },
                    height: 45,
                    borderRadius: 30,
                    margin:
                        const EdgeInsets.only(left: 40, right: 40, top: 100),
                    text: AppStrings.next)
              ],
            ));
      },
    );
  }
}
