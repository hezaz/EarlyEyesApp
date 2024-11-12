import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../components/coreComponents/ImageView.dart';
import '../../../../../components/styles/appColors.dart';
import '../../../../../components/styles/appImages.dart';
import '../../../../../components/styles/app_strings.dart';
import '../../../../../services/network/ApiUrls.dart';
import '../../../../controller/home_controller.dart';
import '../../../widgets/common_richtext.dart';
import '../../../widgets/common_scaffold_widget.dart';
import '../../../widgets/courses_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (HomeController controller) {
        return CommonScaffold(
          onBackTap: () {
            context.pop();
          },
          title: AppStrings.profile,
          body:
          ListView(
            children: [
              Center(
                child: Obx(() =>
                  ImageView(
                    url: '${ApiUrls.baseUrlImage}${controller.userProfile.value?.profilePic}',
                    imageType: ImageType.network,
                    radiusWidth: 3.0,
                    radius: 100,
                    size: 92,
                    borderRadius: 100,
                    borderColor: AppColors.darkBlue,
                    hasBorder: true,
                    margin: EdgeInsets.zero,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Obx(
                () => Center(
                  child: TextView(
                      text: controller.getProfile.value?.fullName.toString() ??
                          "",
                      style: 15.txtBoldPBlue),
                ),
              ),
              Obx(() => CommonRichText(
                  title: 'Email:',
                  subtitle:
                      controller.getProfile.value?.email.toString() ?? "")),
              Obx(() => CommonRichText(
                  title: 'Gender:',
                  subtitle: controller.userProfile.value?.gender.toString() ?? "")),
              Obx(() => CommonRichText(
                title: 'Date of Birth:',
                subtitle: controller.userProfile.value?.dob != null
                    ? DateFormat('dd-MM-yyyy').format(DateTime.parse(controller.userProfile.value!.dob.toString()))
                    : '',
              )),

              Obx(() => CommonRichText(
                  title: 'Class:',
                  subtitle:
                      controller.userProfile.value?.userDetailsClass ?? "")),


              Obx(() => CommonRichText(
                  title: 'Experience:',
                  subtitle:
                      controller.userProfile.value?.experience.toString() ?? "")),

              Padding(
                padding: const EdgeInsets.only(top: 16,bottom: 8),
                child: Divider(
                  indent: 16,
                  endIndent: 16,
                  color: AppColors.primaryBlue.withOpacity(0.5),
                ),
              ),
              Image.asset(
                AppImages.shuffle,
                height: 35,
              ),
              CoursesView(
              ),
            ],
          ),
        );
      },
    );
  }
}
