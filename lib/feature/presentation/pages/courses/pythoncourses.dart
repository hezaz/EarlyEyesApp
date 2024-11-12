import 'package:early_eyes/components/coreComponents/ImageView.dart';
import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/coreComponents/common_input_field.dart';
import 'package:early_eyes/components/styles/appImages.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/presentation/widgets/common_scaffold_widget.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';

class PythonCourses extends StatelessWidget {
  const PythonCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: AppStrings.course,
      onBackTap: () {
        context.pop();
      },
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Course Image and Title
              Row(
                children: [
                  ImageView(
                    url: AppImages.python,
                    height: 105,
                    width: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextView(
                      text: AppStrings.python,
                      style: 14.txtBoldDarkBlue,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              TextView(
                textAlign: TextAlign.start,
                text: AppStrings.upload,
                style: 12.txtRegularDBlue,
              ),
              CommonInputField(
                marginLeft: 1,
                marginRight: 1,
                hint: AppStrings.upload,
                trailing: Icon(Icons.attachment_rounded)
              ),
              SizedBox(height: 20),

              TextView(
                textAlign: TextAlign.start,
                text: AppStrings.classLink,
                style: 12.txtRegularDBlue,
              ),
              CommonInputField(
                marginLeft: 1,
                marginRight: 1,
                hint: AppStrings.insertClassLink,
                trailing: Icon(Icons.link),
              ),
              SizedBox(height: 20),

              // Class calendar section
              TextView(
                textAlign: TextAlign.start,
                text: AppStrings.classCalendar,
                style: 12.txtRegularDBlue,
              ),
              CommonInputField(
                marginLeft: 1,
                marginRight: 1,
                hint: AppStrings.selectDateTime,
                trailing: Icon(Icons.calendar_today_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
