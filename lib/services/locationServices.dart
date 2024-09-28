import 'dart:io';
//
// import 'package:location/location.dart';
// import 'package:permission_handler/permission_handler.dart' as pHandler;
//
// class LocationServices {
//   static final Location _location = Location();
//
//   static late bool _serviceEnabled;
//   static late PermissionStatus _permissionGranted;
//   static late LocationData _locationData;
//
//   static _isServiceEnabled() async {
//     _serviceEnabled = await _location.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await _location.requestService();
//       if (!_serviceEnabled) {
//         return;
//       }
//     }
//     // _location.enableBackgroundMode(enable: true);
//   }
//
//   static Future<bool> checkPermission() async {
//     await _isServiceEnabled();
//     _permissionGranted = await _location.hasPermission();
//     if(_permissionGranted == PermissionStatus.granted || _permissionGranted == PermissionStatus.grantedLimited ){
//       return true;
//     }else{
//       if (_permissionGranted == PermissionStatus.denied) {
//         _permissionGranted = await _location.requestPermission();
//         if (_permissionGranted != PermissionStatus.granted || _permissionGranted == PermissionStatus.grantedLimited ) {
//           return true;
//         }else{
//           if(_permissionGranted == PermissionStatus.deniedForever){
//             await pHandler.openAppSettings();
//           }
//           return false;
//         }
//       }else{
//         await pHandler.openAppSettings();
//         return false;
//       }
//     }
//
//   }
//
//   static Future<LocationData?> getLocation() async {
//     return
//       // Platform.isIOS ? null :
//     await _location.getLocation();
//   }
// }
