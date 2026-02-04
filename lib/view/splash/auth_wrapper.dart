import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:football_scoreboard/constant/app_color.dart';
import 'package:football_scoreboard/controller/user_controller.dart';
import 'package:football_scoreboard/view/auth/login_screen.dart';
import 'package:football_scoreboard/view/home/home_screen.dart';
import 'package:football_scoreboard/view/home/widget/main_screen.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: AppColor.darkGrey,
            body: Center(
              child: CircularProgressIndicator(color: AppColor.accentGreen),
            ),
          );
        }

        if (snapshot.hasData) {

          final user = snapshot.data!;

          return Consumer<UserController>(
            builder: (context, userController, child) {

              if (userController.user == null) {

                userController.loaddUser(user.uid);

                return Scaffold(
                  backgroundColor: AppColor.darkGrey,
                  body: Center(
                    child: CircularProgressIndicator(
                      color: AppColor.accentGreen,
                    ),
                  ),
                );
              }
              return MainScreen();
            },
          );
        }
        return LoginScreen();
      },
    );
  }
}
