import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/coreComponents/common_app_bar.dart';
import 'package:early_eyes/components/coreComponents/common_button.dart';
import 'package:early_eyes/components/styles/appColors.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/presentation/widgets/common_scaffold_widget.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      onBackTap: () {
        context.pop();
      },
      title: AppStrings.aboutUs,

      body: ListView(
        children: [
          Center(
              child: TextView(
            text: AppStrings.welText,
            style: 16.txtBoldDarkBlue,
          )),
          TextView(
              margin: const EdgeInsets.only(left: 16, right: 16, top: 24),
              text: AppStrings.aboutUsMsg,
              style: 14.txtRegularDBlue),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: 'contact@earlyeyesedu.com ',
                  style: 14.txtRegularPBlue.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryBlue)),
              TextSpan(text: AppStrings.aboutUsMsg1, style: 14.txtRegularDBlue),
              TextSpan(
                  text: '\n\n\nFor more information, visit our website ',
                  style: 14.txtRegularDBlue),
              TextSpan(
                  text: '\nhttps://earlyeyesedu.com',
                  style: 14.txtRegularPBlue.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryBlue)),
            ])),
          ),
          CommonButton(
              textStyle: 15.txtMediumWhite,
              margin:
              const EdgeInsets.symmetric(horizontal: 32, vertical: 70),
              text: AppStrings.needHelp,
              clickAction: () {})
        ],
      ),
    );
  }
}
