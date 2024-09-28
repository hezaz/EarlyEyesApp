import 'package:early_eyes/components/coreComponents/common_button.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/controller/settings_controller.dart';
import 'package:early_eyes/feature/presentation/widgets/common_scaffold_widget.dart';
import 'package:early_eyes/utils/alert_service.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../components/coreComponents/TextView.dart';
import '../../../../../components/coreComponents/common_password_input_field.dart';
import '../../../../../utils/validations.dart';
import '../../../../controller/profile_controller.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProfileController(),
      builder: (ProfileController controller) {
        return CommonScaffold(
          onBackTap: () {
            context.pop();
          },
          title: AppStrings.changePassword,
          body: Form(
            key: controller.formKey,
            child: ListView(
              children: [
                TextView(
                    margin: const EdgeInsets.only(left: 16, top: 20),
                    text: AppStrings.oPassword,
                    style: 14.txtRegularDBlue),
                CommonPasswordInputField(
                  validator: Validations.checkOldPasswordValidations,
                    marginBottom: 26,
                    controller: controller.oPassCtrl,
                    hint: AppStrings.enterOldPassword),
                TextView(
                    margin: const EdgeInsets.only(
                      left: 16,
                    ),
                    text: AppStrings.nPassword,
                    style: 14.txtRegularDBlue),
                CommonPasswordInputField(
                  validator: Validations.checkPasswordValidations,
                    marginBottom: 26,
                    controller: controller.nPassCtrl,
                    hint: AppStrings.enterNewPassword),
                TextView(
                    margin: const EdgeInsets.only(left: 16),
                    text: AppStrings.cPassword,
                    style: 14.txtRegularDBlue),
                CommonPasswordInputField(
                  marginBottom: 26,
                    validator: (value) {
                      return Validations.checkConfirmPasswordValidations(
                          value, controller.nPassCtrl.text);
                    },
                    controller: controller.cPassCtrl,
                    hint: AppStrings.enterConfirmPassword),
                CommonButton(
                    isLoading: controller.isLoading,
                    margin:
                        const EdgeInsets.only(left: 32, right: 32, bottom: 40),
                    text: AppStrings.saveChanges,
                    clickAction: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.changePassword().then((value) {

                          controller.isLoading.value = false;
                          controller.oPassCtrl.clear();
                          controller.nPassCtrl.clear();
                          controller.cPassCtrl.clear();
                          context.pop();
                          AppAlerts.success(value);
                          // CommonToast.show(msg: value);
                        });
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
