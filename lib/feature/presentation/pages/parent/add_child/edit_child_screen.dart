

import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../components/coreComponents/TextView.dart';
import '../../../../../components/coreComponents/appDropDown.dart';
import '../../../../../components/coreComponents/app_date_picker.dart';
import '../../../../../components/coreComponents/common_button.dart';
import '../../../../../components/coreComponents/common_input_field.dart';
import '../../../../../components/coreComponents/common_toast.dart';
import '../../../../../components/coreComponents/editProfileImage.dart';
import '../../../../../components/styles/appColors.dart';
import '../../../../../components/styles/app_strings.dart';
import '../../../../controller/child_controller.dart';
import '../../../widgets/common_scaffold_widget.dart';


class EditChildScreen extends StatefulWidget {
  const EditChildScreen({super.key});

  @override
  State<EditChildScreen> createState() => _EditChildScreenState();
}

class _EditChildScreenState extends State<EditChildScreen> {
   final ctrl = Get.put(ChildController());


  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChildController>(
      builder: (controller) {
        return CommonScaffold(
          title: AppStrings.editChild,
          onBackTap: () {
            context.pop();
            ctrl.onClearState();
          },
          body: ListView(
            children: [
              Obx(
                () => EditProfileImage(
                  size: 90,
                  imageData: controller.imageCtrl,
                  isEditable: true,
                  onChange: controller.onChangeImage,
                ),
              ),
              TextView(
                margin: const EdgeInsets.only(left: 24, top: 32),
                text: AppStrings.fullName,
                style: 12.txtRegularDBlue,
              ),
              CommonInputField(
                  controller: controller.nameCtrl,
                  hint: AppStrings.enterFullName),
              TextView(
                margin: const EdgeInsets.only(left: 24, top: 20),
                text: AppStrings.email,
                style: 12.txtRegularDBlue,
              ),
              CommonInputField(
                  isEnable: false,
                  controller: controller.emailCtrl,
                  hint: AppStrings.enterEmail),
              TextView(
                margin: const EdgeInsets.only(left: 24, top:20),
                text: AppStrings.className,
                style: 12.txtRegularDBlue,
              ),
            GetX<ChildController>(builder: (controller) {
              return
                AppDropDown<String>.singleSelect(
                  borderColor: AppColors.darkBlue.withOpacity(0.8),
                  radius: 5,
                  hint: AppStrings.className,
                  list: controller.classList,
                  selectedValue: controller.selectClass.value,
                  singleValueBuilder: (value) => value,
                  itemBuilder: (value) => value,
                  onSingleChange: controller.selectedClass,
                );
            },),
              TextView(
                margin: const EdgeInsets.only(left: 24, top: 20),
                text: AppStrings.dateOfBirth,
                style: 12.txtRegularDBlue,
              ),
              CommonInputField(
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
                  hint: ''),
              TextView(
                margin: const EdgeInsets.only(left: 24, top: 20),
                text: AppStrings.gender,
                style: 12.txtRegularDBlue,
              ),
              AppDropDown<String>.singleSelect(
                borderColor: AppColors.darkBlue.withOpacity(0.8),
                radius: 5,
                // hint: controller.genderName,
                list: controller.genderList,
                selectedValue: controller.genderName.value ?? 'null',
                singleValueBuilder: (value) => value,
                itemBuilder: (value) => value,
                onSingleChange: controller.selectGender,
              ),
              TextView(
                margin: const EdgeInsets.only(left: 24, top: 24),
                text: AppStrings.experience,
                style: 12.txtRegularDBlue,
              ),
              AppDropDown<String>.singleSelect(
                borderColor: AppColors.darkBlue.withOpacity(0.8),
                radius: 5,
                hint: AppStrings.experience,
                list: controller.experience,
                selectedValue: controller.selectExp.value,
                singleValueBuilder: (value) => value,
                itemBuilder: (value) => value,
                onSingleChange: controller.selectedExp,
              ),
              CommonInputField(
                  marginBottom: 20,
                  marginTop: 28,
                  maxLines: 4,
                  controller: controller.commentCtrl,
                  hint: ''),
              CommonButton(
                  isLoading: controller.editChildLoader,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  text: AppStrings.done,
                  clickAction: () {
                    try {

                      controller
                          .editChild(controller.editId, controller.email)
                          .then((value) {
                        controller.editChildLoader.value = false;
                        context.pop();
                        CommonToast.show(
                          msg: value,
                        );
                      });

                    } catch (e) {
                      print(e.toString());
                    }
                  })
            ],
          ),
        );
      },
    );
  }
}
