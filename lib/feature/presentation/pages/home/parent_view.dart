import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/presentation/pages/courses/student_course_detail_screen.dart';
import 'package:early_eyes/feature/presentation/widgets/courses_card.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../components/coreComponents/common_button.dart';
import '../../../../components/styles/app_strings.dart';
import '../../../../utils/enum.dart';
import '../../../controller/home_controller.dart';
import '../../widgets/view_all_btn.dart';
import '../courses/course_screen.dart';
import '../help/need_help_screen.dart';
import '../parent/add_child/add_child_screen.dart';
import '../parent/add_child/child_details.dart';
import 'events_view.dart';

class ParentView extends StatelessWidget {
  ParentView({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            ViewAllBtn(
              onClick: () {
                context.pushNavigator(CourseScreen());
              },
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              text: AppStrings.courses,
            ),
            SizedBox(
              height: 220,
              child: Obx(
                () => ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CoursesCard(
                        onClick: () {
                          print(
                              '${controller.courses[index].id}controller.courses[index].id');
                          controller.getDetails(controller.courses[index].id);
                          context.pushNavigator(StudentCourseDetailScreen());
                        },
                        image: controller.courses[index].courseThumbnails
                            .toString(),
                        title: controller.courses[index].courseTitle.toString(),
                        subTitle:
                            controller.courses[index].courseCategory.toString(),
                        description: controller.courses[index].price.toString(),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 22);
                    },
                    itemCount: controller.courses.length),
              ),
            ),
            ViewAllBtn(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              text: AppStrings.events,
            ),
            EventsView(),
            ViewAllBtn(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                text: AppStrings.child,
                viewAllTxt: AppStrings.addChild,
                onClick: () {
                  Get.to(AddChildScreen(),
                      arguments: {'type': AuthType.register});
                }),
            ChildDetails(),
            CommonButton(
                textStyle: 15.txtMediumWhite,
                margin:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 70),
                text: AppStrings.needHelp,
                clickAction: () {
                  context.pushNavigator(NeedHelpScreen());
                })
          ],
        )
      ],
    );
  }
}
