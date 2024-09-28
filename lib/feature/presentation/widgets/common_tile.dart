import 'package:early_eyes/components/styles/textStyles.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/coreComponents/TextView.dart';
import '../../../components/styles/appColors.dart';


class CommonTile extends StatelessWidget {
  CommonTile(
      {super.key,
        required this.selectedIndex,
        required this.currentIndex,
        required this.onTap,
        this.title,
        this.subtitle,
        this.image,this.margin,this.padding});

  RxInt selectedIndex = (-1).obs;
  int currentIndex = 0;
  String? title;
  String? subtitle;
  String? image;
  Function(int index) onTap;
  EdgeInsets? margin;
  EdgeInsets? padding;


  @override
  Widget build(BuildContext context) {
    return Obx(
          () => GestureDetector(
        onTap: () {
          onTap(currentIndex);
        },
        child: Container(
          margin: const EdgeInsets.only(left: 16, right: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.darkBlue.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                      height: 25, width: 25, child: Image.asset(image ?? "")),
                  TextView(
                      margin: const EdgeInsets.only(left: 12),
                      text: title ?? "",

                      style: 14.txtBoldDarkBlue)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: TextView(
                        margin: margin ??  const EdgeInsets.only(top: 12, right: 8),
                        text: subtitle ?? "",
                        style: 10.txtRegularDBlue,
                      )),
                  Container(
                    margin: padding,
                    height: 25,width: 25,
                    decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(
                        color: currentIndex == selectedIndex.value
                            ? AppColors.darkBlue
                            : AppColors.darkBlue.withOpacity(0.6),
                      width: 2.2

                    )),
                            child: currentIndex == selectedIndex.value ? Center(
                            child: Icon(
                              Icons.done_rounded,
                              size: 18,
                              color: currentIndex == selectedIndex.value
                                  ? AppColors.darkBlue
                                  : AppColors.darkBlue.withOpacity(0.5),
                            )) : null

                      ),


                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
