import 'package:flutter/cupertino.dart';

import '../styles/appColors.dart';

class AppToggle extends StatelessWidget {
  final bool state;
  final Function(bool) onChanged;

  const AppToggle({super.key, required this.state, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.6,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.black.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: CupertinoSwitch(
          trackColor: AppColors.white,
          activeColor: AppColors.white,
          thumbColor: state ? AppColors.darkBlue : AppColors.primaryBlue,
          value: state,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
