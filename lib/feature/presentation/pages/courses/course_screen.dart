import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/coreComponents/common_input_field.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/controller/home_controller.dart';
import 'package:early_eyes/feature/presentation/pages/courses/student_course_detail_screen.dart';
import 'package:early_eyes/feature/presentation/pages/courses/tutor_course_detail_screen.dart';
import 'package:early_eyes/services/prefrences/prefrences.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/coreComponents/underline_text.dart';
import '../../../../components/styles/appColors.dart';
import '../../../../components/styles/appImages.dart';
import '../../widgets/common_scaffold_widget.dart';
import '../../widgets/courses_card.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (HomeController controller) {
        return CommonScaffold(
          onBackTap: () {
            context.pop();
          },
          title: AppStrings.courses,
          body: ListView(
            children: [
              CommonInputField(
                  trailing: InkWell(
                    onTap: () {},
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        height: 50,
                        width: 50,
                        child: Image.asset(AppImages.filter)),
                  ),
                  underLineBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: AppColors.darkBlue)),
                  leading: SizedBox(
                    height: 20,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(AppImages.search),
                    ),
                  ),
                  controller: controller.searchController,
                  hint: AppStrings.search),
              UnderLineTxt(txt: AppStrings.allCourses),
              // TextView(
              //   margin: const EdgeInsets.only(left: 16, top: 16),
              //   text: AppStrings.availableCourses,
              //   style: 12.txtBoldDarkBlue,
              // ),
              Obx(
                () => GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.courses.length,
                  itemBuilder: (context, index) => CoursesCard(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      onClick: () {
                        controller.getDetails(controller.courses[index].id);
                        Preferences.user?.roleId == 3
                            ? context.pushNavigator(TutorCourseDetailScreen())
                            : context
                                .pushNavigator(StudentCourseDetailScreen());
                      },
                      title: controller.courses[index].courseTitle.toString(),
                      subTitle:
                          controller.courses[index].courseCategory.toString(),
                      description:
                          '₹${controller.courses[index].price.toString()}',
                      image: controller.courses[index].courseThumbnails
                          .toString()),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 0,
                    childAspectRatio: 2 / 2.8,
                    crossAxisSpacing: 16,
                    crossAxisCount: 2,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
