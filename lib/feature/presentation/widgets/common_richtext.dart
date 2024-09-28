import 'package:early_eyes/components/styles/textStyles.dart';

import 'package:flutter/material.dart';

import '../../../components/coreComponents/TextView.dart';

class CommonRichText extends StatelessWidget {
  CommonRichText({super.key, this.title, this.subtitle});

  String? title;
  String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            alignment: Alignment.centerRight,
            child: TextView(
                margin: const EdgeInsets.only(top: 6),
                text: title ?? "",
                style: 13.txtBoldDarkBlue),
          ),
        ),
        Expanded(
            child: Container(
                alignment: Alignment.centerLeft,
                child: TextView(
                    margin: const EdgeInsets.only(top: 6),
                    text: subtitle ?? "",
                    style: 14.txtSBoldGreyText)))
      ],
    );
  }
}
