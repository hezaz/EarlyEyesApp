import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/styles/appColors.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/controller/auth_controller.dart';
import 'package:early_eyes/feature/presentation/widgets/common_card.dart';
import 'package:early_eyes/feature/presentation/widgets/common_scaffold_widget.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/coreComponents/appToggle.dart';

class PreferredScheduleScreen extends StatelessWidget {
  const PreferredScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AuthController(),
      builder: (AuthController controller) {
        return CommonScaffold(
          onBackTap: () {
            context.pop();
          },
          body: ListView(
            children: [
              TextView(
                  margin: const EdgeInsets.only(left: 16),
                  text: AppStrings.selectAvailableDays,
                  style: 18.txtSBoldDarkBlue),
              ListView.separated(
                padding: const EdgeInsets.symmetric(vertical:24),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Obx(
                      () => CommonCard(
                       
                          borderClr:AppColors.black.withOpacity(0.4),
                          radius:4,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextView(
                                  text: controller.availableDays[index].title
                                      .toString(),style: 16.txtSBoldBlack),
                              AppToggle(
                                state:
                                    controller.availableDays[index].isSelected,
                                onChanged: (val) {
                                  controller.onToggle(index);
                                },
                              )
                            ],
                          )),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 16);
                  },
                  itemCount: controller.availableDays.length)
            ],
          ),
        );
      },
    );
  }
}
