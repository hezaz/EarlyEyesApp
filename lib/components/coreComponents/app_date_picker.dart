import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../styles/appColors.dart';

Future<String?> selectDate(
    {required BuildContext context,
    required TextEditingController ctrl,
    DateTime? selectedDate,
     String? dateFormat,

    }) async {
  final DateTime? pickedDate = await showDatePicker(
    builder: (context, child) {
      return Theme(
        data: ThemeData.dark().copyWith(
          colorScheme: const ColorScheme.dark(
            primary: AppColors.primaryBlue,
            onPrimary: Colors.white,
            surface: Colors.white,
            onSurface: Colors.black,
          ),
        ),
        child: child!,
      );
    },
    context: context,
    initialDate: selectedDate,
    firstDate: DateTime(1100),
    lastDate: DateTime.now(),
  );
  if (pickedDate != null && pickedDate != selectedDate) {
    selectedDate = pickedDate;

    ctrl.text = dateFormat ?? DateFormat('dd-MM-yyyy')
        .format(selectedDate)
        .toString();
  }
  return null;
}
