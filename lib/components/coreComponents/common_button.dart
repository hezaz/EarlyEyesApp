// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart';
//
// import '../styles/appColors.dart';
// import '../styles/textStyles.dart';
// import 'TextView.dart';
//
// class CommonButton extends StatelessWidget {
//   String text;
//   Color? backgroundColor;
//   Color? textColor;
//   VoidCallback clickAction;
//   RxBool? isEnable = false.obs;
//   double? borderRadius;
//   double? elevation;
//   EdgeInsets? margin;
//   double? marginHorizontal;
//   double? height;
//   double? width;
//   TextStyle? textStyle;
//   double? borderWidth;
//   RxBool? isLoading;
//   Color? borderColor;
//
//   CommonButton(
//       {Key? key,
//       required this.text,
//       this.textColor,
//       this.backgroundColor,
//       required this.clickAction,
//       this.isEnable,
//       this.borderRadius,
//       this.elevation,
//       this.margin,
//       this.marginHorizontal,
//       this.height,
//       this.width,
//       this.textStyle,
//       this.borderWidth,
//       this.isLoading,
//       this.borderColor})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => (isLoading?.value ?? false)
//           ? Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const CircularProgressIndicator(
//                   backgroundColor: AppColors.greyHint,
//                   strokeAlign: 1.5,
//                   strokeCap: StrokeCap.round,
//                   strokeWidth: 5.5,
//                   valueColor:
//                       AlwaysStoppedAnimation<Color>(AppColors.primaryBlue),
//                 ),
//                 TextView(
//                   text: 'Loading...',
//                   style: 16.txtBoldDarkBlue,
//                   margin: const EdgeInsets.only(top: 20),
//                 )
//               ],
//             )
//           : Container(
//               height: height ?? 45,
//               margin: margin ??
//                   EdgeInsets.symmetric(
//                     horizontal: marginHorizontal ?? 16,
//                   ),
//               width: width ?? double.infinity,
//               child: ElevatedButton(
//                 onPressed:
//                     isEnable?.value ?? RxBool(true).value ? clickAction : null,
//                 style: ButtonStyle(
//                     elevation: MaterialStateProperty.all(elevation),
//                     backgroundColor: MaterialStateProperty.all(
//                         isEnable?.value ?? RxBool(true).value
//                             ? backgroundColor ?? AppColors.primaryBlue
//                             : backgroundColor ??
//                                 AppColors.primaryBlue.withOpacity(0.29)),
//                     shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(borderRadius ?? 30),
//                         side: BorderSide(
//                             color: borderColor ?? Colors.transparent,
//                             width: borderWidth ?? 0)))),
//                 child: Center(
//                   child: Text(text.tr,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: textStyle ??
//                           16.txtMediumWhite.copyWith(color: textColor)),
//                 ),
//               ),
//               // ),
//             ),
//     );
//   }
// }
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../styles/appColors.dart';
import '../styles/textStyles.dart';
import 'TextView.dart';
import 'appDialog.dart';



class CommonButton extends StatelessWidget {
  String text;
  Color? backgroundColor;
  Color? textColor;
  VoidCallback clickAction;
  RxBool? isEnable = false.obs;
  double? borderRadius;
  double? elevation;
  EdgeInsets? margin;
  double? marginHorizontal;
  double? height;
  double? width;
  TextStyle? textStyle;
  double? borderWidth;
  RxBool? isLoading;
  Color? borderColor;

  CommonButton(
      {Key? key,
        required this.text,
        this.textColor,
        this.backgroundColor,
        required this.clickAction,
        this.isEnable,
        this.borderRadius,
        this.elevation,
        this.margin,
        this.marginHorizontal,
        this.height,
        this.width,
        this.textStyle,
        this.borderWidth,
        this.isLoading,
        this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return

        Container(
          height: height ?? 45,
          margin: margin ??
              EdgeInsets.symmetric(
                horizontal: marginHorizontal ?? 16,
              ),
          width: width ?? double.infinity,
          child:
          Obx(
                () => (isLoading?.value??false) ?
              const Column(
                children: [
                  SizedBox(
                    height: 25,width: 25,
                    child: CircularProgressIndicator(color: AppColors.primaryBlue),

                                        ),
                ],
              )
                    :
          ElevatedButton(
            onPressed:
            isEnable?.value ?? RxBool(true).value ? clickAction : null,
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(elevation),
                backgroundColor: MaterialStateProperty.all(
                    isEnable?.value ?? RxBool(true).value
                        ? backgroundColor ?? AppColors.primaryBlue
                        : backgroundColor ??
                        AppColors.primaryBlue.withOpacity(0.29)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 30),
                    side: BorderSide(
                        color: borderColor ?? Colors.transparent,
                        width: borderWidth ?? 0)))),
            child: Center(
              child: Text(text.tr,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle ?? 16.txtMediumWhite.copyWith(color: textColor)),
            ),
          ),
          // ),
        ),
      );
  }
}
loader(BuildContext context, {Key? key}){
  var  child =  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const CircularProgressIndicator(
        backgroundColor: AppColors.greyHint,
        strokeAlign: 2.5,
        strokeCap: StrokeCap.round,
        strokeWidth: 6.5,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryBlue),
      ),
      TextView(text: 'Loading...', style: 20.txtBoldWhite,
        margin:  const EdgeInsets.only(top: 20),
      )
    ],
  );

  final alertDialog = AlertDialog(
    key: key,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(
            6))),
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40
      // horizontal: AppFonts.s16, vertical: AppFonts.s40
    ),
    content:  SizedBox(width: double.maxFinite, child: child),
  );

  showDialog(
      context: context,
      useSafeArea: true,
      barrierDismissible: false,
      builder: (_) => AnimateDialog(
        childView: alertDialog,
      ));
}