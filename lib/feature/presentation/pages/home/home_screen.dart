import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/styles/appColors.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/controller/home_controller.dart';
import 'package:early_eyes/feature/presentation/pages/home/parent_view.dart';
import 'package:early_eyes/feature/presentation/pages/home/student_view.dart';
import 'package:early_eyes/feature/presentation/pages/home/tutor_view.dart';
import 'package:early_eyes/feature/presentation/pages/notification/notification_screen.dart';
import 'package:early_eyes/services/prefrences/prefrences.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/coreComponents/ImageView.dart';
import '../../../../services/network/ApiUrls.dart';
import '../../widgets/common_scaffold_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ctrl = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    ctrl.refreshToken();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (HomeController controller) {
        return CommonScaffold(
          title: AppStrings.home,
          hasDrawer: true,
          actions: [
            IconButton(
                onPressed: () {
                  context.pushNavigator(NotificationScreen());
                },
                icon: const Icon(
                  Icons.notifications_none,
                  color: AppColors.primaryBlue,
                )),
          ],
          body: Obx(() {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }

            return ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                          () => SizedBox(
                        height: 100,
                        width: 120,
                        child: Center(
                          child: ImageView(
                            url:
                            '${ApiUrls.baseUrlImage}${controller.userProfile.value?.profilePic}',
                            imageType: ImageType.network,
                            radiusWidth: 3.0,
                            borderRadius: 100,
                            radius: 100,
                            size: 92,
                            borderColor: AppColors.darkBlue,
                            hasBorder: true,
                            margin: EdgeInsets.zero,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Obx(() => TextView(
                          text: controller.getProfile.value?.fullName != null
                              ? 'Hello, ${controller.getProfile.value?.fullName}'
                              : "",
                          style: 18.txtMediumDBlue)),
                    ),
                  ],
                ),
                TextView(
                    margin: const EdgeInsets.only(
                        left: 16, right: 16, bottom: 24, top: 16),
                    text: Preferences.user?.roleId == 1
                        ? AppStrings.studentText
                        : Preferences.user?.roleId == 3
                        ? AppStrings.tutorText
                        : AppStrings.parentText,
                    style: 15.txtRegularDBlue),
                Preferences.user?.roleId == 2
                    ? ParentView()
                    : Preferences.user?.roleId == 1
                    ? StudentView()
                    : TutorView(),
              ],
            );
          }),
        );
      },
    );
  }
}
