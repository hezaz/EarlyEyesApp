import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/coreComponents/common_button.dart';
import 'package:early_eyes/components/styles/appColors.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';


import 'package:flutter/material.dart';

class QuizTile extends StatelessWidget {
  const QuizTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
            margin: const EdgeInsets.only(left: 16, top: 40),
            text: 'What is the meaning of UI UX Design ?',
            style: 16.txtMediumDBlue),
        ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: AppColors.greyD4,
                    child: Text(
                        index == 0
                            ? "A"
                            : index == 1
                                ? "B"
                                : index == 2
                                    ? "C"
                                    : index == 3
                                        ? "D"
                                        : "E",
                        style: 14.txtMediumWhite),
                  ),
                  TextView(
                    margin: const EdgeInsets.only(left: 8),
                    text: 'User Interfoce and User Experience',
                    style: 14.txtRegularDBlue,
                  )
                ],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16.0);
            },
            itemCount: 5),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 22,
                backgroundColor: AppColors.greyD4,
                child: Icon(Icons.arrow_back_ios_new_rounded,
                    color: AppColors.white, size: 16),
              ),
              Expanded(
                  child: CommonButton(
                    height: 45,
                    margin: const EdgeInsets.symmetric(horizontal: 4,vertical: 16),
                      text: AppStrings.submitQuiz, clickAction: () {})),
              const CircleAvatar(
                  radius: 22,
                  backgroundColor: AppColors.greyD4,
                  child: Icon(Icons.arrow_forward_ios_outlined,
                      color: AppColors.white, size: 16)),
            ],
          ),
        )
      ],
    );
  }
}
