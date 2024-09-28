import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/coreComponents/common_button.dart';
import 'package:early_eyes/components/coreComponents/common_input_field.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/controller/login_controller.dart';
import 'package:early_eyes/feature/presentation/pages/home/home_screen.dart';
import 'package:early_eyes/utils/alert_service.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:early_eyes/utils/validations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../components/coreComponents/common_password_input_field.dart';
import '../../../../../components/coreComponents/icon_button.dart';
import '../../../../../components/styles/appImages.dart';
import '../../../widgets/common_scaffold_widget.dart';
import '../forgot_password/forgot_password_screen.dart';
import '../signup_screen.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LoginController(),
      builder: (LoginController controller) {
        return CommonScaffold(
          title: AppStrings.login,
          leading: const SizedBox(),
          body:  Form(
            key: controller.loginKey,
            child: ListView(
              children: [
                Center(child: Image.asset(AppImages.appImg, height: 50)),
                TextView(
                  margin: const EdgeInsets.only(left: 24, top: 16),
                  text: AppStrings.email,
                  style: 12.txtRegularDBlue,
                ),
                CommonInputField(
                    validator: Validations.checkEmailValidations,
                    controller: controller.emailCtrl,
                    hint: AppStrings.enterEmail),
                TextView(
                  margin: const EdgeInsets.only(left: 24, top: 16),
                  text: AppStrings.password,
                  style: 12.txtRegularDBlue,
                ),
                CommonPasswordInputField(
                    marginBottom: 0,
                    validator: Validations.checkPasswordValidations,
                    controller: controller.passwordCtrl,
                    hint: AppStrings.enterPassword),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextView(
                    margin:
                        const EdgeInsets.only(right: 24, bottom: 8, top: 16),
                    onTap: () {
                      context.pushNavigator(ForgotPasswordScreen());
                    },
                    text: AppStrings.forgotPassword,
                    style: 13.txtRegularDBlue,
                  ),
                ),
                CommonButton(
                    isLoading: controller.isLoading,
                    margin: const EdgeInsets.only(
                        left: 30, right: 30, top: 16, bottom: 32),
                    text: AppStrings.logInText,
                    clickAction: () {
                      if (controller.loginKey.currentState!.validate()) {
                        controller.userLogin().then((value) {

                          AppAlerts.success(value);
                          context.pushAndClearNavigator(HomeScreen());
                        });
                      }
                    }),
                Center(
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: AppStrings.notAccount, style: 14.txtRegularDBlue),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pushNavigator(SignupScreen());
                          },
                        text: AppStrings.signUp,
                        style: 14.txtBoldPBlue)
                  ])),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 32),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(child: Divider()),
                      TextView(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          text: AppStrings.loginWith,
                          style: 12.txtRegularDBlue),
                      const Expanded(child: Divider())
                    ],
                  ),
                ),
                CommonIconButton(
                  onTap: () {

                    controller.loginWithGoogle();
                  },
                ),
                CommonIconButton(
                  onTap: () {},
                  msg: AppStrings.appleLg,
                  image: AppImages.apple,
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
