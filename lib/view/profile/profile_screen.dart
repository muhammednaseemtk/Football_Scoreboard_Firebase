import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:football_scoreboard/common/buttons.dart';
import 'package:football_scoreboard/constant/app_color.dart';
import 'package:football_scoreboard/constant/app_font_family.dart';
import 'package:football_scoreboard/service/auth_service.dart';
import 'package:football_scoreboard/view/auth/login_screen.dart';
import 'package:football_scoreboard/view/profile/widget/profile_avatar.dart';
import 'package:football_scoreboard/view/profile/widget/theme_button.dart';
import 'package:football_scoreboard/view/settings/settings_screen.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [ProProfileAvatar()]),

            Column(
              children: [
                ThemeButtons(
                  txt: 'Theme',
                  iconClr: AppColor.accentGreen,
                  txtClr: AppColor.white,
                  icon: Icons.contrast_rounded,
                ),

                Buttons(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsScreen()),
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

                    Fluttertoast.showToast(msg: 'Logout success');
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
    );
  }
}
