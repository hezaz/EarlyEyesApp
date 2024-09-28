import 'package:flutter/material.dart';
import 'appDialog.dart';


void loader(BuildContext context, {Key? key}){
  const child =  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircularProgressIndicator()
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
    content: const SizedBox(width: double.maxFinite, child: child),
  );

  showDialog(
      context: context,
      useSafeArea: true,
      barrierDismissible: false,
      builder: (_) => AnimateDialog(
        childView: alertDialog,
      ));
}