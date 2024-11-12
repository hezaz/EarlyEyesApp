import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/utils/appUtils.dart';

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
  final authCtrl = Get.put(AuthController());

  void _showLoader() {
    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );
  }

  void _hideLoader() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
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
                  style: 16.txtMediumBlue,
                ),
              ),
              ListView.separated(
                padding: const EdgeInsets.only(top: 40),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CommonTile(
                    selectedIndex: controller.selectedCard,
                    currentIndex: index,
                    title: controller.joinType[index].title.toString(),
                    subtitle: controller.joinType[index].subtitle.toString(),
                    image: controller.joinType[index].image.toString(),
                    onTap: controller.setIndex,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 16);
                },
                itemCount: controller.joinType.length,
              ),
              CommonButton(
                clickAction: () async {
                  // if (controller.selectedCard.value == -1) {
                  //   _hideLoader();
                  //   return;
                  // }
                  // _showLoader();

                  if(controller.selectedCard.value != -1){
                    switch (controller.selectedCard.value) {

                      case 0:
                        context.pushNavigator(StudentSignupScreen());
                        AppUtils.log("========StudentSignupScreen");
                        break;
                      case 1:
                        context.pushNavigator(ParentSignupScreen());
                        AppUtils.log("========ParentSignupScreen");
                        break;
                      case 2:
                        context.pushNavigator(TutorSignUpScreen());
                        AppUtils.log("========TutorSignUpScreen");
                        break;
                      default:
                        // _hideLoader();
                        break;
                    }
                  }
                },
                height: 45,
                borderRadius: 30,
                margin: const EdgeInsets.only(left: 40, right: 40, top: 100),
                text: AppStrings.next,
              )
            ],
          ),
        );
      },
    );
  }
}


class TextClass extends StatelessWidget {
  const TextClass({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

