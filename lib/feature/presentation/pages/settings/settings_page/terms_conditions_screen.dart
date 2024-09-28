import 'package:early_eyes/components/coreComponents/TextView.dart';

import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';

import 'package:early_eyes/feature/presentation/widgets/common_scaffold_widget.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/profile_controller.dart';

class TermsConditionScreen extends StatelessWidget {
  const TermsConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProfileController(),
      builder: (ProfileController controller) {
        return   CommonScaffold(

          onBackTap: () {
            context.pop();
          },
          title: AppStrings.termsConditions,

          body: ListView(
            children: [
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                shrinkWrap: true,
                  itemBuilder: (context,index){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(

                          text: controller.termsAndConditions[index].title.toString(),
                          textAlign: TextAlign.start,style: 16.txtSBoldDarkBlue,
                      margin: const EdgeInsets.only(bottom: 8),
                      ),
                      TextView(text: controller.termsAndConditions[index].subtitle.toString(),
                          textAlign: TextAlign.start,style: 13.txtRegularDBlue),

                    ],
                  );
                  },
                  separatorBuilder: (context,index){
                return SizedBox(height: 16);
                  }, itemCount:controller.termsAndConditions.length)

            ],
          ),
        );
    },

    );
  }
}
