import 'package:flutter/material.dart';
import 'package:football_scoreboard/constant/app_color.dart';
import 'package:football_scoreboard/constant/app_font_family.dart';
import 'package:football_scoreboard/view/profile/widget/profile_avatar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkGrey,
      appBar: AppBar(
        backgroundColor: AppColor.darkGrey,
        foregroundColor: AppColor.white,
        title: Text('Profile', style: AppFontFamily.txt1),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          children: [
            ProProfileAvatar(
              name: 'Naseem',
              subtitle: 'naseemtk@gmail.com',
              image: AssetImage('asset/image/messi.png'),
            ),
          ],
        ),
      ),
    );
  }
}
