import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:football_scoreboard/common/common_button.dart';
import 'package:football_scoreboard/common/common_textfield.dart';
import 'package:football_scoreboard/constant/app_color.dart';
import 'package:football_scoreboard/constant/app_font_family.dart';
import 'package:football_scoreboard/controller/user_controller.dart';
import 'package:football_scoreboard/service/auth_service.dart';
import 'package:football_scoreboard/view/auth/register_screen.dart';
import 'package:football_scoreboard/view/home/home_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('FSB', style: AppFontFamily.heading),

            SizedBox(height: 10),

            Text('FOOTBALL SCOREBOARD', style: AppFontFamily.scdheading),

            SizedBox(height: 25),

            CommonTextfield(
              txt: 'EMAIL',
              controller: emailController,
              obsecureTxt: false,
            ),

            SizedBox(height: 20),

            CommonTextfield(
              txt: 'PASSWORD',
              controller: passwordController,
              obsecureTxt: true,
            ),

            SizedBox(height: 90),

            Consumer<UserController>(
              builder: (context, userController, child) {
                return CommonButton(
                  onPressed: () async {
                    final authService = AuthService();

                    try {
                    final user =  await authService.loginEmail(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );

                      if(user != null) {
                        await userController.loaddUser(user.uid);
                      }

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );

                      Fluttertoast.showToast(
                        msg: 'Login Success',
                        textColor: AppColor.darkGrey,
                      );
                    } catch (e) {
                      Fluttertoast.showToast(msg: e.toString());
                    }
                  },
                  txt: 'Login',
                );
              },
            ),

            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don`t have an account?', style: AppFontFamily.txt),

                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: Text('Register now', style: AppFontFamily.rgtbtn),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
