import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/coreComponents/common_app_bar.dart';
import 'package:early_eyes/components/coreComponents/common_button.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/presentation/widgets/common_scaffold_widget.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';
import '../../../../components/styles/appImages.dart';
import 'course_overview_screen.dart';

class MyCourseDetails extends StatelessWidget {
  const MyCourseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      onBackTap: () {
        context.pop();
      },
      title: AppStrings.myCourses,

      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Image.asset(AppImages.unity),
          ),
          TextView(
            margin: const EdgeInsets.only(left: 16, top: 16),
            text: 'Unity Game Development',
            style: 18.txtSBoldDarkBlue,
          ),
          TextView(
            margin: const EdgeInsets.only(left: 16, top: 16),
            text: AppStrings.overview.toUpperCase(),
            style: 12.txtBoldDarkBlue,
          ),
          TextView(
            margin: const EdgeInsets.only(left: 16, top: 16),
            text: AppStrings.overViewMsg,
            style: 12.txtRegularDBlue,
          ),
          TextView(
            margin: const EdgeInsets.only(left: 16, top: 16),
            text: AppStrings.objectives.toUpperCase(),
            style: 12.txtBoldDarkBlue,
          ),
          TextView(
            margin: const EdgeInsets.only(left: 16,top: 8),
            text: 'Here are some of the things you will learn:',
            style: 12.txtRegularDBlue,
          ),
          TextView(
            margin: const EdgeInsets.only(left: 16,top:4,bottom:32),
            text: AppStrings.objMsg,
            style: 12.txtRegularDBlue.copyWith(height: 1.7)
          ),
          CommonButton(
            elevation: 0,
              margin:const EdgeInsets.symmetric(horizontal: 32,vertical: 16),

              text:AppStrings.classOverview, clickAction: (){
            context.pushNavigator(MyCourseOverViewScreen());
          })
        ],
      ),
    );
  }
}
