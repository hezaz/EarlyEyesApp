import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

import '../feature/data/models/dataModels/device_model.dart';

class DeviceConfig {
  static DeviceModel? deviceDetails = DeviceModel();

  static Future<bool> init() async {

    DeviceConfig.getDeviceInfo().then((value) async {
      deviceDetails = value;


    });
    return Future.value(true);
  }

  static Future<DeviceModel> getDeviceInfo() async {
    DeviceModel deviceDetails = DeviceModel();

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    // AndroidId   androidId = const AndroidId();
    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo info = await deviceInfo.androidInfo;
        deviceDetails.deviceName = info.model;
        deviceDetails.deviceOS = "Android";
        deviceDetails.deviceOSVersion = info.version.sdkInt.toString();
        deviceDetails.deviceModel = info.model;
        deviceDetails.deviceToken =  info.data.toString();
         deviceDetails.deviceId = info.device;
        // String? deviceId = await androidId.getId();
        // debugPrint("deviceId = $deviceId");
        // deviceDetails.deviceId = deviceId;
      } else if (Platform.isIOS) {
        IosDeviceInfo info = await deviceInfo.iosInfo;
        deviceDetails.deviceName = info.utsname.machine;
        deviceDetails.deviceOS = "iOS";
        deviceDetails.deviceOSVersion = info.systemName;
        deviceDetails.deviceModel = info.utsname.machine;
        deviceDetails.deviceId = info.identifierForVendor;

        // uniq
      }
    } catch (e) {}
    return deviceDetails;
  }
}