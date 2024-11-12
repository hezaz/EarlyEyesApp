import 'package:dotted_border/dotted_border.dart';
import 'package:early_eyes/components/coreComponents/common_app_bar.dart';
import 'package:early_eyes/components/coreComponents/common_button.dart';
import 'package:early_eyes/components/styles/appImages.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/controller/settings_controller.dart';
import 'package:early_eyes/feature/presentation/widgets/common_scaffold_widget.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/coreComponents/TextView.dart';
import '../../../../components/coreComponents/appDropDown.dart';
import '../../../../components/coreComponents/common_input_field.dart';
import '../../../../components/styles/appColors.dart';
import '../../../../components/styles/app_strings.dart';
import '../../../controller/profile_controller.dart';

class AddProjectScreen extends StatelessWidget {
  const AddProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProfileController(),
      builder: (ProfileController controller) {
        return CommonScaffold(
          onBackTap: () {
            context.pop();
          },
          title: AppStrings.addProject,

          body: ListView(
            children: [
              TextView(
                margin: const EdgeInsets.only(left: 16, top: 16),
                text: AppStrings.projectName,
                style: 12.txtRegularDBlue,
              ),
              CommonInputField(
                  controller: controller.emailCtrl,
                  hint: AppStrings.enterProject),
              TextView(
                margin: const EdgeInsets.only(left: 16, top: 16),
                text: AppStrings.course,
                style: 12.txtRegularDBlue,
              ),
              Container(
                // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                // height: 45,
                child: AppDropDown<String>.singleSelect(
                  borderColor: AppColors.darkBlue.withOpacity(0.8),
                  radius: 5,
                  hint: AppStrings.selectCourse,
                  list: controller.coursesList,
                  selectedValue: controller.course.value,
                  singleValueBuilder: (value) => value,
                  itemBuilder: (value) => value,
                  onSingleChange: (value) => controller.selectedCourse(value),
                ),
              ),
              TextView(
                margin: const EdgeInsets.only(left: 16, top: 16),
                text: AppStrings.className,
                style: 12.txtRegularDBlue,
              ),
              Container(
                // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                // height: 45,
                child: AppDropDown<String>.singleSelect(
                  borderColor: AppColors.darkBlue.withOpacity(0.8),
                  radius: 5,
                  hint: AppStrings.selectClass,
                  list: controller.classList,
                  selectedValue: controller.selectClass.value,
                  singleValueBuilder: (value) => value,
                  itemBuilder: (value) => value,
                  onSingleChange: (value) => controller.selectedClass,
                ),
              ),
              TextView(
                margin: const EdgeInsets.only(left: 16, top: 16),
                text: AppStrings.attachments,
                style: 12.txtRegularDBlue,
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.darkBlue)),
                  height: 45,
                  child: Row(
                    children: [
                      TextView(
                          text: 'Upload Attachments',
                          style: 12.txtRegularDBlue),
                      const Spacer(),
                      Image.asset(AppImages.addFile, height: 18)
                    ],
                  )),
              TextView(
                margin: const EdgeInsets.only(left: 16, top: 16),
                text: AppStrings.url,
                style: 12.txtRegularDBlue,
              ),
              CommonInputField(
                  controller: controller.urlCtrl, hint: AppStrings.insertLink),
              TextView(
                  margin: const EdgeInsets.only(left: 16, top: 18),
                  text: AppStrings.completedDate,
                  style: 12.txtRegularDBlue),
              CommonInputField(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  trailing: const Icon(
                    Icons.calendar_month,
                    color: AppColors.darkBlue,
                    size: 16,
                  ),
                  controller: controller.emailCtrl,
                  hint: "MM/DD/YY"),
              TextView(
                  margin: const EdgeInsets.only(left: 16, top: 18),
                  text: AppStrings.projectDescription,
                  style: 12.txtRegularDBlue),
              CommonInputField(
                  maxLines: 4,
                  controller: controller.descriptionCtrl,
                  hint: AppStrings.description),
              TextView(
                  margin: const EdgeInsets.only(left: 16, top: 18),
                  text: AppStrings.uploadImages,
                  style: 12.txtRegularDBlue),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Image.asset(AppImages.test1)),
                    Expanded(
                        child: DottedBorder(
                          radius : const Radius.circular(4),
                          borderType: BorderType.RRect,
                          strokeWidth: 1,
                          padding: const EdgeInsets.all(12),
                          borderPadding: const EdgeInsets.all(8),
                          child: Container(
                            height: 68,
                            width: 120,
                            color: AppColors.white,
                            child: Center(child: Image.asset(AppImages.gallery,height:30)),
                          ),
                        )),
                    Expanded(
                        child: DottedBorder(
                          radius : const Radius.circular(4),
                          borderType: BorderType.RRect,
                          strokeWidth: 1,
                          padding: const EdgeInsets.all(12),
                          borderPadding: const EdgeInsets.all(8),
                          child: Container(
                            height: 68,
                            width: 120,
                            color: AppColors.white,
                            child: Center(child: Image.asset(AppImages.gallery,height:30)),
                          ),
                        )),
                    Expanded(
                        child: DottedBorder(
                          radius : const Radius.circular(4),
                          borderType: BorderType.RRect,
                          strokeWidth: 1,
                          padding: const EdgeInsets.all(12),
                          borderPadding: const EdgeInsets.all(8),
                          child: Container(
                            height: 68,
                            width: 120,
                            color: AppColors.white,
                            child: Center(child: Image.asset(AppImages.gallery,height:30)),
                          ),
                        )),
                  ],
                ),
              ),
              CommonButton(
                  margin: const EdgeInsets.only(left: 32,right: 32,bottom: 50,top: 24),
                  text: AppStrings.submit, clickAction:(){})
            ],
          ),
        );
      },
    );
  }
}
