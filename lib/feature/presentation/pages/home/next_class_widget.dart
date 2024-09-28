import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:flutter/cupertino.dart';

import '../../../../components/coreComponents/TextView.dart';
import '../../../../components/coreComponents/common_button.dart';
import '../../../../components/styles/appColors.dart';
import '../../../../components/styles/appImages.dart';
import '../../../../components/styles/app_strings.dart';
import '../../widgets/common_card.dart';

class NextClassWidget extends StatelessWidget {
  NextClassWidget({super.key, this.padding});

  EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonCard(
          margin: padding,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.only(right: 16),
                  height: 100,
                  child: Image.asset(AppImages.test1)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextView(text: "HTML/CSS", style: 12.txtBoldDarkBlue),
                    TextView(
                      text: "Class 24",
                      style: 10.txtRegularGreyHint,
                      margin: const EdgeInsets.symmetric(vertical: 2),
                    ),
                    TextView(
                        text: "Sunday 27th at 5pm", style: 10.txtMediumDBlue),
                    CommonButton(
                        textStyle: 15.txtMediumWhite,
                        elevation: 0,
                        backgroundColor: AppColors.greyHint.withOpacity(0.4),
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        height: 32,
                        text: AppStrings.joinNow,
                        clickAction: () {})
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
