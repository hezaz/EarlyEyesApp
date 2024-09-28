import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/cupertino.dart';
import '../../../components/coreComponents/TextView.dart';
import '../../../components/styles/appColors.dart';
import '../../../components/styles/appImages.dart';
import '../pages/profile/calender_screen.dart';
import '../pages/profile/my_courses.dart';
import '../pages/profile/project_screen.dart';
import '../pages/profile/quiz_result_screen.dart';
import 'common_card.dart';

class CoursesView extends StatelessWidget {
  CoursesView({super.key,this.padding,this.onTap,this.image,this.title});
final EdgeInsets? padding;
VoidCallback? onTap;
String? image;
String? title;

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      padding: padding ??
      const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) => CommonCard(
        bkColor: AppColors.darkBlue,
        //onTap: onTap,
        onTap: () {
          index == 0
              ? context.pushNavigator(ProjectScreen())
              : index == 1
              ? context.pushNavigator(CalenderScreen())
              : index == 2
              ? context.pushNavigator(QuizResultScreen())
              : context.pushNavigator(MyCoursesScreen());
        },
        margin: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                  height: 50,
                  width: double.infinity,
                 // image ?? ""
                  index == 0
                      ? AppImages.projects
                      : index == 1
                      ? AppImages.calender
                      : index == 2
                      ? AppImages.results
                      : AppImages.myCourses

              ),
            ),
            TextView(
              margin: const EdgeInsets.only(left: 8),
             // text: title ?? '',
              text: index == 0
                  ? "Projects"
                  : index == 1
                  ? "Calender"
                  : index == 2
                  ? "Quiz"
                  : "My Courses",
              style: 14.txtMediumWhite,
            ),
          ],
        ),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 32,
        childAspectRatio: 2 / 2,
        crossAxisSpacing: 32,
        crossAxisCount: 2,
      ),
    );
  }
}
