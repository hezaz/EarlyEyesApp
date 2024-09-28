
import 'package:flutter/material.dart';

class CommonCard extends StatelessWidget {
   CommonCard({super.key,this.margin,this.child,this.padding,this.height,
     this.width,this.onTap,this.radius,this.bkColor,this.borderClr});
EdgeInsets? margin;
   EdgeInsets? padding;
   double? height;
   double? width;
   double? radius;
Widget? child;
VoidCallback? onTap;
Color? bkColor;
Color? borderClr;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(

        height:height ,
        width:width ,
        padding: padding,
        margin: margin ?? const EdgeInsets.symmetric(horizontal: 16,vertical: 16),

        decoration: BoxDecoration(
          border: Border.all(color: borderClr ?? Colors.transparent),
          color: bkColor ??  Colors.white,
          borderRadius: BorderRadius.circular(radius ?? 16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 6.0,
            )
          ]
        ),
        child: child ?? const SizedBox(),
      ),
    );
  }
}
