import 'package:carousel_slider/carousel_slider.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../../components/coreComponents/TextView.dart';
import '../../../../components/coreComponents/common_button.dart';
import '../../../../components/styles/appImages.dart';
import '../../../../components/styles/app_strings.dart';
import '../../../controller/home_controller.dart';
import '../../widgets/common_card.dart';
import '../../widgets/courses_card.dart';
import '../../widgets/page_indicator.dart';
import '../../widgets/view_all_btn.dart';
import '../courses/course_screen.dart';
import '../courses/student_course_detail_screen.dart';
import '../help/need_help_screen.dart';
import '../skill_test/skills_test_screen.dart';
import 'events_view.dart';

class StudentView extends StatelessWidget {
  StudentView({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonCard(
            height: 170,
            width: context.getWidth,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Obx(() =>
            CarouselSlider(
                options: CarouselOptions(

                  autoPlay: true,
                 viewportFraction: 1,
                  onPageChanged: (value, reason) {
                    controller.currentImageIndex.value = value;
                  },
                ),
                items: controller.banners
                    .map((item) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Stack(
                              children: [
                                Image.network(
                                  item.image.toString(),
                                  fit: BoxFit.cover,
                                  width: context.getWidth,
                                  height: 170,
                                ),
                                Positioned(
                                    bottom: 8,
                                    right: 5,
                                    child: TextView(
                                        text: AppStrings.waitingCourses,
                                        style: 12.txtBoldWhite,
                                        textAlign: TextAlign.start))
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              ),
            )),
        Container(
          margin: const EdgeInsets.only(top: 16),
          height: 3.0,
          child: Center(
            child: Obx(
              () => PageIndicator(
                  width: 16,
                  borderRadius: 0,
                  selectedIndex: controller.currentImageIndex.value,
                  length: controller.banners.length),
            ),
          ),
        ),
        // TextView(
        //     margin: const EdgeInsets.only(left: 16, top: 16),
        //     text: AppStrings.nextClass,
        //     style: 14.txtBoldDarkBlue),
        // NextClassWidget(),
        ViewAllBtn(
          onClick: () {
            context.pushNavigator(CourseScreen());
          },
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 8),
          text: AppStrings.courses,
        ),
        SizedBox(
          height: 220,
          width: context.getWidth,
          child: GetX<HomeController>(
            builder: (controller) {
              return ListView.separated(
//physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Obx(
                      () => CoursesCard(
                        onClick: () {
                          controller.getDetails(controller.courses[index].id);
                          print(
                              '${controller.courses[index].id}controller.courses[index].id');
                          context.pushNavigator(StudentCourseDetailScreen());
                        },
                        image: '${controller.courses[index].courseThumbnails}'
                            .toString(),
                        title:
                            controller.courses[index].courseCategory.toString(),
                        subTitle:
                            controller.courses[index].courseTitle.toString(),
                        description:
                            '₹${controller.courses[index].price.toString()}',
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 22);
                  },
                  itemCount: controller.courses.length);
            },
          ),
        ),
        // ViewAllBtn(
        //   padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        //   text: AppStrings.myCourses,
        // ),
        // SizedBox(
        //   width: context.getWidth,
        //   height: 240,
        //   child: ListView.separated(
        //     padding: const EdgeInsets.symmetric(horizontal: 16),
        //     scrollDirection: Axis.horizontal,
        //     shrinkWrap: true,
        //     itemBuilder: (context, index) {
        //       return CommonCard(
        //         margin: const EdgeInsets.symmetric(vertical: 16),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             SizedBox(
        //                 width: 160,
        //                 child: Padding(
        //                   padding: const EdgeInsets.all(8.0),
        //                   child: Image.asset(
        //                       controller.myCoursesList[index].image.toString()),
        //                 )),
        //             TextView(
        //               margin: const EdgeInsets.only(left: 8),
        //               text: controller.myCoursesList[index].title.toString(),
        //               style: 12.txtBoldDarkBlue,
        //             ),
        //             TextView(
        //               margin: const EdgeInsets.only(left: 8, top: 4),
        //               text: controller.myCoursesList[index].subtitle.toString(),
        //               style: 10.txtRegularGreyHint,
        //             ),
        //             Padding(
        //               padding: const EdgeInsets.only(left: 8.0, top: 2),
        //               child: Row(
        //                 children: [
        //                   TextView(
        //                     text: 'Explore',
        //                     style: 9.txtMediumPBlue.copyWith(
        //                         decoration: TextDecoration.underline,
        //                         decorationColor: AppColors.primaryBlue),
        //                   ),
        //                   Image.asset(AppImages.forward, height: 4)
        //                 ],
        //               ),
        //             )
        //           ],
        //         ),
        //       );
        //     },
        //     separatorBuilder: (context, index) {
        //       return const SizedBox(width: 22);
        //     },
        //     itemCount: 1,
        //     //itemCount: controller.myCoursesList.length
        //   ),
        // ),
        ViewAllBtn(
          isVisible: false,
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          text: AppStrings.quizzes,
        ),
        CommonCard(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: 150,
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(AppImages.quiz),
                  )),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextView(
                      margin: const EdgeInsets.only(right: 8),
                      text: AppStrings.quizMsg,
                      style: 9.txtMediumBlack,
                      textAlign: TextAlign.center),
                  CommonButton(
                      margin: const EdgeInsets.only(top: 8, left: 8, right: 16),
                      height: 38,
                      textStyle: 12.txtMediumWhite,
                      text: AppStrings.skillTest,
                      clickAction: () {
                        context.pushNavigator(SkillTestScreen());
                      })
                ],
              ))
            ],
          ),
        ),
        ViewAllBtn(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          text: AppStrings.events,
        ),
        EventsView(),
        CommonButton(
            textStyle: 15.txtMediumWhite,
            margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 70),
            text: AppStrings.needHelp,
            clickAction: () {
              context.pushNavigator(NeedHelpScreen());
            })
      ],
    );
  }
}
