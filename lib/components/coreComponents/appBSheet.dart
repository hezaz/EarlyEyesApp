
import 'package:flutter/material.dart';

import '../styles/appColors.dart';

appBSheet(BuildContext context, Widget child,{Color? barrierColor}){ showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true, barrierColor: barrierColor,
    backgroundColor: AppColors.white,
    shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.only( topRight: Radius.circular(
      // AppFonts.s30
    30
  ), topLeft: Radius.circular(
      // AppFonts.s30
    30
  )
  ), ),
    builder: (BuildContext context) {
      return Padding(
      padding: EdgeInsets.only(top:
      // AppFonts.s20
          0
      ),
      child: child, );});
}