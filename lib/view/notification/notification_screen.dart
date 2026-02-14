import 'package:flutter/material.dart';
import 'package:football_scoreboard/constant/app_color.dart';
import 'package:football_scoreboard/constant/app_font_family.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkGrey,
      appBar: AppBar(
        backgroundColor: AppColor.darkGrey,
        foregroundColor: AppColor.white,
        title: Text('Notification',style: AppFontFamily.txt1,),
        centerTitle: true,
      ),
      
      body:  Center(
        child: Text(
          'Waiting for notifications...',
          style: AppFontFamily.txt5
        ),
      ),
    );
  }
}