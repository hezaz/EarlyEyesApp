import 'package:early_eyes/services/prefrences/prefrences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'feature/presentation/pages/splash_screen.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Preferences.createInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Early Eyes',
      home: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:
        SplashScreen(),
        //   Contactus(),
      ),
    );
  }
}

