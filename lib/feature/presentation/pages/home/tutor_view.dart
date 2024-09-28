import 'package:carousel_slider/carousel_slider.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/presentation/pages/courses/tutor_course_detail_screen.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../components/coreComponents/ImageView.dart';
import '../../../../components/coreComponents/TextView.dart';
import '../../../../components/coreComponents/common_button.dart';
import '../../../../components/styles/appImages.dart';
import '../../../../components/styles/app_strings.dart';
import '../../../controller/home_controller.dart';
import '../../widgets/common_card.dart';
import '../../widgets/courses_card.dart';
import '../../widgets/view_all_btn.dart';
import '../courses/course_screen.dart';
import '../help/need_help_screen.dart';
import '../skill_test/skills_test_screen.dart';
import 'events_view.dart';


class TutorView extends StatelessWidget {
   TutorView({super.key});

  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        // ViewAllBtn(
        //   onClick: () {
        //     context.pushNavigator(CourseScreen());
        //   },
        //   padding: const EdgeInsets.only(
        //       left: 16, right: 16, top: 16),
        //   text: AppStrings.nextClass,
        // ),
        // NextClassWidget(),
        // NextClassWidget(
        //     padding:const EdgeInsets.symmetric(horizontal: 16)
        // ),
        ViewAllBtn(
          onClick: () {
            context.pushNavigator(CourseScreen());
          },
          padding: const EdgeInsets.only(
              left: 16, right: 16, top: 16),
          text: AppStrings.myClasses,
        ),
        SizedBox(
          width: context.getWidth,
          height: 220,
          child: Obx(() =>
            ListView.separated(
                padding:
                const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CoursesCard(
                    onClick: (){
                      controller.getDetails(controller
                          .courses[index].id);
                      context.pushNavigator(TutorCourseDetailScreen());
                    },
                    image: controller
                        .courses[index].courseThumbnails
                        .toString(),
                    title:controller
                        .courses[index].courseCategory
                        .toString(),
                    subTitle:'₹${ controller
                          .courses[index].price
                          .toString()}',


                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 22);
                },
                itemCount: controller.courses.length),
          ),
        ),

        ViewAllBtn(
          isVisible: false,
          padding: const EdgeInsets.only(
              left: 16, right: 16, top: 16),
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
                          margin: const EdgeInsets.only(
                              top: 8, left: 8, right: 16),
                          height: 38,
                          textStyle: 12.txtMediumWhite,
                          text: AppStrings.skillTest,
                          clickAction: () {
                            context
                                .pushNavigator(SkillTestScreen());
                          })
                    ],
                  ))
            ],
          ),
        ),
        ViewAllBtn(
          padding: const EdgeInsets.only(
              left: 16, right: 16, top: 16),
          text: AppStrings.events,
        ),
        EventsView(),
        CommonButton(
            textStyle: 15.txtMediumWhite,
            margin: const EdgeInsets.symmetric(
                horizontal: 32, vertical: 70),
            text: AppStrings.needHelp,
            clickAction: () {
              context.pushNavigator(NeedHelpScreen());
            })
      ],
    );
  }
}
