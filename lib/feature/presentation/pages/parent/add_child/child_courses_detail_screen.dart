import 'package:early_eyes/components/styles/appColors.dart';
import 'package:early_eyes/components/styles/appImages.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/presentation/pages/profile/calender_screen.dart';
import 'package:early_eyes/feature/presentation/widgets/common_card.dart';
import 'package:early_eyes/feature/presentation/widgets/common_scaffold_widget.dart';
import 'package:early_eyes/feature/presentation/widgets/view_all_btn.dart';
import 'package:early_eyes/services/network/ApiUrls.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../components/coreComponents/ImageView.dart';
import '../../../../../components/coreComponents/TextView.dart';
import '../../../../controller/child_controller.dart';
import '../../../widgets/courses_card.dart';


import '../../profile/project_screen.dart';
import '../classes/classes_screen.dart';
import '../progress/progress_screen.dart';

class ChildCoursesDetail extends StatelessWidget {
  const ChildCoursesDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChildController>(
      builder: (controller) {
        return CommonScaffold(
          title: AppStrings.courseDetails,
          actions: [
            IconButton(
              onPressed: () {
                context.pushNavigator(CalenderScreen());
              },
              icon: Image.asset(AppImages.calenderIc),
            ),
          ],
          onBackTap: () {
            context.pop();
          },
          body: ListView(
            children: [
              Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: ImageView(
                      hasBorder: true,
                      fit: BoxFit.cover,
                      radiusWidth: 2.2,
                      size: 100,
                      radius: 100,
                      borderRadius: 100,
                      imageType: ImageType.network,
                      url: '${ApiUrls.baseUrlImage}${controller.childImage}'),
                ),
              ),
              Center(
                child: TextView(
                    margin: const EdgeInsets.only(top: 16, bottom: 32),
                    text: controller.childName.toString(),
                    style: 15.txtBoldPBlue),
              ),
              Row(
                children: [
                  TextView(
                      margin: const EdgeInsets.only(left: 16),
                      text: AppStrings.nextClasses,
                      style: 16.txtBoldDarkBlue),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset(AppImages.classIc, height: 20)),
                ],
              ),
              CoursesCard(
                  margin: EdgeInsets.only(
                      right: context.width / 2, top: 16, left: 16, bottom: 16),
                  title: "HTML/CSS",
                  subTitle: "Programming",
                  description: "Sunday 27th on 5pm",
                  image: AppImages.test),
              ViewAllBtn(
                text: AppStrings.discoverNewCourse,
              ),
              SizedBox(
                height: 230,
                child: ListView.separated(

                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CoursesCard(
                          title: "HTML/CSS",
                          subTitle: "Programming",
                          description: "₹3,632.00-₹4,540.00 inc. VAT",
                          image: index == 0 ? AppImages.test1 :  AppImages.test2);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 22);
                    },
                    itemCount: 4),
              ),
              Divider(

                indent: 16,endIndent: 16,
                color: AppColors.blue34.withOpacity(0.4)),
              GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical:32),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) => CommonCard(
                  bkColor: AppColors.darkBlue,
                  //onTap: onTap,
                  onTap: () {
                    index == 0
                        ? context.pushNavigator(ClassesScreen())
                        : index == 1
                        ? context.pushNavigator(ProjectScreen())
                        : index == 2
                        ? context.pushNavigator(CalenderScreen())
                        : context.pushNavigator(ProgressScreen());
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
                            index == 0
                                ? AppImages.myCourses
                                : index == 1
                                ? AppImages.projects
                                : index == 2
                                ? AppImages.calender
                                : AppImages.quizIc

                        ),
                      ),
                      TextView(
                        margin: const EdgeInsets.only(left: 8),
                        // text: title ?? '',
                        text: index == 0
                            ? "Classes"
                            : index == 1
                            ? "Projects"
                            : index == 2
                            ? "Calender"
                            : "Quiz Result",
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
              ),

            ],
          ),
        );
      },
    );
  }
}
