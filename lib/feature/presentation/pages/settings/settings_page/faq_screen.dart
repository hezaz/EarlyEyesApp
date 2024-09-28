import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/coreComponents/common_app_bar.dart';
import 'package:early_eyes/components/styles/appColors.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/presentation/widgets/common_scaffold_widget.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/profile_controller.dart';
import '../../../../controller/settings_controller.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProfileController(),
      builder: (ProfileController controller) {
        return CommonScaffold(
          onBackTap: () {
            controller.selectedIndex.value = (-1);
            context.pop();
          },
          title: AppStrings.faq.toUpperCase(),

          body: ListView(
            children: [
              Divider(
                indent: 16,
                endIndent: 16,
                color: AppColors.primaryBlue.withOpacity(0.3),
              ),
              ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Obx(
                          () => GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              controller.setIndex(index);
                            },
                            child: Row(
                              children: [
                                TextView(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  text: 'What is Early Eyes Education?',
                                  style: 15.txtMediumDBlue,
                                ),
                                const Spacer(),
                                Container(
                                  height: 16,
                                  width: 16,
                                  color: AppColors.darkBlue,
                                  child: Center(
                                    child: Icon(
                                      index == controller.selectedIndex.value
                                          ? Icons.remove
                                          : Icons.add,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Obx(
                          () => Visibility(
                            visible: index == controller.selectedIndex.value,
                            child: TextView(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              text:
                                  'Early Eyes Education provides online programming workshops '
                                  'to children and teenagers. Our interactive coding classes '
                                  'are taught by experienced tutors. No skill level is required'
                                  ' to start, and enrolment is open all year round.',
                              style: 14.txtRegularDBlue,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: AppColors.primaryBlue.withOpacity(0.3),
                    );
                  },
                  itemCount: 8)
            ],
          ),
        );
      },
    );
  }
}
