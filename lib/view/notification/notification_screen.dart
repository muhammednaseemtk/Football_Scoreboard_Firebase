// import 'package:flutter/material.dart';
// import 'package:football_scoreboard/constant/app_color.dart';
// import 'package:football_scoreboard/constant/app_font_family.dart';

// class NotificationScreen extends StatelessWidget {
//   const NotificationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.darkGrey,
//       appBar: AppBar(
//         backgroundColor: AppColor.darkGrey,
//         foregroundColor: AppColor.white,
//         title: Text('Notifications',style: AppFontFamily.txt1,),
//         centerTitle: true,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/notification_controller.dart';
import '../../constant/app_color.dart';
import '../../constant/app_font_family.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkGrey,
      appBar: AppBar(
        backgroundColor: AppColor.darkGrey,
        title: Text('Notifications', style: AppFontFamily.txt1),
        centerTitle: true,
      ),

      body: Consumer<NotificationController>(
        builder: (context, controller, child) {
          if (controller.notifications.isEmpty) {
            return const Center(
              child: Text(
                'No notifications',
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return ListView.builder(
            itemCount: controller.notifications.length,
            itemBuilder: (context, index) {
              final notification = controller.notifications[index];

              return ListTile(
                leading: Icon(Icons.notifications,
                    color: AppColor.accentGreen),
                title: Text(
                  notification.title,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  notification.body,
                  style: TextStyle(color: Colors.white70),
                ),
                trailing: Text(
                  '${notification.time.hour}:${notification.time.minute}',
                  style: const TextStyle(color: Colors.white54, fontSize: 12),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
