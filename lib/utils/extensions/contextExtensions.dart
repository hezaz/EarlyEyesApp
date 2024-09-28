import 'package:flutter/material.dart';
import '../../components/coreComponents/appBSheet.dart';
import '../../components/coreComponents/appDialog.dart';
import '../../components/coreComponents/loader.dart';
import '../../components/styles/appColors.dart';


//------------------------------[dimensions]------------------------------------
extension DimensionExtn on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get getHeight => MediaQuery.of(this).size.height;
  Size get size => MediaQuery.of(this).size;
  double get getWidth => MediaQuery.of(this).size.width;
  double get bottomSafeArea => MediaQuery.of(this).viewPadding.bottom;
  double get topSafeArea => MediaQuery.of(this).viewPadding.top;
}






//--------------------------------[ Navigation ]-------------------------------
extension NavigatorExtn on BuildContext {
// navigate to next screen
  Future<dynamic> pushNavigator(Widget screen) => Navigator.push(
      this, MaterialPageRoute(
    builder: (context) => screen, ));
// push and replace ......
  void replaceNavigator(Widget screen) => Navigator.pushReplacement(
      this, MaterialPageRoute(
    builder: (context) => screen, ));
// clear stack and navigate to screen....
  void pushAndClearNavigator(Widget screen) => Navigator.pushAndRemoveUntil(
      this, MaterialPageRoute(
    builder: (context) => screen, ),
          (route) => false);
//pop back...
  void pop() => Navigator.pop(this); }






//------------------------------[Locale]----------------------------------------------
extension LocaleExtn on BuildContext{
  // AppLocalizations get locale => AppLocalizations.of(this)!;
}














//--------------------------[Dialog]--------------------------------------------
extension AppStateExtn on BuildContext { // show progress loader....
  void  load({Key? key}) => loader(this, key: key);


// close progressLoader or dialog .....
  void get stopLoader => Navigator.of(this, rootNavigator: true).pop('dialog');
  Future<DateTime?> get datePicker { return showDatePicker(
      context: this,
      initialDate: DateTime.now(), firstDate: DateTime(1950), lastDate: DateTime(3000));
  }
  Future<TimeOfDay?> get timePicker { return showTimePicker(
      context: this,
      initialTime: TimeOfDay.now(),
      builder: (context, child) => MediaQuery(

        data:
        MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false), child: child!,
      )); }
// show popup dialog ....
  void openDialog(


      Widget child,{bool barrierDismissible = true,EdgeInsets? padding,
        Color bgColor = AppColors.white,Key? key}) => appDialog(this,
      child,barrierDismissible: barrierDismissible, bgColor: bgColor,padding: padding);



// show popup dialog ....
//   void openFailureDialog(String message) => appDialog(
//       this, FailureMessageDialog(
//     message: message, onTap: () {
//     stopLoader; },
//     dismiss: () { stopLoader;
//     }, ));




// show bottom sheet ....
void openBottomSheet(Widget child) => appBSheet(this,child);
// check whether is portrait mode state ...
  bool get isPortraitMode =>
      MediaQuery.of(this).orientation == Orientation.portrait; }