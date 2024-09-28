import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/coreComponents/common_button.dart';
import 'package:early_eyes/components/coreComponents/icon_button.dart';
import 'package:early_eyes/components/styles/appColors.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/presentation/widgets/common_scaffold_widget.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../components/coreComponents/ImageView.dart';
import '../../../../../components/styles/appImages.dart';
import '../../../widgets/common_card.dart';
import 'reschedule_screen.dart';

class ClassesScreen extends StatelessWidget {
  const ClassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: AppStrings.classes,
      onBackTap: () {
        context.pop();
      },
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          itemBuilder: (context, index) {
            return CommonCard(
              margin: EdgeInsets.zero,
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ImageView(url: AppImages.test3),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextView(text: 'ARDUINO', style: 14.txtBoldDarkBlue),
                      TextView(text: 'Class 24', style: 12.txtRegularGreyHint),
                      TextView(
                          text: 'Thursday 27th at 5pm',
                          style: 12.txtRegularDBlue),
                      CommonIconButton(
                          height: 30,
                          bkColor: AppColors.primaryBlue,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          title: Image.asset(AppImages.editIc, height: 20),
                          leading: TextView(
                            margin: const EdgeInsets.only(left: 8),
                            text: AppStrings.reschedule,
                            style: 12.txtBoldWhite,
                          ),
                          onTap: () {
                            context.pushNavigator(RescheduleScreen());
                          })
                    ],
                  ))
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 16);
          },
          itemCount: 3),
    );
  }
}
