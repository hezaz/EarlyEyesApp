import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/coreComponents/common_app_bar.dart';
import 'package:early_eyes/components/styles/appColors.dart';
import 'package:early_eyes/components/styles/appImages.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/presentation/widgets/common_scaffold_widget.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/notification_controller.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NotificationController(),
      builder: (NotificationController controller) {
        return CommonScaffold(
          onBackTap: () {
            context.pop();
          },
          title: AppStrings.notification,

          body: ListView.separated(
              padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.setIndex(index);
                    },
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 12),
                      decoration: BoxDecoration(
                          color: index == controller.selectedCard.value
                              ? AppColors.greyF0
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(4.0)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const CircleAvatar(
                                  radius: 20,
                                  backgroundImage:
                                      AssetImage(AppImages.profile1)),
                              TextView(
                                  margin:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  text: "Day Wood",
                                  style: 13.txtBoldBlack),
                              Expanded(
                                child: TextView(
                                    margin: EdgeInsets.zero,
                                    text: "added your new course",
                                    style: 12.txtRegularLBlack),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextView(
                                margin: EdgeInsets.zero,
                                text: "1d ago",
                                style: 10.txtRegularLBlack),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: 4),
        );
      },
    );
  }
}
