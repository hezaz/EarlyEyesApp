import 'package:early_eyes/components/coreComponents/common_app_bar.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/controller/settings_controller.dart';
import 'package:early_eyes/feature/presentation/widgets/common_scaffold_widget.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../components/coreComponents/TextView.dart';
import '../../../../controller/profile_controller.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProfileController(),
      builder: (ProfileController controller) {
        return CommonScaffold(
         
          onBackTap: () {
            context.pop();
          },
          title: AppStrings.privacyPolicy,

          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              TextView(
                text: AppStrings.policy1,
                textAlign: TextAlign.start,
                style: 16.txtSBoldDarkBlue,
                margin: const EdgeInsets.only(bottom: 4),
              ),
              TextView(
                  text: AppStrings.policy5,
                  textAlign: TextAlign.start,
                  style: 12.txtRegularDBlue),
              TextView(
                text: AppStrings.policy2,
                textAlign: TextAlign.start,
                style: 16.txtSBoldDarkBlue,
                margin: const EdgeInsets.only(bottom: 2, top: 16),
              ),
              TextView(
                  text: "We collect the following information:",
                  textAlign: TextAlign.start,
                  style: 14.txtRegularDBlue),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        const CircleAvatar(
                            radius: 2, backgroundColor: Colors.black),
                        TextView(
                            margin: const EdgeInsets.only(left: 4),
                            text:
                                controller.collectInformation[index].toString(),
                            textAlign: TextAlign.start,
                            style: 12.txtRegularDBlue),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 8.0);
                  },
                  itemCount: controller.collectInformation.length),


              TextView(
                text: AppStrings.policy3,
                textAlign: TextAlign.start,
                style: 16.txtSBoldDarkBlue,
                margin: const EdgeInsets.only(bottom: 2, top: 16),
              ),
              TextView( text: "We use your information to:",
                  textAlign: TextAlign.start,style: 14.txtRegularDBlue),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        const CircleAvatar(
                            radius: 2, backgroundColor: Colors.black),
                        Expanded(
                          child: TextView(
                              margin: const EdgeInsets.only(left: 4),
                              text:
                              controller.useInformation[index].toString(),
                              textAlign: TextAlign.start,
                              style: 12.txtRegularDBlue),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 8.0);
                  },
                  itemCount: controller.useInformation.length),
              TextView(
                text: AppStrings.policy4,
                textAlign: TextAlign.start,
                style: 16.txtSBoldDarkBlue,
                margin: const EdgeInsets.only(bottom: 2,top: 16),
              ),
              TextView( text: "We do not share your personal information with third parties except:",
                  textAlign: TextAlign.start,style: 14.txtRegularDBlue),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        const CircleAvatar(
                            radius: 2, backgroundColor: Colors.black),
                        Expanded(
                          child: TextView(
                              margin: const EdgeInsets.only(left: 4),
                              text:
                              controller.sharingInformation[index].toString(),
                              textAlign: TextAlign.start,
                              style: 12.txtRegularDBlue),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 8.0);
                  },
                  itemCount: controller.sharingInformation.length),
              const SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }
}
