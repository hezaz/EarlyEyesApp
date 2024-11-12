import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/coreComponents/common_button.dart';
import 'package:early_eyes/components/coreComponents/common_input_field.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/presentation/widgets/common_scaffold_widget.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';

class Contactus extends StatelessWidget {
  const Contactus({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
        onBackTap: () {
      context.pop();
    },
    title: AppStrings.contactus,
    body: ListView(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    children: [
      TextView(
          margin: const EdgeInsets.only(left: 16, top: 16),
          text: AppStrings.fullName,
          style: 12.txtRegularDBlue),
      CommonInputField(
          hint: AppStrings.enterFullName,
      hintStyle: 10.txtRegularGreyHint,
      ),

      TextView(
          margin: const EdgeInsets.only(left: 16, top: 16),
          text: AppStrings.age,
          style: 12.txtRegularDBlue),
      CommonInputField(
        hint: AppStrings.enterage,
        hintStyle: 10.txtRegularGreyHint,
      ),


      TextView(
          margin: const EdgeInsets.only(left: 16, top: 16),
          text: AppStrings.email,
          style: 12.txtRegularDBlue),
      CommonInputField(
        hint: AppStrings.enterEmail,
        hintStyle: 10.txtRegularGreyHint,
      ),


      TextView(
          margin: const EdgeInsets.only(left: 16, top: 16),
          text: AppStrings.school,
          style: 12.txtRegularDBlue),
      CommonInputField(
        hint: AppStrings.enterschool,
        hintStyle: 10.txtRegularGreyHint,
      ),


      TextView(
          margin: const EdgeInsets.only(left: 16, top: 16),
          text: AppStrings.preferredava,
          style: 12.txtRegularDBlue),
      CommonInputField(
        hint: AppStrings.selectdays,
        hintStyle: 10.txtRegularGreyHint,
      ),



      TextView(
          margin: const EdgeInsets.only(left: 16, top: 16),
          text: AppStrings.time,
          style: 12.txtRegularDBlue),
      CommonInputField(
        hint: AppStrings.entertime,
        hintStyle: 10.txtRegularGreyHint,
      ),


      TextView(
          margin: const EdgeInsets.only(left: 16, top: 16),
          text: AppStrings.resume,
          style: 12.txtRegularDBlue),

      TextView(
          margin: const EdgeInsets.only(left: 16, top: 5),
          text: AppStrings.attachcv,
          style: 8.txtRegularGreyHint),
      
      CommonButton(text: "Choose a file",

          clickAction: (){}
      )

    ]
    )
    );
  }
}
