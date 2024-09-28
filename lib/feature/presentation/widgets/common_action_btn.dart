
import 'package:flutter/material.dart';

import '../../../components/styles/appColors.dart';

class CommonActionBtn extends StatelessWidget {
 CommonActionBtn({super.key,this.onTap});
VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircleAvatar(
          radius: 24,
          backgroundColor: AppColors.primaryBlue,
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 26,
            ),
          ),
        ),
      ),
    );
  }
}
