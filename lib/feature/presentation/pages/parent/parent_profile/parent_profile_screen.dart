import 'package:early_eyes/components/coreComponents/ImageView.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/controller/home_controller.dart';
import 'package:early_eyes/feature/presentation/widgets/common_scaffold_widget.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../../../components/coreComponents/TextView.dart';
import '../../../../../components/styles/appColors.dart';
import '../../../../../components/styles/app_strings.dart';
import '../../../../../services/network/ApiUrls.dart';


class ParentProfileScreen extends StatelessWidget {
  const ParentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init:
      HomeController(),
      builder: (HomeController controller) {
        return CommonScaffold(

          onBackTap: (){
            context.pop();

          },
          title: AppStrings.profile,
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            children: [
              Center(
                child: Obx(
                  () => ImageView(
                    url:
                        '${ApiUrls.baseUrlImage}${controller.userProfile.value?.profilePic}',
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
              TextView(
                 margin: const EdgeInsets.only(top: 24),
                  text: AppStrings.fullName, style: 14.txtBoldDarkBlue),
              Obx(
                () => TextView(
                    text:
                        controller.getProfile.value?.fullName.toString() ?? "",
                    style: 14.txtSBoldDarkBlue),
              ),
              TextView(
                  margin: const EdgeInsets.only(top: 16),
                  text: AppStrings.email,
                  style: 14.txtBoldDarkBlue),
              Obx(
                () => TextView(
                    text: controller.getProfile.value?.email.toString() ?? "",
                    style: 14.txtSBoldDarkBlue),
              ),
              TextView(
                  margin: const EdgeInsets.only(top: 16),
                  text: AppStrings.phone,
                  style: 14.txtBoldDarkBlue),
              Obx(
                    () => TextView(
                    text: controller.getProfile.value?.mobileNumber.toString() ?? "",
                    style: 14.txtSBoldDarkBlue),
              ),
              TextView(
                  margin: const EdgeInsets.only(top: 16),
                  text: AppStrings.relationshipOfStudent,
                  style: 14.txtBoldDarkBlue),
              Obx(
                () => TextView(
                    text: controller.getProfile.value?.userDetails?.relationship
                            .toString() ??
                        "",
                    style: 14.txtSBoldDarkBlue),
              ),
              TextView(
                  margin: const EdgeInsets.only(top: 16),
                  text: AppStrings.enrolledStudent,
                  style: 14.txtBoldDarkBlue),
              Obx(
                () => TextView(
                    text: controller
                                .getProfile.value?.userDetails?.relationship !=
                            null
                        ? "Yanish 9 years "
                        : "Yanish 9 years ",
                    style: 14.txtSBoldDarkBlue),
              ),
              TextView(
                  margin: const EdgeInsets.only(top: 16),
                  text: AppStrings.totalClassesAttend,
                  style: 14.txtBoldDarkBlue),
              Obx(
                () => TextView(
                    text: controller
                                .getProfile.value?.userDetails?.relationship !=
                            null
                        ? "Yanish 9 years"
                        : "Yanish 9 years",
                    style: 14.txtSBoldDarkBlue),
              ),
              TextView(
                  margin: const EdgeInsets.only(top: 16),
                  text: AppStrings.totalClassesRem,
                  style: 14.txtBoldDarkBlue),
              Obx(
                () => TextView(
                    text: controller
                                .getProfile.value?.userDetails?.relationship !=
                            null
                        ? "Yanish 9 years"
                        : "Yanish 9 years",
                    style: 14.txtSBoldDarkBlue),
              ),

            ],
          ),
        );
      },
    );
  }
}
