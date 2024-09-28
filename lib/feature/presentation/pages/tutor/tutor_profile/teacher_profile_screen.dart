import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/presentation/widgets/common_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../components/coreComponents/ImageView.dart';
import '../../../../../components/coreComponents/TextView.dart';

import '../../../../../components/styles/appColors.dart';

import '../../../../../components/styles/app_strings.dart';
import '../../../../../services/network/ApiUrls.dart';
import '../../../../controller/home_controller.dart';
import '../../../widgets/common_richtext.dart';
import '../../../widgets/common_scaffold_widget.dart';

class TeacherProfileScreen extends StatefulWidget {
  const TeacherProfileScreen({super.key});

  @override
  State<TeacherProfileScreen> createState() => _TeacherProfileScreenState();
}

class _TeacherProfileScreenState extends State<TeacherProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (HomeController controller) {
        return CommonScaffold(
          hasDrawer: true,
          title: AppStrings.profile,
          body: ListView(
            children: [
              Center(
                child: Obx(() =>
                    ImageView(
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
              Obx(
                    () => Center(
                  child: TextView(
                      text: controller.getProfile.value?.fullName.toString() ??
                          "",
                      style: 16.txtBoldPBlue),
                ),
              ),
              Obx(() => CommonRichText(
                  title: 'Email:',
                  subtitle:
                  controller.getProfile.value?.email.toString() ?? "")),
              Obx(() => CommonRichText(
                  title: 'Phone :',
                  subtitle:
                  controller.getProfile.value?.mobileNumber.toString() ?? "")),
              Obx(() => CommonRichText(
                  title: 'Gender:',
                  subtitle: controller.userProfile.value?.gender.toString() ?? "")),
              Obx(() => CommonRichText(
                title: 'Date of Birth:',
                subtitle: DateFormat('dd-MM-yyyy').format(DateTime.parse('${controller.userProfile.value?.dob.toString()}')),

              )),

              Obx(() => CommonRichText(
                title: 'University:',
                subtitle: '${controller.userProfile.value?.schoolName.toString()}',

              )),
              Obx(() => CommonRichText(
                title: 'Mailing Address:',
                subtitle: '${controller.userProfile.value?.mailingAddress.toString()}',

              )),

              Obx(() => CommonRichText(
                  title: 'Experience:',
                  subtitle:
                  controller.userProfile.value?.experience.toString() ?? "")),
              Divider(
                height:40,
                indent: 16,
                endIndent: 16,
                color: AppColors.primaryBlue.withOpacity(0.5),
              ),
              TextView(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  text: 'Billing & Contract',style: 14.txtBoldDarkBlue),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(child: CommonCard(
                      margin: const EdgeInsets.only(left: 16,right: 4),
                      borderClr: AppColors.primaryBlue,
                      onTap: (){},
                        child: Center(
                          child: TextView(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                          text: 'Request Billing',style: 14.txtSBoldPBlueText),
                        ))),
                    Expanded(child: CommonCard(
                      margin: const EdgeInsets.only(right: 16,left: 4),
                        borderClr: AppColors.primaryBlue,
                        onTap: (){},
                        child: Center(
                          child: TextView(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              text: 'Request Billing',style: 14.txtSBoldPBlueText),
                        )))
                  ],
                ),
              ),
              CommonCard(
                  margin: const EdgeInsets.only(right: 180,left: 32),
                  borderClr: AppColors.primaryBlue,
                  onTap: (){},
                  child: Center(
                    child: TextView(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        text: 'Check Balance',style: 14.txtSBoldPBlueText),
                  ))

            ],
          ),
        );
      },
    );
  }
}
