import 'package:early_eyes/components/coreComponents/ImageView.dart';
import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/coreComponents/underline_text.dart';
import 'package:early_eyes/components/styles/appImages.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/controller/home_controller.dart';
import 'package:early_eyes/feature/presentation/widgets/common_scaffold_widget.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class StudentCourseDetailScreen extends StatefulWidget {
  StudentCourseDetailScreen({super.key});

  @override
  State<StudentCourseDetailScreen> createState() =>
      _StudentCourseDetailScreenState();
}

class _StudentCourseDetailScreenState extends State<StudentCourseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (controller) {
        return CommonScaffold(
          onBackTap: () {
            context.pop();
          },
          title: AppStrings.courses,
          actions: [
            GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Image.asset(
                    AppImages.share,
                    height: 16,
                  ),
                ))
          ],
          body: ListView(
            children: [
              UnderLineTxt(txt: AppStrings.courseDetails),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 24, bottom: 24),
                child: Row(
                  children: [
                    ImageView(
                        radius: 18,
                        size: 120,
                        fit: BoxFit.cover,
                        imageType: ImageType.network,
                        url: controller.thumbnail.value.toString()),
                    Expanded(
                        child: TextView(
                      margin: const EdgeInsets.only(left: 16),
                      text:
                          "${controller.courseTitle.value.toUpperCase()} PROGRAMMING WORKSHOP",
                      style: 14.txtBoldDarkBlue,
                    )),
                  ],
                ),
              ),
              TextView(
                  margin: const EdgeInsets.only(left: 16),
                  text: AppStrings.courseDetails,
                  style: 12.txtBoldBlack),
              TextView(
                  margin: const EdgeInsets.only(left: 16, top: 4),
                  text: '${controller.courseTitle.value} programming workshop',
                  style: 13.txtRegularDBlue),
              TextView(
                  margin: const EdgeInsets.only(left: 16, top: 16),
                  text: AppStrings.description,
                  style: 12.txtBoldBlack),
              TextView(
                  margin: const EdgeInsets.only(left: 16, top: 4),
                  text: controller.courseDescription.value,
                  style: 13.txtRegularDBlue),
              TextView(
                  margin: const EdgeInsets.only(left: 16, top: 16),
                  text: AppStrings.objectives,
                  style: 12.txtBoldBlack),
              TextView(
                  margin: const EdgeInsets.only(left: 16, top: 4, bottom: 24),
                  text: AppStrings.objectiveMsg,
                  style: 13.txtRegularDBlue),
            ],
          ),
        );
      },
    );
  }
}
