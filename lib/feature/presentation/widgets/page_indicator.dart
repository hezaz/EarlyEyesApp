import 'package:flutter/material.dart';

import '../../../components/styles/appColors.dart';


class PageIndicator extends StatelessWidget {
  int length;
  int selectedIndex = 0;
  double? borderRadius;
  double? width;
  double? selectedWidth;

  PageIndicator({Key? key, required this.selectedIndex,
    required this.length,this.borderRadius,
  this.selectedWidth,this.width

  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: length,
        shrinkWrap: true,
        itemBuilder: (context, position) {
          return AnimatedContainer(
            margin: const EdgeInsets.only(left: 3),
            width: position == selectedIndex ? width ?? 23 : width ?? 23,
            height: 3,
            decoration: BoxDecoration(
                color: position == selectedIndex
                    ? AppColors.darkBlue
                    : AppColors.darkBlue.withOpacity(0.3),
                borderRadius: BorderRadius.circular(borderRadius ?? 24)),
            duration: const Duration(milliseconds: 300),
          );
        });
  }
}
