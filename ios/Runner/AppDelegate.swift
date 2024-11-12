import UIKit
import Flutter
//import FirebaseCore
//import UserNotifications

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
//      UNUserNotificationCenter.current().delegate = self
//      // Initialize Firebase
////      FirebaseApp.configure()
//      // Request Notification Permissions
//      UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
//        if granted {
//          print("Notification permission granted.")
//          DispatchQueue.main.async {
//            application.registerForRemoteNotifications()
//          }
//        } else {
//          print("Notification permission denied.")
//        }
//      }

      // Set up Firebase Messaging delegate

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
