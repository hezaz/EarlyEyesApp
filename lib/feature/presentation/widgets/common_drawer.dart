import 'package:early_eyes/components/coreComponents/ImageView.dart';
import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/styles/textStyles.dart';


import 'package:early_eyes/services/network/ApiUrls.dart';
import 'package:early_eyes/services/prefrences/prefrences.dart';
import 'package:early_eyes/utils/appUtils.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/styles/appColors.dart';

import '../../../components/styles/app_strings.dart';
import '../../controller/home_controller.dart';
import '../pages/auth/login/login_screen.dart';
import 'common_dialog_card.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (HomeController controller) {
        return Drawer(
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            width: 250,
            backgroundColor: AppColors.white,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0, left: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 90,
                      color: Colors.white,
                      child: Obx(
                        () => ImageView(
                          fit: BoxFit.cover,
                          hasBorder: true,
                            borderRadius: 90,
                            radius: 90,
                            size: 90,
                            imageType: ImageType.network,
                            url:
                            '${ApiUrls.baseUrlImage}${controller.userProfile.value?.profilePic}'),
                      ),
                    ),
                    Expanded(
                      child: Obx(() => TextView(
                          margin: const EdgeInsets.only(left: 16),
                          text: controller.getProfile.value?.fullName ?? "",
                          style: 18.txtMediumDBlue)),
                    ),
                  ],
                ),
              ),
              ListView.separated(
                  padding: const EdgeInsets.only(top: 24, left: 16, right: 32),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Obx(
                      () => GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          controller.tabView(index);
                          if (index == 7) {
                            context.openDialog(CommonDialogCard(
                              isLoading: controller.logoutLoader,
                              msg: AppStrings.logout,
                              title: AppStrings.logoutMsg,
                              negativeCallBk: () {
                               Get.back();
                              },
                              positiveCallBk: () {
                                controller.userLogout().then((value) {
                                  AppUtils.log("ffdfsfsdfsdfsdfsf");
                                  context.pop();
                                  controller.logoutLoader.value = true;
                                  Preferences.user == null;
                                  Preferences.removeUserData();
                                  context.pushAndClearNavigator(LoginScreen());
                                });

                              },
                            ));
                          } else {
                            context.pop();
                            context.pushNavigator(
                                controller.drawerList[index].child!);
                          }
                        },
                        child: Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              margin: const EdgeInsets.only(right: 10),
                              child: Image.asset(
                                index == controller.selectedTab.value
                                    ? controller.drawerList[index].subtitle
                                        .toString()
                                    : controller.drawerList[index].description
                                        .toString(),
                              ),
                            ),
                            Expanded(
                              child: TextView(
                                // margin: const EdgeInsets.only(left: 16),
                                text: controller.drawerList[index].title
                                    .toString(),
                                style: index == controller.selectedTab.value
                                    ? 14.txtBoldPBlue
                                    : index == 7
                                        ? 14.txtRegularError
                                        : 14.txtRegularGreyHint,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            const Icon(Icons.arrow_forward_ios_outlined,
                                size: 12, color: AppColors.greyHint),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 20);
                  },
                  itemCount: controller.drawerList.length),
            ]));
      },
    );
  }
}
