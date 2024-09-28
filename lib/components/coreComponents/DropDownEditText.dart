// import 'package:flutter/material.dart';
//
// import '../styles/appColors.dart';
// import 'EditText.dart';
// import 'appDropDown.dart';
//
// class DropDownEditText extends StatelessWidget {
//   final String? label;
//   const DropDownEditText({super.key, this.label});
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         EditText(
//           label: label,
//           controller: TextEditingController(),
//             suffixIcon: const SizedBox(
//               width: 102,
//               child: IntrinsicHeight(
//                 child: Row(
//                   children: [
//                      VerticalDivider(
//                       color: AppColors.greyR,
//                       thickness: 2,
//                     ),
//                     Expanded(child: SizedBox.shrink()),
//                   ],
//                 ),
//               ),
//             ),
//         ),
//
//         Positioned(
//           right: 0,
//             top: 0,
//             bottom: 0,
//             child: SizedBox(
//           width: 100,
//           child: AppDropDown<String>.singleSelect(
//             list: ['Sqr. Yds.'],
//             padding: EdgeInsets.zero,
//             borderColor: Colors.transparent,
//             selectedValue: 'Sqr. Yds.',
//             singleValueBuilder: (value )=> value,
//             itemBuilder: (value)=> value,
//             onSingleChange: (value) {  },
//             width: 100,
//           ),
//         ))
//       ],
//     );
//   }
// }
//
//
//
