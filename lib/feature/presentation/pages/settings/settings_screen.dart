import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/styles/appColors.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/presentation/pages/parent/parent_profile/edit_parent_profile_screen.dart';
import 'package:early_eyes/feature/presentation/pages/tutor/tutor_profile/edit_teacher_profile_screen.dart';
import 'package:early_eyes/feature/presentation/pages/settings/settings_page/about_us_screen.dart';
import 'package:early_eyes/feature/presentation/pages/settings/settings_page/change_password_screen.dart';
import 'package:early_eyes/feature/presentation/pages/student/student_profile/edit_profile_screen.dart';
import 'package:early_eyes/feature/presentation/pages/settings/settings_page/faq_screen.dart';
import 'package:early_eyes/feature/presentation/pages/settings/settings_page/privacy_policy_screen.dart';
import 'package:early_eyes/feature/presentation/pages/settings/settings_page/report_screen.dart';
import 'package:early_eyes/feature/presentation/pages/settings/settings_page/terms_conditions_screen.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/styles/appImages.dart';
import '../../../../components/styles/app_strings.dart';
import '../../../../services/prefrences/prefrences.dart';

import '../../../controller/home_controller.dart';
import '../../widgets/common_dialog_card.dart';
import '../../widgets/common_scaffold_widget.dart';
import '../auth/login/login_screen.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (HomeController controller) {
        return CommonScaffold(
          onBackTap: (){
            context.pop();
          },
          //hasDrawer: true,
          title: AppStrings.settings,
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              TextView(
                  margin: const EdgeInsets.only(top: 8, bottom: 8),
                  text: AppStrings.account,
                  style: 20.txtMediumPBlue),
              ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        index == 0
                            ? Preferences.user?.roleId == 1
                                ? context.pushNavigator(EditProfileScreen())
                                : Preferences.user?.roleId == 2
                                    ? context.pushNavigator(
                                        EditParentProfileScreen())
                                    : context.pushNavigator(
                                        EditTeacherProfileScreen())
                            : context.pushNavigator(ChangePasswordScreen());
                      },
                      child: Row(
                        children: [
                          Image.asset(
                              controller.accountOptions[index].image.toString(),
                              height: 16),
                          TextView(
                            text: controller.accountOptions[index].title
                                .toString(),
                            style: 14.txtRegularDBlue,
                            margin: const EdgeInsets.only(left: 10),
                          ),
                          const Spacer(),
                          const Icon(Icons.arrow_forward_ios_outlined,
                              size: 14),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 18);
                  },
                  itemCount: controller.accountOptions.length),
                  TextView(
                  margin: const EdgeInsets.only(top: 8, bottom: 8),
                  text: AppStrings.support,
                  style: 20.txtMediumPBlue),
              ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        index == 0
                            ? context.pushNavigator(FaqScreen())
                            : index == 1
                                ? context.pushNavigator(AboutUsScreen())
                                : index == 2
                                    ? context
                                        .pushNavigator(TermsConditionScreen())
                                    : context
                                        .pushNavigator(PrivacyPolicyScreen());
                      },
                      child: Row(
                        children: [
                          Image.asset(
                              controller.supportOptions[index].image.toString(),
                              height: 16),
                          TextView(
                            text: controller.supportOptions[index].title
                                .toString(),
                            style: 14.txtRegularDBlue,
                            margin: const EdgeInsets.only(left: 10),
                          ),
                          const Spacer(),
                          const Icon(Icons.arrow_forward_ios_outlined,
                              size: 14),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 18);
                  },
                  itemCount: controller.supportOptions.length),
              TextView(
                  margin: const EdgeInsets.only(top: 8, bottom: 8),
                  text: AppStrings.action,
                  style: 20.txtMediumPBlue),
              ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        index == 0
                            ? context.pushNavigator(ReportScreen())
                            : index == 1
                                ? context.openDialog(CommonDialogCard(
                                    isLoading: controller.logoutLoader,
                                    msg: AppStrings.logout,
                                    title: AppStrings.logoutMsg,
                                    negativeCallBk: () {
                                      Get.back();
                                    },
                                    positiveCallBk: () {
                                      controller.userLogout().then((value) {
                                        controller.logoutLoader.value = false;
                                        Preferences.user == null;
                                        Preferences.removeUserData();
                                        context.pushAndClearNavigator(
                                            LoginScreen());
                                      });
                                    },
                                  ))
                                : context.openDialog(CommonDialogCard(
                                    isLoading: controller.deleteAccLoader,
                                    icon: AppImages.delete2,
                                    msg: AppStrings.deleteAcc,
                                    title: AppStrings.deleteMsg,
                                    negativeCallBk: () {
                                     Get.back();
                                    },
                                    positiveCallBk: () {
                                      controller.deleteAccount().then((value) {
                                        controller.deleteAccLoader.value = false;
                                        Get.deleteAll();
                                        Preferences.removeUserData();
                                        context.pushAndClearNavigator(
                                            LoginScreen());
                                      });
                                    },
                                  ));
                      },
                      child: Row(
                        children: [
                          Image.asset(
                              controller.actionsOptions[index].image.toString(),
                              height: 16),
                          TextView(
                            text: controller.actionsOptions[index].title
                                .toString(),
                            style: 14.txtRegularDBlue.copyWith(
                                color: index == 2
                                    ? Colors.red
                                    : AppColors.darkBlue),
                            margin: const EdgeInsets.only(left: 10),
                          ),
                          const Spacer(),
                          const Icon(Icons.arrow_forward_ios_outlined,
                              size: 14),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 18);
                  },
                  itemCount: controller.actionsOptions.length),
            ],
          ),
        );
      },
    );
  }
}
