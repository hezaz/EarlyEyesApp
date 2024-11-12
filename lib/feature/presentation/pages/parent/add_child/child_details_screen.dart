import 'package:early_eyes/components/coreComponents/common_button.dart';
import 'package:early_eyes/components/coreComponents/icon_button.dart';
import 'package:early_eyes/components/styles/appColors.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/controller/child_controller.dart';

import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../components/coreComponents/TextView.dart';
import '../../../../../components/styles/app_strings.dart';
import '../../../../../utils/enum.dart';
import '../../../widgets/common_scaffold_widget.dart';
import '../../home/home_screen.dart';
import 'add_child_screen.dart';
import 'child_details.dart';

class ChildDetailsScreen extends StatelessWidget {
  const ChildDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ChildController(),
      builder: (ChildController controller) {
        return CommonScaffold(
            floatingActionBtn:   Obx(() =>
            controller.childDetails.isNotEmpty
                ? CommonButton(
                    margin: const EdgeInsets.
                only(top: 350,left: 16,right: 16),
                    text: AppStrings.continueTxt,
                    clickAction: () {
                      context.pushAndClearNavigator(HomeScreen());
                    })
                : const SizedBox()),
          leading: const SizedBox(),
          actions: [
            TextView(
              onTap: () {
                context.pushAndClearNavigator(HomeScreen());
              },
              margin: const EdgeInsets.only(right: 16),
              text: AppStrings.skip,
              style: 18.txtSBoldPBlueText,
            )
          ],
          title: AppStrings.addChild,
          body:
          ListView(
            children: [

              ChildDetails(),
              CommonIconButton(
                  margin: const EdgeInsets.only(top: 16, left: 90, right: 90),
                  bkColor: AppColors.primaryBlue,
                  height: 45,
                  title: TextView(
                      text: AppStrings.addChild, style: 14.txtMediumWhite),
                  leading: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: AppColors.white,
                      radius: 20,
                      child: Icon(Icons.add,
                          size: 18, color: AppColors.primaryBlue),
                    ),
                  ),
                  onTap: () {
                    Get.to(AddChildScreen(),arguments: {
                      'type':AuthType.loginType
                    });
                  }),

            ],
          ),
        );
      },
    );
  }
}
