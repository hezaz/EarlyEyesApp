import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/controller/auth_controller.dart';
import 'package:early_eyes/feature/presentation/pages/auth/preferred_schedule_screen.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/coreComponents/TextView.dart';
import '../../../../components/coreComponents/appDropDown.dart';
import '../../../../components/coreComponents/app_date_picker.dart';
import '../../../../components/coreComponents/common_button.dart';
import '../../../../components/coreComponents/common_input_field.dart';
import '../../../../components/coreComponents/common_password_input_field.dart';
import '../../../../components/coreComponents/editProfileImage.dart';
import '../../../../components/coreComponents/icon_button.dart';
import '../../../../components/styles/appColors.dart';
import '../../../../components/styles/app_strings.dart';
import '../../../../utils/alert_service.dart';
import '../../../../utils/validations.dart';
import '../../widgets/common_scaffold_widget.dart';
import 'login/login_screen.dart';

class TutorSignUpScreen extends StatefulWidget {
  const TutorSignUpScreen({super.key});

  @override
  State<TutorSignUpScreen> createState() => _TutorSignUpScreenState();
}

class _TutorSignUpScreenState extends State<TutorSignUpScreen> {
  final ctrl = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    ctrl.clearFromData();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (AuthController controller) {
        return CommonScaffold(
          title: AppStrings.signUp,
          onBackTap: () {
            controller.showTutor.value = false;
            controller.studentAgreeToTerms.value = false;
            controller.selectedDate.value = DateTime.now();
            context.pop();
            //context.pushNavigator(SignupScreen());
          },
          body: Form(
            key: controller.tutorFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(
              children: [
                Obx(
                  () => EditProfileImage(
                    radius: 18,
                    size: 90,
                    imageData: controller.tutorImageCtrl,
                    isEditable: true,
                    onChange: controller.tutorImage,
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
                  text: AppStrings.password,
                  style: 12.txtRegularDBlue,
                ),
                CommonPasswordInputField(
                    validator: Validations.checkPasswordValidations,
                    marginBottom: 24,
                    controller: controller.passwordCtrl,
                    hint: AppStrings.enterPassword),
                TextView(
                  margin: const EdgeInsets.only(left: 24, top: 4),
                  text: AppStrings.confirmPassword,
                  style: 12.txtRegularDBlue,
                ),
                CommonPasswordInputField(
                    validator: (value) {
                      return Validations.checkConfirmPasswordValidations(
                          value, controller.passwordCtrl.text);
                    },
                    controller: controller.confirmPasswordCtrl,
                    hint: AppStrings.enterConfirmPassword),
                CommonIconButton(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 90, vertical: 18),
                    bkColor: AppColors.primaryBlue,
                    title: TextView(
                      margin: const EdgeInsets.only(right: 20),
                      text: AppStrings.addPersonalDetails,
                      style: 10.txtRegularWhite,
                    ),
                    leading: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 12,
                      child: Icon(Icons.add,
                          color: AppColors.primaryBlue, size: 18),
                    ),
                    onTap: () {
                      controller.showTutor.value = !controller.showTutor.value;
                    }),
                Obx(
                  () => Visibility(
                    visible: controller.showTutor.value,
                    child: Column(
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
                            )),
                        TextView(
                          margin: const EdgeInsets.only(left: 24, top: 16),
                          text: AppStrings.tutorEmail,
                          style: 12.txtRegularDBlue,
                        ),
                        CommonInputField(
                            validator: Validations.checkEmptyFieldValidations,
                            controller: controller.tutorEmailCtrl,
                            hint: AppStrings.enterTutorEmail),
                        TextView(
                          margin: const EdgeInsets.only(left: 24, top: 22),
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
                                  selectedDate: controller.selectedDate.value);
                            },
                            trailing: const Icon(
                              Icons.calendar_month,
                              color: AppColors.darkBlue,
                              size: 16,
                            ),
                            controller: controller.dobCtrl,
                            hint: AppStrings.selectDate),
                        TextView(
                          margin: const EdgeInsets.only(left: 24, top: 22),
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
                          margin: const EdgeInsets.only(left: 24, top: 22),
                          text: AppStrings.universityName,
                          style: 12.txtRegularDBlue,
                        ),
                        CommonInputField(
                            validator: Validations.checkEmptyFieldValidations,
                            controller: controller.schoolNCtrl,
                            hint: "Enter ${AppStrings.universityName}"),
                        TextView(
                          margin: const EdgeInsets.only(left: 24, top: 22),
                          text: AppStrings.preferred,
                          style: 12.txtRegularDBlue,
                        ),
                        AppDropDown<String>.singleSelect(
                          error: controller.classEr.value
                              ? AppStrings.selectCourseMst
                              : null,
                          borderColor: AppColors.darkBlue.withOpacity(0.8),
                          radius: 5,
                          hint: AppStrings.selectCourse,
                          list: controller.coursesList,
                          selectedValue: controller.course?.value,
                          singleValueBuilder: (value) => value,
                          itemBuilder: (value) => value,
                          onSingleChange: controller.selectedCourse,
                        ),
                        TextView(
                          margin: const EdgeInsets.only(left: 24, top: 22),
                          text: AppStrings.preferredSchedule,
                          style: 12.txtRegularDBlue,
                        ),
                        InkWell(
                          onTap: () {
                            context.pushNavigator(PreferredScheduleScreen());
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 6),
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: AppColors.darkBlue)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Obx(() => TextView(
                                      text: controller.getSelectedListStringify
                                                  .value ==
                                              ""
                                          ? AppStrings.availableDays
                                          : controller
                                              .getSelectedListStringify.value
                                      // controller.selectedDays.value
                                      ,
                                      style: 13.txtRegularDBlue)),
                                ),
                                Icon(Icons.keyboard_arrow_down_outlined,
                                    color: AppColors.greyText.withOpacity(0.7))
                              ],
                            ),
                          ),
                        ),
                        TextView(
                          margin: const EdgeInsets.only(left: 24, top: 22),
                          text: AppStrings.mailingAddress,
                          style: 12.txtRegularDBlue,
                        ),
                        CommonInputField(
                            validator: Validations.checkEmptyFieldValidations,
                            controller: controller.mailingAdrCtrl,
                            hint: AppStrings.enterMailingAddress),
                        TextView(
                          margin: const EdgeInsets.only(left: 24, top: 22),
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
                            marginTop: 32,
                            maxLines: 4,
                            controller: controller.addNoteCtrl,
                            hint: AppStrings.presentationMsg),
                      ],
                    ),
                  ),
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
                                width: 1.8, color: AppColors.darkBlue),
                          ),
                          checkColor: AppColors.darkBlue,
                          activeColor: AppColors.white,
                          value: controller.studentAgreeToTerms.value,
                          onChanged: (val) {
                            controller.studentAgreeToTerms.value = val!;
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
                    isLoading: controller.tutorLoader,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 24),
                    text: AppStrings.createAccount,
                    clickAction: () {
                      controller.checkValidation();
                      controller.update();
                      if (controller.tutorFormKey.currentState!.validate() &&
                          (controller.selectGender?.value != null) &&
                          (controller.course?.value != null) &&
                          (controller.selectExp?.value != null)) {
                        if (controller.showTutor.value == true) {
                          if (controller.studentAgreeToTerms.value) {
                            controller.teacherRegister();
                          } else {
                            AppAlerts.alert(message: AppStrings.acceptTerms);
                          }
                        } else {
                          AppAlerts.alert(
                              message: AppStrings.addPersonalDetailsMst);
                        }
                      } else {
                        controller.throwError();
                        controller.update();
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
