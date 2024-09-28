import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:flutter/material.dart';

import '../styles/appColors.dart';
import 'TapWidget.dart';
import 'TextView.dart';

class AppChip extends StatelessWidget { final String? value;
final bool state;
final Function()? onTap;
const AppChip({super.key, required this.value, this.state = false, this.onTap});
@override
Widget build(BuildContext context) {
  return Stack( children: [
    Container(
      padding: EdgeInsets.all(
          // AppFonts.s7
              7
      ), decoration: BoxDecoration(
      color: state ? AppColors.primaryBlue : Colors.transparent,
        border: Border.all(
            // color: state ? AppColors.primaryGreen : AppColors.greyLightBorder
            color: state ? AppColors.primaryBlue : AppColors.greyR
        ),
        borderRadius: BorderRadius.circular(
            // AppFonts.s20
            20
        ) ),
      child: TextView(text: value ?? '',
        style:
        state? 14.txtRegularWhite :  14.txtRegularBlackText
        // TextStyles.regular14GreySemiDarkGreyText,
      ), ),
    Positioned.fill(child: TapWidget(onTap: onTap,)) ],
  ); }
}
