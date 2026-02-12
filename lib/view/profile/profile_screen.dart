import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:football_scoreboard/common/buttons.dart';
import 'package:football_scoreboard/constant/app_color.dart';
import 'package:football_scoreboard/constant/app_font_family.dart';
import 'package:football_scoreboard/service/auth_service.dart';
import 'package:football_scoreboard/view/auth/login_screen.dart';
import 'package:football_scoreboard/view/profile/widget/profile_avatar.dart';
import 'package:football_scoreboard/view/settings/settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        backgroundColor: AppColor.transparent,
        foregroundColor: AppColor.white,
        title: Text('Profile', style: AppFontFamily.txt1),
        centerTitle: true,
      ),

      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('asset/image/football.jpg', fit: BoxFit.cover),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  SizedBox(height: 90,),

                  ProProfileAvatar()]),

                Column(
                  children: [
                    Buttons(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsScreen(),
                          ),
                        );
                      },
                      txt: 'Settings',
                      iconClr: AppColor.accentGreen,
                      txtClr: AppColor.white,
                      icon: EneftyIcons.setting_outline,
                    ),

                    Buttons(
                      onTap: () async {
                        await AuthService().logout();

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => LoginScreen()),
                          (route) => false,
                        );

                        Fluttertoast.showToast(
                          msg: 'Logout success',
                          toastLength: Toast.LENGTH_SHORT,
                        );
                      },
                      txt: 'Logout',
                      iconClr: AppColor.logout,
                      txtClr: AppColor.logout,
                      icon: EneftyIcons.logout_2_outline,
                    ),

                    SizedBox(height: 75),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
