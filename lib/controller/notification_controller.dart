// import 'package:flutter/material.dart';
// import 'package:football_scoreboard/service/notification_service.dart';

// class NotificationController with ChangeNotifier {
//   final NotificationService notificationService = NotificationService();

//   Future<void> initNotifications() async {
//     await notificationService.init();
//     notifyListeners();
//   }
// }
import 'package:flutter/material.dart';
import 'package:football_scoreboard/model/notification_model.dart';
import '../service/notification_service.dart';

class NotificationController with ChangeNotifier {
  final NotificationService notificationService = NotificationService();

  final List<AppNotification> _notifications = [];

  List<AppNotification> get notifications => _notifications;

  Future<void> initNotifications() async {
    await notificationService.init(onReceive: addNotification);
  }

  void addNotification(String title, String body) {
    _notifications.insert(
      0,
      AppNotification(
        title: title,
        body: body,
        time: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
