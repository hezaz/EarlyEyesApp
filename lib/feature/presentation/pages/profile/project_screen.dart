
import 'package:early_eyes/components/styles/appImages.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/presentation/widgets/common_scaffold_widget.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';

import '../../../../components/coreComponents/TextView.dart';
import '../../widgets/common_action_btn.dart';
import '../../widgets/common_card.dart';
import 'add_project_screen.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      btnLocation:FloatingActionButtonLocation.endDocked,
      title: AppStrings.project,
      onBackTap: (){
        context.pop();
      },
      floatingActionBtn: CommonActionBtn(


        onTap: (){
          context.pushNavigator(AddProjectScreen(), );
        },
      ),

      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            return CommonCard(
              margin: const EdgeInsets.only(top: 8),
              child: ListTile(
                horizontalTitleGap: 8,
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                leading: Image.asset(index == 0? AppImages.test3 :  AppImages.test1),
                title: TextView(text:index == 0 ?  'HTML':'Flutter',style: 14.txtBoldDarkBlue,),
                subtitle:  TextView(text: 'Completed Date: 02/15/24',style: 12.txtMediumGrey,),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height:18);
          },
          itemCount: 2),
    );
  }
}
