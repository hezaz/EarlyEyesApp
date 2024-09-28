import 'package:early_eyes/feature/presentation/pages/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../services/network/post_request.dart';
import '../../services/prefrences/prefrences.dart';
import '../../utils/device_info.dart';
import '../data/models/requestModels/profile_res_model.dart';
class LoginController extends GetxController {
  final loginKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  var isLoading = false.obs;

  Future<String> userLogin() async {
    var deviceInfo = await DeviceConfig.getDeviceInfo();
    try {
      isLoading.value = true;
      Map<String, String> requestBody = {
        'email': emailCtrl.text.toString(),
        'password': passwordCtrl.text.toString(),
        'device_id': '${deviceInfo.deviceId}',
        'device_token': "${deviceInfo.deviceToken}",
      };

      var response = await PostRequests.userLogin(requestBody);
      if (response?.success == true) {
        saveDataToPref(response?.data);
        isLoading.value = false;
        return response?.message.toString() ?? '';
      } else {
        isLoading.value = false;
        throw response?.message ?? '';
      }
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }

  void saveDataToPref(UserData? user) {
    Preferences.user = user;
    Preferences.userToken = user?.token;
  }


  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
      await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleSignInAuthentication =
      await googleSignInAccount?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken,
      );
      final authResult = await     _auth.signInWithCredential(credential);

      final User? user = authResult.user;
      assert(!user!.isAnonymous);
      assert(await user?.getIdToken() != null);
      final User? currentUser = _auth.currentUser;
      assert(user?.uid == currentUser?.uid);
      Get.to(HomeScreen()); // navigate to your wanted page
      return;
    } catch (e) {
      throw (e);
    }
  }

  Future<void> logoutGoogle() async {
    await googleSignIn.signOut();
    Get.back();
  }


}
