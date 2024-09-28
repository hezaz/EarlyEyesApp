import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../components/styles/appColors.dart';


class ShimmerWidget extends StatelessWidget {
  ShimmerWidget({super.key, this.height});

  double? height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBaseColor,
      highlightColor: AppColors.shimmerHighlightColor,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: height ?? 100,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.shimmerBaseColor,
                borderRadius: BorderRadius.circular(16.0)),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16);
        },
        itemCount: 5,
      ),
    );
  }
}
