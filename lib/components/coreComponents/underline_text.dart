import 'package:early_eyes/components/styles/appColors.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:flutter/cupertino.dart';

import 'TextView.dart';

class UnderLineTxt extends StatelessWidget {
  UnderLineTxt({super.key, this.txt});

  String? txt;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
          margin: const EdgeInsets.only(left: 16, top: 8),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: AppColors.darkBlue, width: 2.0))),
          child: TextView(
              margin: const EdgeInsets.only(bottom: 4),
              text: txt ?? "",
              style: 14.txtBoldDarkBlue)),
    );
  }
}
