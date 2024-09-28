import 'package:early_eyes/components/coreComponents/TextView.dart';

import 'package:early_eyes/components/coreComponents/common_button.dart';
import 'package:early_eyes/components/coreComponents/common_input_field.dart';
import 'package:early_eyes/components/styles/appColors.dart';
import 'package:early_eyes/components/styles/appImages.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/controller/auth_controller.dart';

import 'package:early_eyes/utils/extensions/contextExtensions.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/common_scaffold_widget.dart';



class ForgotPasswordScreen extends StatelessWidget {
 ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AuthController(),
      builder: (AuthController controller) {
        return CommonScaffold(
          onBackTap: () {
            controller.checkMail.value = false;
            context.pop();
          },
          title: AppStrings.forgotPassword.split("?").first,

          body: Obx(
            () => controller.checkMail.value == true
                ? ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 70.0),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: AppColors.primaryBlue,
                          child: Center(
                            child: Image.asset(
                              AppImages.checkMail,
                              height: 40,
                            ),
                          ),
                        ),
                      ),
                      TextView(
                        margin: const EdgeInsets.only(top:45),
                        text: AppStrings.checkEmail,
                        textAlign: TextAlign.center,
                        style: 24.txtSBoldDarkBlue,
                      ),
                      TextView(
                        margin: const EdgeInsets.only(top:45,left:22,right: 22),
                        text: AppStrings.checkEmailMsg,
                        textAlign: TextAlign.center,
                        style: 13.txtMediumDBlue,
                      ),
                      CommonButton(
                          margin: const EdgeInsets.only(
                              left: 45, right: 45, top: 80, bottom: 40),
                          text: AppStrings.ok,
                          clickAction: () {
                            context.pop();
                          }),
                    ],
                  )
                : ListView(
                    children: [
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 32.0),
                        child:
                            Image.asset(AppImages.forgotPassword, height: 220),
                      )),
                      TextView(
                          margin: const EdgeInsets.only(left: 24, top: 16),
                          text: AppStrings.registeredEmail,
                          style: 14.txtMediumDBlue),
                      TextView(
                          margin: const EdgeInsets.only(left: 24, top: 16),
                          text: AppStrings.email,
                          style: 12.txtRegularDBlue),
                      CommonInputField(
                          controller: controller.forgotPasswordCtrl,
                          hint: AppStrings.enterEmail),
                      CommonButton(
                        isLoading: controller.mailLoader,
                          margin: const EdgeInsets.only(
                              left: 32, right: 32, top: 40, bottom: 40),
                          text: AppStrings.submit,
                          clickAction: () {
                            controller.forgotPassword();

                          }),
                      Center(
                        child: RichText(
                            //textAlign:TextAlign.center,
                            text: TextSpan(children: [
                          TextSpan(
                              text: AppStrings.rememberPassword,
                              style: 14.txtRegularDBlue),
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => context.pop(),
                              text: AppStrings.logInText,
                              style: 13.txtBoldPBlue)
                        ])),
                      )
                    ],
                  ),
          ),
        );
      },
    );
  }
}
