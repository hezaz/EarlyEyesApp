import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/controller/home_controller.dart';
import 'package:early_eyes/feature/presentation/widgets/common_scaffold_widget.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/coreComponents/TextView.dart';

import '../../../../components/styles/appColors.dart';
import '../../../../components/styles/appImages.dart';
import '../../../../components/styles/app_strings.dart';
import '../../widgets/common_card.dart';
import 'my_course_details.dart';

class MyCoursesScreen extends StatelessWidget {
   MyCoursesScreen({super.key});
final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: AppStrings.myCourses,
      onBackTap: () {
        context.pop();
      },

      body:  GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 16,
            childAspectRatio: 2.2 /2.5,
            crossAxisSpacing: 16,
            crossAxisCount: 2,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),

          shrinkWrap: true,
          itemBuilder: (context, index) {
            return CommonCard(
              onTap: (){
                context.pushNavigator(MyCourseDetails());
              },
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 12),
              margin: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(controller
                      .myCoursesList[index].image
                      .toString(),height: 100,fit: BoxFit.fitWidth,width:context.getWidth),
                  TextView(
                    margin: const EdgeInsets.only(left: 8,top: 4),
                    text: controller.myCoursesList[index].title
                        .toString(),
                    style: 12.txtBoldDarkBlue,
                  ),
                  TextView(
                    margin: const EdgeInsets.only(left: 8, top: 2),
                    text: controller.myCoursesList[index].subtitle
                        .toString(),
                    style: 10.txtRegularGreyHint,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextView(
                        // margin: const EdgeInsets.only(left: 8,top: 4,right: 8),
                        text: 'Explore',
                        style: 9.txtMediumDBlue.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.darkBlue),
                      ),
                      Image.asset(AppImages.forward, height: 4)
                    ],
                  )
                ],
              ),
            );
          },

          itemCount: controller.myCoursesList.length),
    );
  }
}
