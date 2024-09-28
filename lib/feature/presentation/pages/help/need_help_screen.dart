import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/coreComponents/common_button.dart';
import 'package:early_eyes/components/coreComponents/common_input_field.dart';
import 'package:early_eyes/components/coreComponents/common_toast.dart';
import 'package:early_eyes/components/styles/appColors.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/feature/controller/home_controller.dart';
import 'package:early_eyes/feature/data/models/requestModels/courses_res_model.dart';
import 'package:early_eyes/feature/presentation/widgets/common_scaffold_widget.dart';
import 'package:early_eyes/utils/alert_service.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:early_eyes/utils/validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/coreComponents/appDropDown.dart';

class NeedHelpScreen extends StatefulWidget {
  const NeedHelpScreen({super.key});

  @override
  State<NeedHelpScreen> createState() => _NeedHelpScreenState();
}

class _NeedHelpScreenState extends State<NeedHelpScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (HomeController controller) {
        return CommonScaffold(
          onBackTap: () {
            context.pop();
          },
          title: AppStrings.needHelp1,
          body: Form(
            key: controller.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(
              children: [
                Divider(color: AppColors.primaryBlue.withOpacity(0.4)),
                const TextView(
                    margin: EdgeInsets.only(left: 16, top: 20),
                    text: AppStrings.title),
                CommonInputField(
                    controller: controller.titleCtrl,
                    hint: AppStrings.enterTitle),
                const TextView(
                    margin: EdgeInsets.only(left: 16, top: 20),
                    text: AppStrings.course),
                Obx(
                  () => AppDropDown<Courses>.singleSelect(
                    error: controller.helpEr.value
                        ? AppStrings.selectCourseMst
                        : null,
                    borderColor: AppColors.darkBlue.withOpacity(0.8),
                    radius: 5,
                    hint: AppStrings.selectCourse,
                    list: controller.courses,
                    singleValueBuilder: (value) => value.courseTitle,
                    selectedValue: controller.courseName.value,
                    itemBuilder: (value) => value.courseTitle,
                    onSingleChange: (value) => controller.onChanged(value),
                  ),
                ),
                const TextView(
                    margin: EdgeInsets.only(left: 16, top: 20),
                    text: AppStrings.message),
                CommonInputField(
                    validator: Validations.checkEmptyFieldValidations,
                    controller: controller.messageCtrl,
                    hint: AppStrings.enterMessage),
                CommonButton(
                    isLoading: controller.helpLoader,
                    margin:
                        const EdgeInsets.only(left: 16, right: 16, top: 150),
                    text: AppStrings.submit,
                    clickAction: () {
                      controller.helpEr.value = false;
                      controller.helpEr.refresh();
                      if (controller.formKey.currentState!.validate() &&
                          controller.courseName.value != null) {
                        controller.needHelp().then((val) {
                          controller.onClearState();
                          controller.helpLoader.value = false;
                          AppAlerts.success(val);

                          context.pop();
                        });
                      } else {
                        controller.helpEr.value = true;
                        controller.helpEr.refresh();
                      }
                    })
              ],
            ),
          ),
        );
      },
    );
  }
}
