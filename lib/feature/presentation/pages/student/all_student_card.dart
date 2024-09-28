import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:flutter/material.dart';
import '../../../../components/coreComponents/TextView.dart';
import '../../../../components/styles/appColors.dart';
import '../../../../components/styles/appImages.dart';

class AllStudentCard extends StatelessWidget {
  const AllStudentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(

        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(top: 16),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor:
                AppColors.primaryBlue.withOpacity(0.2),
                child: Image.asset(AppImages.profile1),
              ),
              TextView(
                  margin: const EdgeInsets.only(left: 12),
                  text: 'Sathyana Weerasinghe',style: 14.txtRegularBlack),
              const Spacer(),
              Image.asset(AppImages.message,height:30),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 18);
        },
        itemCount: 3);
  }
}
