import 'package:early_eyes/components/coreComponents/common_button.dart';
import 'package:early_eyes/components/styles/appColors.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/controller/auth_controller.dart';
import 'package:early_eyes/utils/alert_service.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/coreComponents/TextView.dart';
import '../../../../components/coreComponents/appDropDown.dart';
import '../../../../components/coreComponents/app_date_picker.dart';
import '../../../../components/coreComponents/common_input_field.dart';
import '../../../../components/coreComponents/common_password_input_field.dart';
import '../../../../components/coreComponents/editProfileImage.dart';
import '../../../../utils/validations.dart';
import '../../widgets/common_scaffold_widget.dart';
import 'login/login_screen.dart';

class StudentSignupScreen extends StatefulWidget {
  const StudentSignupScreen({super.key});

  @override
  State<StudentSignupScreen> createState() => _StudentSignupScreenState();
}

class _StudentSignupScreenState extends State<StudentSignupScreen> {
  final ctrl = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    ctrl.clearFromData();
  }

  // Method to show loader
  void _showLoader() {
    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false, // Prevents dialog from being dismissed
    );
  }

  // Method to hide loader
  void _hideLoader() {
    Get.back(); // Closes the dialog
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (AuthController controller) {
        return CommonScaffold(
          title: AppStrings.signUp,
          onBackTap: () {
            controller.showStudent.value = false;
            controller.studentAgreeToTerms.value = false;
            context.pop();
          },
          body: Form(
            key: controller.stFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(
              children: [
                Obx(
                      () => EditProfileImage(
                    radius: 18,
                    size: 90,
                    imageData: controller.studentImageCtrl,
                    isEditable: true,
                    onChange: controller.studentImage,
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
                  hint: AppStrings.enterFullName,
                ),
                TextView(
                  margin: const EdgeInsets.only(left: 24, top: 12),
                  text: AppStrings.email,
                  style: 12.txtRegularDBlue,
                ),
                CommonInputField(
                  validator: Validations.checkEmailValidations,
                  controller: controller.emailCtrl,
                  hint: AppStrings.enterEmail,
                ),
                TextView(
                  margin: const EdgeInsets.only(left: 24, top: 12),
                  text: AppStrings.password,
                  style: 12.txtRegularDBlue,
                ),
                CommonPasswordInputField(
                  validator: Validations.checkPasswordValidations,
                  marginBottom: 16,
                  controller: controller.passwordCtrl,
                  hint: AppStrings.enterPassword,
                ),
                TextView(
                  margin: const EdgeInsets.only(left: 24, top: 8),
                  text: AppStrings.confirmPassword,
                  style: 12.txtRegularDBlue,
                ),
                CommonPasswordInputField(
                  marginBottom: 16,
                  validator: (value) {
                    return Validations.checkConfirmPasswordValidations(
                        value, controller.passwordCtrl.text);
                  },
                  controller: controller.confirmPasswordCtrl,
                  hint: AppStrings.enterConfirmPassword,
                ),

                // Personal Details fields are now visible by default
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          right: 165, left: 16, bottom: 8, top: 16),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                color: Colors.black,
                                width: 2.0,
                              ))),
                      child: TextView(
                        text: AppStrings.personalDetails,
                        style: 21.txtBoldBlack,
                      ),
                    ),
                    TextView(
                      margin: const EdgeInsets.only(left: 24, top: 16),
                      text: AppStrings.gender,
                      style: 12.txtRegularDBlue,
                    ),
                    Obx(
                          () => AppDropDown<String>.singleSelect(
                        error: controller.genderEr.value
                            ? AppStrings.selectGenderMsg
                            : null,
                        borderColor: AppColors.darkBlue.withOpacity(0.8),
                        radius: 5,
                        hint: AppStrings.selectGender,
                        list: controller.gender,
                        selectedValue: controller.selectGender?.value,
                        singleValueBuilder: (value) => value,
                        itemBuilder: (value) => value,
                        onSingleChange: controller.selectedGender,
                      ),
                    ),
                    TextView(
                      margin: const EdgeInsets.only(left: 24, top: 16),
                      text: AppStrings.dateOfBirth,
                      style: 12.txtRegularDBlue,
                    ),
                    CommonInputField(
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
                      hint: AppStrings.selectDate,
                    ),
                    TextView(
                      margin: const EdgeInsets.only(left: 24, top: 16),
                      text: AppStrings.className,
                      style: 12.txtRegularDBlue,
                    ),
                    Obx(
                          () => AppDropDown<String>.singleSelect(
                        error: controller.classEr.value
                            ? AppStrings.selectClassMsg
                            : null,
                        borderColor: AppColors.darkBlue.withOpacity(0.8),
                        radius: 5,
                        hint: AppStrings.selectClass,
                        list: controller.classList,
                        selectedValue: controller.selectClass?.value,
                        singleValueBuilder: (value) => value,
                        itemBuilder: (value) => value,
                        onSingleChange: controller.selectedClass,
                      ),
                    ),
                    TextView(
                      margin: const EdgeInsets.only(left: 24, top: 16),
                      text: AppStrings.experience,
                      style: 12.txtRegularDBlue,
                    ),
                    Obx(
                          () => AppDropDown<String>.singleSelect(
                        error: controller.expEr.value
                            ? AppStrings.selectExp
                            : null,
                        borderColor: AppColors.darkBlue.withOpacity(0.8),
                        radius: 5,
                        hint: AppStrings.selectExperience,
                        list: controller.experience,
                        selectedValue: controller.selectExp?.value,
                        singleValueBuilder: (value) => value,
                        itemBuilder: (value) => value,
                        onSingleChange: controller.selectedExp,
                      ),
                    ),
                    CommonInputField(
                      marginBottom: 20,
                      marginTop: 30,
                      maxLines: 4,
                      controller: controller.addNoteCtrl,
                      hint: AppStrings.presentationMsg,
                    ),
                  ],
                ),

                Row(
                  children: [
                    Obx(
                          () => Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                              (states) => const BorderSide(
                            width: 1.8,
                            color: AppColors.darkBlue,
                          ),
                        ),
                        checkColor: AppColors.darkBlue,
                        activeColor: AppColors.white,
                        value: controller.studentAgreeToTerms.value,
                        onChanged: (value) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          controller.studentAgreeToTerms.value = value ?? false;
                        },
                      ),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: AppStrings.readAndAgree,
                          style: 10.txtRegularDBlue,
                        ),
                        TextSpan(
                          text: AppStrings.termsCondition,
                          style: 12.txtMediumPBlue,
                        ),
                        TextSpan(text: "\nand ", style: 10.txtRegularDBlue),
                        TextSpan(
                          text: AppStrings.privacyPolicy,
                          style: 12.txtMediumPBlue,
                        ),
                      ]),
                    )
                  ],
                ),
                CommonButton(
                  isLoading: controller.isLoading,
                  margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
                  text: AppStrings.createAccount,
                  clickAction: () async {
                    // Show loader
                    // _showLoader();
                    try {
                      controller.checkValidation();
                      controller.update();

                      print("Full Name: ${controller.nameCtrl.text}");
                      print("Email: ${controller.emailCtrl.text}");
                      print("Password: ${controller.passwordCtrl.text}");
                      print("Confirm Password: ${controller.confirmPasswordCtrl.text}");
                      print("Gender: ${controller.selectGender?.value}");
                      print("Class: ${controller.selectClass?.value}");
                      print("Experience: ${controller.selectExp?.value}");
                      print("Date of Birth: ${controller.dobCtrl.text}");
                      print("Notes: ${controller.addNoteCtrl.text}");
                      print("Agreed to Terms: ${controller.studentAgreeToTerms.value}");

                      if (controller.stFormKey.currentState!.validate() &&
                          controller.selectGender?.value != null &&
                          controller.selectClass?.value != null &&
                          controller.selectExp?.value != null) {
                        if (controller.studentAgreeToTerms.value) {
                          await controller.studentRegister(); // Wait for registration to complete
                        } else {
                          AppAlerts.alert(message: AppStrings.acceptTerms);
                        }
                      } else {
                        controller.throwError();
                        controller.update();
                      }
                    } catch (e) {
                      // Handle any exceptions
                      print("Error during registration: $e");
                    } finally {
                      // Hide loader
                      // _hideLoader();
                    }
                  },
                ),

                Center(
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: AppStrings.alreadyAccount,
                        style: 12.txtRegularDBlue,
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context.pushNavigator(LoginScreen()),
                        text: AppStrings.logInText,
                        style: 14.txtMediumPBlue,
                      ),
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
