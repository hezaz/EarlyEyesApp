// import 'package:early_eyes/components/coreComponents/TextView.dart';
// import 'package:early_eyes/components/styles/appImages.dart';
// import 'package:early_eyes/components/styles/textStyles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import '../styles/appColors.dart';
//
// class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
//   CommonAppBar({
//     Key? key,
//     this.systemUiOverlayStyle,
//     this.leading,
//     this.actions,
//     this.height,
//     this.onBackTap,
//     this.title,
//     this.isDrawerVisible = false,
//   }) : super(key: key);
//   final SystemUiOverlayStyle? systemUiOverlayStyle;
//   final Widget? leading;
//   final List<Widget>? actions;
//   final double? height;
//   final String? title;
//
//   VoidCallback? onBackTap;
//   final bool isDrawerVisible;
//
//   @override
//   // Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
//   Size get preferredSize => Size.fromHeight(height ?? 70);
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//         centerTitle: true,
//         surfaceTintColor: Colors.transparent,
//         backgroundColor: Colors.white,
//         actions: actions,
//         automaticallyImplyLeading: false,
//         //leading: isDrawerVisible ? SizedBox() : null,
//         leading: isDrawerVisible
//             ? Builder(
//                 builder: (context) => IconButton(
//                   icon: const Icon(Icons.menu,
//                       size: 30, color: AppColors.greyHint),
//                   onPressed: () => Scaffold.of(context).openDrawer(),
//                 ),
//               )
//             : leading ??
//                 IconButton(
//                     onPressed: onBackTap,
//                     icon: Image.asset(
//                       AppImages.backBtn,
//                       height: 24,
//                     )),
//         title: TextView(text: title ?? "", style: 20.txtSBoldPBlueText));
//   }
// }
