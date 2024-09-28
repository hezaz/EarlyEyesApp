import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/controller/courses_controller.dart';
import 'package:early_eyes/feature/presentation/widgets/common_card.dart';
import 'package:early_eyes/feature/presentation/widgets/common_scaffold_widget.dart';
import 'package:early_eyes/feature/presentation/widgets/view_all_btn.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../../components/coreComponents/common_app_bar.dart';
import '../../../../components/styles/appColors.dart';
import '../../../../components/styles/appImages.dart';
import '../../../../components/styles/app_strings.dart';
import '../student/all_student_card.dart';
import '../student/view_all_student_screen.dart';

class MyCourseOverViewScreen extends StatefulWidget {
  const MyCourseOverViewScreen({super.key});

  @override
  State<MyCourseOverViewScreen> createState() => _MyCourseOverViewScreenState();
}

class _MyCourseOverViewScreenState extends State<MyCourseOverViewScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoursesController>(
      init: CoursesController(),
      builder: (controller) {
        return CommonScaffold(
          onBackTap: () {
            context.pop();
          },
          title: AppStrings.classOverview,
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            children: [
              Image.asset(AppImages.unity),
              ViewAllBtn(
                  padding: const EdgeInsets.only(top: 32, bottom: 16),
                  text: AppStrings.announcements,
                  style: 15.txtBoldDarkBlue),
              ListView.separated(
                  padding: const EdgeInsets.only(bottom: 16),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Obx(
                      () => CommonCard(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 16),
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                TextView(
                                    text: 'Classes of python programming',
                                    style: 12.txtBoldDarkBlue),
                                const Spacer(),
                                TextView(
                                    text: '1 hour ago',
                                    style: 10.txtRegularGreyHint),
                              ],
                            ),
                            TextView(
                                margin: const EdgeInsets.only(top: 12),
                                text: controller.descText,
                                maxlines: controller.selectCourse.value == index
                                    ? 8
                                    : 2,
                                textAlign: TextAlign.start,
                                style: 12.txtRegularDBlue),
                            Align(
                              alignment: Alignment.centerRight,
                              child: controller.selectCourse.value == index
                                  ? TextView(
                                      margin: const EdgeInsets.only(top: 8),
                                      onTap: () {
                                        controller.selectCourse.value = (-1);
                                      },
                                      text: " Read Less",
                                      style: 12.txtRegularPBlue)
                                  : TextView(
                                      margin: const EdgeInsets.only(top: 8),
                                      onTap: () {
                                        controller.setCourse(index);
                                      },
                                      text: "Read More",
                                      style: 12.txtRegularPBlue),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 8);
                  },
                  itemCount: 2),
              ViewAllBtn(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 2),
                  text: AppStrings.academicResources,
                  style: 15.txtBoldDarkBlue),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Obx(
                      () => CommonCard(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 16),
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(children: [
                          Row(
                            children: [
                              TextView(
                                  text: 'Classes of python programming',
                                  style: 12.txtBoldDarkBlue),
                              const Spacer(),
                              TextView(
                                  text: '1 hour ago',
                                  style: 10.txtRegularGreyHint),
                            ],
                          ),
                          TextView(
                              margin: const EdgeInsets.only(top: 12),
                              text: controller.descText,
                              maxlines: controller.selectCourse.value == index
                                  ? 8
                                  : 2,
                              textAlign: TextAlign.start,
                              style: 12.txtRegularDBlue),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextView(
                                    onTap: () {},
                                    text: "Check Attachment",
                                    style: 12.txtRegularPBlue),
                                controller.selectCourse.value == index
                                    ? TextView(
                                        onTap: () {
                                          controller.selectCourse.value = (-1);
                                        },
                                        text: " Read Less",
                                        style: 12.txtRegularPBlue)
                                    : TextView(
                                        onTap: () {
                                          controller.setCourse(index);
                                        },
                                        text: "Read More",
                                        style: 12.txtRegularPBlue),
                              ],
                            ),
                          )
                        ]),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 16);
                  },
                  itemCount: 1),
              ViewAllBtn(
                onClick: (){
                  context.pushNavigator(ViewAllStudentScreen());
                },
                  padding:
                      const EdgeInsets.only(top:24),
                  text: AppStrings.otherStudent,
                  style: 15.txtBoldDarkBlue),
              AllStudentCard(),
            ],
          ),
        );
      },
    );
  }
}
