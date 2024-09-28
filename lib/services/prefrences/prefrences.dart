import 'dart:convert';
import 'package:early_eyes/utils/enum.dart';
import 'package:early_eyes/utils/extensions/extensions.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../feature/data/models/requestModels/login_res_model.dart';
import '../../feature/data/models/requestModels/parent_res_model.dart';
import '../../feature/data/models/requestModels/profile_res_model.dart';
import '../../feature/data/models/requestModels/student_res_model.dart';
import '../../feature/data/models/requestModels/teacher_res_model.dart';
import '../../feature/data/models/requestModels/user_data.dart';



class Preferences {
  
  static const _uidKey = 'uid_early_eyes';
  static const authToken = 'pref_auth_token';
  static const prefKeyIsFirstLaunch = 'pref_key_is_first_launch';
  static const prefKeyUser= 'pref_key_user';
  static const prefKeyStudent= 'pref_key_student';
  static const prefKeyTutor= 'pref_key_tutor';
  static const prefKeyParent = 'pref_key_parent';
  static const userRoleKey = 'pref_key_user_role';

  static late SharedPreferences _prefs;

  static Future createInstance() async {
    _prefs = await SharedPreferences.getInstance();
    return;
  }

  //-----------------[uid]-----------------------------------------------
  static set setUid(String? uid) =>
      uid != null ? _prefs.setString(_uidKey, uid) : _prefs.remove(_uidKey);

  static String? get getUid => _prefs.getString(_uidKey);


  static set setUserRole(SignUpType? role) =>
      role != null ? _prefs.setString(userRoleKey, role.name) : _prefs.remove(userRoleKey);

  static SignUpType? get getUserRole {
   final value = _prefs.getString(_uidKey);
   return value?.getUserRole;
   // switch(value){
   //   case SignUpType.studentType.name:
   // }
  }

  static bool get isFirstLaunch =>
      (getPref(prefKeyIsFirstLaunch) ?? true) as bool;

  static set isFirstLaunch(bool isFirstLaunch) {
    _prefs.setBool(prefKeyIsFirstLaunch, isFirstLaunch);
  }

  static UserData? get user {
    String? user = _prefs.getString(prefKeyUser);
    if(user !=null){
      try{
        final data = UserData.fromJson(jsonDecode(user));
        Logger().d('user fetch from pref');
        return data;
      }catch(e){
        Logger().d('user fetch exptch :: $e');
        return null;
      }

    }else{
      return null;
    }
  }

  static set user(UserData? userData){
    Logger().d(userData?.toJson());
    if(userData !=null){
      _prefs.setString(prefKeyUser,jsonEncode(userData.toJson()));
    }else{
      _prefs.remove(prefKeyUser);
    }
  }

  //----------------------------------[Student]---------------------------//
  static UserData? get student {
    String? user = _prefs.getString(prefKeyStudent);
    if(user !=null){
      return UserData.fromJson(jsonDecode(user));
    }else{
      return null;
    }
  }

  static set student(UserData? studentData){
    if(studentData !=null){
      _prefs.setString(prefKeyStudent,jsonEncode(studentData.toJson()));
    }else{
      _prefs.remove(prefKeyStudent);
    }
  }
  //----------------------------------[Teacher]---------------------------//
  static UserData? get teacher {
    String? user = _prefs.getString(prefKeyTutor);
    if(user !=null){
      return UserData.fromJson(jsonDecode(user));
    }else{
      return null;
    }
  }

  static set teacher(UserData? tutorData){
    if(tutorData !=null){
      _prefs.setString(prefKeyTutor,jsonEncode(tutorData.toJson()));
    }else{
      _prefs.remove(prefKeyTutor);
    }
  }
  //----------------------------------[Teacher]---------------------------//
  static UserData? get parent {
    String? user = _prefs.getString(prefKeyParent);
    if(user !=null){
      return UserData.fromJson(jsonDecode(user));
    }else{
      return null;
    }
  }

  static set parent(UserData? tutorData){
    if(tutorData !=null){
      _prefs.setString(prefKeyParent,jsonEncode(tutorData.toJson()));
    }else{
      _prefs.remove(prefKeyParent);
    }
  }


  //----------------------------remove user --------------------//
  static void removeUserData(){
    _prefs.remove(userToken);
    _prefs.remove(prefKeyUser);
    _prefs.remove(authToken);

  }

  //-----------------[Auth Token]-----------------------------------------------
  static String get userToken => _prefs.getString(authToken) ?? '';

  static set userToken(String? token) {
    _prefs.setString(authToken, token ?? '');
  }

  static Object? getPref(String key) {
    return _prefs.get(key);
  }
  static void save2Pref(String key, dynamic value) {
    if (value is bool) {
      _prefs.setBool(key, value);
    } else if (value is int) {
      _prefs.setInt(key, value);
    } else if (value is double) {
      _prefs.setDouble(key, value);
    } else if (value is String) {
      // print('key = $key, value = $value');
      _prefs.setString(key, value);
    } else {
      // throw Exception("Attempting to save non-primitive preference");
    }
  }
}
