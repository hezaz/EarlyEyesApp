import 'package:early_eyes/components/coreComponents/TextView.dart';

import 'package:early_eyes/components/styles/appImages.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/presentation/widgets/common_scaffold_widget.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/styles/appColors.dart';
import '../../../controller/skills_test_controller.dart';
import 'quiz_tile.dart';

class StartQuizScreen extends StatelessWidget {
  const StartQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SkillsTestController(),
      builder: (SkillsTestController controller) {
        return CommonScaffold(
          onBackTap: (){
            context.pop();
          },

          body: DefaultTabController(
              length: 10,
              child: Column(
                children: [
                   Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16,bottom: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextView(text: 'Python',style: 20.txtSBoldDarkBlue),
                       Container(
                         padding: const EdgeInsets.symmetric(horizontal:8,vertical: 4),
                       decoration: BoxDecoration(
                         color: AppColors.darkBlue,
                         borderRadius: BorderRadius.circular(16)
                       ),
                         child: Row(
                           children: [
                         Image.asset(AppImages.clockWhite,height: 22),
                             TextView(
                                 margin: const EdgeInsets.only(left: 8),
                                 text: "16:35",style:14.txtRegularWhite)
                           ],
                         ),
                       )

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TabBar(
                      tabAlignment: TabAlignment.start,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      indicatorSize: TabBarIndicatorSize.label,
                      controller: controller.tabController,
                      unselectedLabelStyle: 18.txtMediumWhite,
                      labelStyle: 16.txtMediumWhite,
                      dividerColor: AppColors.white,
                      labelColor: AppColors.primaryBlue,
                      unselectedLabelColor: AppColors.white,
                      indicatorColor: AppColors.darkBlue,
                      isScrollable: true,

                      tabs: controller.tab,
                    ),
                  ),
                  Expanded(
                      child: TabBarView(
                    controller: controller.tabController,
                    children: const [
                      QuizTile(),
                      QuizTile(),
                      QuizTile(),
                      QuizTile(),
                      QuizTile(),
                      QuizTile(),
                      QuizTile(),
                      QuizTile(),
                      QuizTile(),
                      QuizTile()
                    ],
                  ))
                ],
              )),
        );
      },
    );
  }
}
