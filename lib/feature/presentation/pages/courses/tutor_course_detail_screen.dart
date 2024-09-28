import 'package:early_eyes/components/coreComponents/common_button.dart';
import 'package:early_eyes/components/styles/appColors.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/controller/home_controller.dart';
import 'package:early_eyes/feature/presentation/widgets/common_card.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/coreComponents/ImageView.dart';
import '../../../../components/coreComponents/TextView.dart';
import '../../../../components/styles/appImages.dart';
import '../../../../components/styles/app_strings.dart';
import '../../widgets/common_scaffold_widget.dart';
import '../payment/select_payment_screen.dart';

class TutorCourseDetailScreen extends StatefulWidget {
  TutorCourseDetailScreen({super.key});

  @override
  State<TutorCourseDetailScreen> createState() =>
      _TutorCourseDetailScreenState();
}

class _TutorCourseDetailScreenState extends State<TutorCourseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (HomeController controller) {
        return CommonScaffold(
          onBackTap: () {
            context.pop();
          },
          title: AppStrings.courseDetails,
          body: ListView(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: ImageView(
                    width: context.getWidth,
                    radius: 18,
                    fit: BoxFit.cover,
                    imageType: ImageType.network,
                    url: controller.thumbnail.value.toString()),
              ),
              TextView(
                  margin: const EdgeInsets.only(left: 16),
                  text: AppStrings.courseTitle,
                  style: 14.txtBoldBlack),
              TextView(
                margin: const EdgeInsets.only(left: 16, top: 4),
                text:
                    "${controller.courseTitle.value.toString()} Programming Workshop",
                style: 12.txtRegularDBlue,
              ),
              TextView(
                  margin: const EdgeInsets.only(left: 16, top: 16),
                  text: AppStrings.description,
                  style: 14.txtBoldBlack),
              TextView(
                margin: const EdgeInsets.only(left: 16, top: 4),
                text: controller.courseTitle.value.toString(),
                style: 12.txtRegularDBlue,
              ),
              TextView(
                  margin: const EdgeInsets.only(left: 16, top: 16),
                  text: AppStrings.objectives,
                  style: 14.txtBoldBlack),
              TextView(
                margin: const EdgeInsets.only(left: 16, top: 4, right: 16),
                text: AppStrings.dummyText2,
                style: 12.txtRegularDBlue,
              ),
              TextView(
                margin: const EdgeInsets.only(
                    left: 16, top: 24, right: 16, bottom: 8),
                text: AppStrings.chooseLevel,
                style: 13.txtRegularDBlue,
              ),
              CommonCard(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                onTap: () {
                  // context.openDialog(TextView(text: "dcbdsh"));
                },
                radius: 4,
                borderClr: AppColors.darkBlue,
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                child: Row(
                  children: [
                    TextView(
                        text: AppStrings.selectLevel,
                        style: 12.txtRegularGreyHint),
                    const Spacer(),
                    const Icon(Icons.keyboard_arrow_down_outlined,
                        color: AppColors.darkBlue)
                  ],
                ),
              ),
              TextView(
                margin: const EdgeInsets.only(
                    left: 16, top: 24, right: 16, bottom: 8),
                text: AppStrings.sessionHours,
                style: 13.txtRegularDBlue,
              ),
              CommonCard(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                onTap: () {
                  // context.openDialog(TextView(text: "dcbdsh"));
                },
                radius: 4,
                borderClr: AppColors.darkBlue,
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                child: Row(
                  children: [
                    TextView(
                        text: AppStrings.selectSessionHrs,
                        style: 12.txtRegularGreyHint),
                    const Spacer(),
                    const Icon(Icons.keyboard_arrow_down_outlined,
                        color: AppColors.darkBlue)
                  ],
                ),
              ),
              TextView(
                margin: const EdgeInsets.only(
                    left: 16, top: 24, right: 16, bottom: 8),
                text: AppStrings.choosePack,
                style: 13.txtRegularDBlue,
              ),
              CommonCard(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                onTap: () {
                  // context.openDialog(TextView(text: "dcbdsh"));
                },
                radius: 4,
                borderClr: AppColors.darkBlue,
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                child: Row(
                  children: [
                    TextView(
                        text: AppStrings.selectLevel,
                        style: 12.txtRegularGreyHint),
                    const Spacer(),
                    const Icon(Icons.keyboard_arrow_down_outlined,
                        color: AppColors.darkBlue)
                  ],
                ),
              ),
              TextView(
                margin: const EdgeInsets.only(
                    left: 16, top: 24, right: 16, bottom: 8),
                text: AppStrings.startDate,
                style: 13.txtRegularDBlue,
              ),
              CommonCard(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                onTap: () {},
                radius: 4,
                borderClr: AppColors.darkBlue,
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                child: Row(
                  children: [
                    TextView(text: "MM/DD/YY", style: 12.txtRegularGreyHint),
                    const Spacer(),
                    const Icon(Icons.calendar_month_outlined,
                        color: AppColors.darkBlue)
                  ],
                ),
              ),
              TextView(
                margin: const EdgeInsets.only(
                    left: 16, top: 24, right: 16, bottom: 8),
                text: "39,99 € - 49,99 € inc. VAT",
                style: 13.txtBoldBlack,
              ),
              Row(
                children: [
                  Image.asset(AppImages.cart, height: 80),
                  Expanded(
                      child: CommonButton(
                    text: AppStrings.buy,
                    clickAction: () {
                      context.pushNavigator(SelectPaymentScreen());
                    },
                  ))
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        );
      },
    );
  }
}
