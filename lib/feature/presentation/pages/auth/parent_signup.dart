import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/controller/auth_controller.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../components/coreComponents/TextView.dart';
import '../../../../components/coreComponents/appDropDown.dart';
import '../../../../components/coreComponents/app_date_picker.dart';
import '../../../../components/coreComponents/common_button.dart';
import '../../../../components/coreComponents/common_input_field.dart';
import '../../../../components/coreComponents/common_password_input_field.dart';
import '../../../../components/coreComponents/editProfileImage.dart';
import '../../../../components/styles/appColors.dart';
import '../../../../components/styles/app_strings.dart';
import '../../../../utils/alert_service.dart';
import '../../../../utils/validations.dart';
import '../../widgets/common_scaffold_widget.dart';
import 'login/login_screen.dart';

class ParentSignupScreen extends StatelessWidget {
  const ParentSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (AuthController controller) {
        return CommonScaffold(
          title: AppStrings.signUp,
          onBackTap: () {
            controller.relationEr.value = false;
            context.pop();
          },
          body: Form(
            key: controller.parentFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(
              children: [
                Obx(
                  () => EditProfileImage(
                    radius: 18,
                    size: 90,
                    imageData: controller.parentImageCtrl,
                    isEditable: true,
                    onChange: controller.parentImage,
                  ),
                ),
                TextView(
                  margin: const EdgeInsets.only(left: 24, top: 32),
                  text: AppStrings.fullName,
                  style: 12.txtRegularDBlue,
                ),
                CommonInputField(
                    validator: Validations.checkNameValidations,
                    controller: controller.nameCtrl,
                    hint: AppStrings.enterFullName),
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
                  text: AppStrings.phoneNo,
                  style: 12.txtRegularDBlue,
                ),
                CommonInputField(
                    maxLength: 10,
                    inputType: TextInputType.number,
                    validator: Validations.checkPhoneValidations,
                    controller: controller.mobileCtrl,
                    hint: AppStrings.enterPhoneNo),
                TextView(
                  margin: const EdgeInsets.only(left: 24, top: 16),
                  text: AppStrings.dateOfBirth,
                  style: 12.txtRegularDBlue,
                ),
                CommonInputField(
                    hintStyle: 13.txtRegularGreyText,
                    validator: Validations.checkDobValidations,
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      selectDate(
                        context: context,
                        ctrl: controller.dobCtrl,
                        selectedDate: controller.selectedDate.value,
                      );
                    },
                    trailing: const Icon(
                      Icons.calendar_month,
                      color: AppColors.darkBlue,
                      size: 16,
                    ),
                    controller: controller.dobCtrl,
                    hint: AppStrings.selectDate),
                TextView(
                  margin: const EdgeInsets.only(left: 24, top: 16),
                  text: AppStrings.studentRelation,
                  style: 12.txtRegularDBlue,
                ),
                Obx(()=>
                   AppDropDown<String>.singleSelect(
                    error: controller.relationEr.value
                        ? AppStrings.selectRelationMsg
                        : null,
                    borderColor: AppColors.darkBlue.withOpacity(0.8),
                    radius: 5,
                    hint: AppStrings.selectRelation,
                    list: controller.relationList,
                    selectedValue: controller.relation?.value,
                    singleValueBuilder: (value) => value,
                    itemBuilder: (value) => value,
                    onSingleChange: controller.selectRelation,
                  ),
                ),
                TextView(
                  margin: const EdgeInsets.only(left: 24, top: 16),
                  text: AppStrings.password,
                  style: 12.txtRegularDBlue,
                ),
                CommonPasswordInputField(
                    validator: Validations.checkPasswordValidations,
                    marginBottom: 24,
                    controller: controller.passwordCtrl,
                    hint: AppStrings.enterPassword),
                TextView(
                  margin: const EdgeInsets.only(left: 24),
                  text: AppStrings.confirmPassword,
                  style: 12.txtRegularDBlue,
                ),
                CommonPasswordInputField(
                    validator: (value) {
                      return Validations.checkConfirmPasswordValidations(
                          value, controller.passwordCtrl.text);
                    },
                    marginTop: 8,
                    marginBottom: 20,
                    controller: controller.confirmPasswordCtrl,
                    hint: AppStrings.enterConfirmPassword),
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                          side: MaterialStateBorderSide.resolveWith(
                            (states) => const BorderSide(
                                width: 1.8, color: AppColors.darkBlue),
                          ),
                          checkColor: AppColors.darkBlue,
                          activeColor: AppColors.white,
                          value: controller.parentAgreeToTerms.value,
                          onChanged: (val) {
                            controller.parentAgreeToTerms.value = val!;
                          }),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: AppStrings.readAndAgree,
                            style: 10.txtRegularDBlue),
                        TextSpan(
                            text: AppStrings.termsCondition,
                            style: 12.txtMediumPBlue),
                        TextSpan(text: "\nand ", style: 10.txtRegularDBlue),
                        TextSpan(
                            text: AppStrings.privacyPolicy,
                            style: 12.txtMediumPBlue),
                      ]),
                    )
                  ],
                ),
                CommonButton(
                    isLoading: controller.prentLoader,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 24),
                    text: AppStrings.createAccount,
                    clickAction: () {
                      controller.relationEr.value = false;
                      controller.relationEr.refresh();
                      if (controller.parentFormKey.currentState!.validate() ||
                          (controller.relation?.value != null)) {

                          if (controller.parentAgreeToTerms.value) {
                            controller.parentRegister();
                          } else {
                            AppAlerts.alert(message: AppStrings.acceptTerms);
                          }

                      } else {
                        controller.relationEr.value = true;
                        controller.relationEr.refresh();
                      }

                    }),
                Center(
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: AppStrings.alreadyAccount,
                          style: 12.txtRegularDBlue),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap =
                                () => context.pushNavigator(LoginScreen()),
                          text: AppStrings.logInText,
                          style: 14.txtMediumPBlue),
                    ]),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}
