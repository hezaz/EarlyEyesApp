import 'package:early_eyes/components/styles/textStyles.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/coreComponents/TextView.dart';
import '../../../../components/styles/app_strings.dart';
import '../../../controller/home_controller.dart';

import '../../widgets/common_card.dart';
import '../../widgets/view_all_btn.dart';

class CommonCoursesWidget extends StatelessWidget {
  CommonCoursesWidget(
      {super.key,
      this.image,
      this.title,
      this.onViewTap,
      this.description,
      this.subtitle,
      this.msg});

  final controller = Get.put(HomeController());
  String? image;
  String? title;
  String? subtitle;
  Widget? description;
  VoidCallback? onViewTap;
  String? msg;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ViewAllBtn(
          onClick: onViewTap,
          // onClick: () {
          //   context.pushNavigator(CourseScreen());
          // },
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
         text: msg ?? "",
         // text: AppStrings.courses,
        ),
        CommonCard(
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 140,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(image ?? ""
                        //controller.coursesList[index].image.toString()
                        ),
                  )),
              TextView(
                margin: const EdgeInsets.only(left: 8),
                text: title ?? '',
                // text: controller.coursesList[index].title.toString(),
                style: 12.txtBoldDarkBlue,
              ),
              TextView(
                margin: const EdgeInsets.only(left: 8, top: 4),
                text: subtitle ?? '',
                //text: controller.coursesList[index].subtitle.toString(),
                style: 10.txtRegularGreyHint,
              ),
              description ?? SizedBox()
              // TextView(
              //   margin: const EdgeInsets.only(
              //       left: 8, top: 4, right: 8),
              //   text: controller.coursesList[index].description
              //       .toString(),
              //   style: 9.txtMediumDBlue,
              // )
            ],
          ),
        ),
        // SizedBox(
        //   height: 220,
        //   child: ListView.separated(
        //       padding: const EdgeInsets.symmetric(horizontal: 16),
        //       scrollDirection: Axis.horizontal,
        //       shrinkWrap: true,
        //       itemBuilder: (context, index) {
        //         return CommonCard(
        //           margin: const EdgeInsets.symmetric(vertical: 16),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               SizedBox(
        //                   width: 140,
        //                   child: Padding(
        //                     padding: const EdgeInsets.all(8.0),
        //                     child: Image.asset(image ?? ""
        //                         //controller.coursesList[index].image.toString()
        //                         ),
        //                   )),
        //               TextView(
        //                 margin: const EdgeInsets.only(left: 8),
        //                 text: title ?? '',
        //                 // text: controller.coursesList[index].title.toString(),
        //                 style: 12.txtBoldDarkBlue,
        //               ),
        //               TextView(
        //                 margin: const EdgeInsets.only(left: 8, top: 4),
        //                 text: subtitle ?? '',
        //                 //text: controller.coursesList[index].subtitle.toString(),
        //                 style: 10.txtRegularGreyHint,
        //               ),
        //               description ??
        //           SizedBox()
        //                   // TextView(
        //                   //   margin: const EdgeInsets.only(
        //                   //       left: 8, top: 4, right: 8),
        //                   //   text: controller.coursesList[index].description
        //                   //       .toString(),
        //                   //   style: 9.txtMediumDBlue,
        //                   // )
        //             ],
        //           ),
        //         );
        //       },
        //       separatorBuilder: (context, index) {
        //         return const SizedBox(width: 22);
        //       },
        //       itemCount: itemCount),
        // ),
      ],
    );
  }
}
