import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:flutter/material.dart';

import '../styles/appIcons.dart';
import '../styles/decoration.dart';
import 'ImageView.dart';
import 'TextView.dart';

class AppBar2 extends StatelessWidget { final EdgeInsets? padding;
final String? leadIcon;
final bool isLeadVisible;
final double? leadIconSize;
final double? leadIconBottomMargin;
final Function()? onLeadTap;
final Widget? tail;
final String? title;
final TextStyle? titleStyle;
final Widget? child;
const AppBar2({super.key, this.padding, this.leadIcon, this.onLeadTap, this.leadIconSize,
  this.tail, this.isLeadVisible = true, this.title, this.titleStyle, this.child, this.leadIconBottomMargin});
@override
Widget build(BuildContext context) {
  return SafeArea(
    bottom: false,
    child: Container(

      decoration: AppDecoration.appBarDecoration(),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(
            // AppFonts.s16
            20
        ), child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ Visibility(
          visible: isLeadVisible, child: ImageView(
          onTap: onLeadTap,
          url: leadIcon ??
              AppIcons.back
          ,
          size: leadIconSize ??
              // AppFonts.s20
              24
          ,
          margin: leadIconBottomMargin != null ? EdgeInsets.fromLTRB(0, 0, 10, leadIconBottomMargin! ) :
          const EdgeInsets.only(right: 10),

        ),
        ),
          Expanded(child:
              SizedBox(
                child: title != null ?
                TextView(text: title!, style: titleStyle ?? 16.txtSBoldBlackText,) :
                child
                ,
              )
          ), SizedBox(child: tail)
        ], ),
      ),

    ),
  ); }
}