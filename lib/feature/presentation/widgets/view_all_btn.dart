import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/styles/appImages.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewAllBtn extends StatelessWidget {
  ViewAllBtn({super.key, this.text, this.viewAllTxt, this.onClick,this.padding,this.isVisible,this.style});

  String? text;
  String? viewAllTxt;
  VoidCallback? onClick;
  EdgeInsets? padding;
  bool? isVisible;
  TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  padding ?? const EdgeInsets.all(16.0),
      child: Row(
        children: [
          TextView(
            text: text ?? "",
            style: style ?? 12.txtBoldDarkBlue,
          ),
          const Spacer(),
          Visibility(
            visible: isVisible ?? true ,
            child: Row(
              children: [
                TextView(
                    onTap: onClick,
                    text: viewAllTxt ?? AppStrings.viewAll,
                    style: 12.txtMediumPBlue),
                Image.asset(
                  AppImages.forward,
                  height: 10,
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
