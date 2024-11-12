import 'package:early_eyes/components/coreComponents/common_button.dart';
import 'package:early_eyes/components/coreComponents/common_input_field.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/presentation/widgets/common_scaffold_widget.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../components/coreComponents/TextView.dart';
import '../../../../../components/styles/app_strings.dart';
import '../../../../controller/profile_controller.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProfileController(),
      builder: (ProfileController controller) {
        return CommonScaffold(
          onBackTap: (){
            context.pop();
          },
          title: AppStrings.report,

          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                margin: const EdgeInsets.only(left: 24, top: 16),
                text: AppStrings.email,
                style: 12.txtRegularDBlue,
              ),
              CommonInputField(
                  controller: controller.reportEmailCtrl,
                  hint: AppStrings.enterEmail),
              TextView(
                margin: const EdgeInsets.only(left: 24, top: 16),
                text: AppStrings.title,
                style: 12.txtRegularDBlue,
              ),
              CommonInputField(
                  controller: controller.reportTitleCtrl,
                  hint: AppStrings.enterTitle),
              TextView(
                margin: const EdgeInsets.only(left: 24, top: 16),
                text: AppStrings.message,
                style: 12.txtRegularDBlue,
              ),
              CommonInputField(
                  controller: controller.reportMessageCtrl,
                  hint: AppStrings.enterMessage),
              CommonButton(
                  margin: const EdgeInsets.only(top: 120, left: 32, right: 32),
                  text: AppStrings.submit,
                  clickAction: () {})
            ],
          ),
        );
      },
    );
  }
}
