import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/styles/appImages.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:flutter/cupertino.dart';

import '../styles/appColors.dart';

class CommonIconButton extends StatelessWidget {
  CommonIconButton({
    super.key,
    required this.onTap,
    this.image,
    this.msg,
    this.margin,
    this.borderRadius,
    this.bkColor,this.title,this.leading,this.height,
    this.padding
  });

  VoidCallback onTap;
  String? image;
  String? msg;
  EdgeInsets? margin;
  EdgeInsets? padding;
  double? borderRadius;
  Widget? title;
  Widget? leading;
  Color? bkColor;
  double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          height: height ?? 45,
          margin: margin ??
              const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          decoration: BoxDecoration(
              color: bkColor,
              border: Border.all(
                  color: bkColor ?? AppColors.darkBlue.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(borderRadius ?? 30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              title ??
                  Padding(
                    padding: padding ?? const EdgeInsets.all(12.0),
                    child: Image.asset(image ?? AppImages.google),
                  ),
              leading ??
                  TextView(
                    text: msg ?? AppStrings.googleLg,
                    style: 14.txtRegularDBlue,
                  )
            ],
          ),
        ));
  }
}
