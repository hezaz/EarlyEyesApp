import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/utils/enum.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:early_eyes/utils/validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../components/coreComponents/TextView.dart';
import '../../../../../components/coreComponents/appDropDown.dart';
import '../../../../../components/coreComponents/app_date_picker.dart';
import '../../../../../components/coreComponents/common_button.dart';
import '../../../../../components/coreComponents/common_input_field.dart';
import '../../../../../components/coreComponents/common_toast.dart';
import '../../../../../components/coreComponents/editProfileImage.dart';
import '../../../../../components/styles/appColors.dart';
import '../../../../../components/styles/appImages.dart';
import '../../../../../components/styles/app_strings.dart';

import '../../../../controller/child_controller.dart';
import '../../../widgets/common_scaffold_widget.dart';

class AddChildScreen extends StatefulWidget {
  const AddChildScreen({super.key});

  @override
  State<AddChildScreen> createState() => _AddChildScreenState();
}

class _AddChildScreenState extends State<AddChildScreen> {
  final ctrl = Get.put(ChildController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (value) {
        ctrl.onClearState();
      },
      child: GetBuilder<ChildController>(
        builder: (ChildController controller) {
          return CommonScaffold(
            leading: Visibility(
              visible: controller.authType == AuthType.register,
              child: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Image.asset(
                    AppImages.backBtn,
                    height: 24,
                  )),
            ),
            title: AppStrings.addChild,
            body: Form(
              key: controller.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: ListView(
                children: [
                  GetX<ChildController>(
                    builder: (controller) {
                      return EditProfileImage(
                        size: 90,
                        imageData: controller.imageCtrl,
                        isEditable: true,
                        onChange: controller.onChangeImage,
                      );
                    },
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
                    text: AppStrings.className,
                    style: 12.txtRegularDBlue,
                  ),
                  Obx(
                    () => AppDropDown<String>.singleSelect(
                      error: controller.errorClass.value
                          ? AppStrings.selectClassMsg
                          : null,
                      borderColor: AppColors.darkBlue.withOpacity(0.8),
                      radius: 5,
                      hint: AppStrings.selectClass,
                      list: controller.classList,
                      selectedValue: controller.selectClass.value,
                      singleValueBuilder: (value) => value,
                      itemBuilder: (value) => value,
                      onSingleChange: controller.selectedClass,
                    ),
                  ),
                  TextView(
                    margin: const EdgeInsets.only(left: 24, top: 20),
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
                      hint: AppStrings.selectDate),
                  TextView(
                    margin: const EdgeInsets.only(left: 24, top: 20),
                    text: AppStrings.gender,
                    style: 12.txtRegularDBlue,
                  ),
                  Obx(
                    () => AppDropDown<String>.singleSelect(
                      error: controller.errorGender.value
                          ? AppStrings.selectGenderMsg
                          : null,
                      borderColor: AppColors.darkBlue.withOpacity(0.8),
                      radius: 5,
                      hint: AppStrings.selectGender,
                      list: controller.genderList,
                      selectedValue: controller.genderName.value,
                      singleValueBuilder: (value) => value,
                      itemBuilder: (value) => value,
                      onSingleChange: controller.selectGender,
                    ),
                  ),
                  TextView(
                    margin: const EdgeInsets.only(left: 24, top: 22),
                    text: AppStrings.experience,
                    style: 12.txtRegularDBlue,
                  ),
                  Obx(
                    () => AppDropDown<String>.singleSelect(
                      error: controller.errorExp.value
                          ? AppStrings.selectExp
                          : null,
                      borderColor: AppColors.darkBlue.withOpacity(0.8),
                      radius: 5,
                      hint: AppStrings.selectExperience,
                      list: controller.experience,
                      selectedValue: controller.selectExp.value,
                      singleValueBuilder: (value) => value,
                      itemBuilder: (value) => value,
                      onSingleChange: controller.selectedExp,
                    ),
                  ),
                  CommonInputField(
                      marginBottom: 24,
                      marginTop: 32,
                      maxLines: 4,
                      controller: controller.commentCtrl,
                      hint: AppStrings.presentationMsg),
                  CommonButton(
                      isLoading: controller.addChildLoader,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                      text: AppStrings.save,
                      clickAction: () {
                        controller.updateField();
                        controller.update();
                        try {
                          if (controller.formKey.currentState!.validate() &&
                              controller.selectExp.value != null &&
                              controller.selectClass.value != null &&
                              controller.genderName.value != null) {
                            controller.addChildDetails().then((value) {
                              context.pop();
                              controller.addChildLoader.value = false;
                              Get.back();

                              CommonToast.show(
                                msg: value,
                              );
                            });
                          } else {
                            controller.throwError();
                            controller.update();
                          }
                        } catch (e) {
                          print(e.toString());
                        }
                      }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
