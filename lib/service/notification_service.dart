// import 'package:firebase_messaging/firebase_messaging.dart';

// class NotificationService {
//   final FirebaseMessaging fcm = FirebaseMessaging.instance;

//   Future<void> init() async {
//     await fcm.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true
//     );

//     String? token = await fcm.getToken();
//     print('FCM TOKEN $token');

//     FirebaseMessaging.onMessage.listen((message) {
//       print('Foreground Notification: ${message.notification?.title}');
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen((message) {
//       print('Notification Clicked');
//     });
//   }
// }
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  final FirebaseMessaging fcm = FirebaseMessaging.instance;

  Future<void> init({
    required Function(String title, String body) onReceive,
  }) async {

    await fcm.requestPermission();

    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification != null) {
        onReceive(
          notification.title ?? 'No Title',
          notification.body ?? 'No Body',
        );
      }
    });
  }
}
