import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:football_scoreboard/common/common_button.dart';
import 'package:football_scoreboard/common/common_textfield.dart';
import 'package:football_scoreboard/constant/app_color.dart';
import 'package:football_scoreboard/constant/app_font_family.dart';
import 'package:football_scoreboard/controller/user_controller.dart';
import 'package:football_scoreboard/model/user_model.dart';
import 'package:football_scoreboard/service/auth_service.dart';
import 'package:football_scoreboard/view/auth/login_screen.dart';
import 'package:football_scoreboard/view/splash/auth_wrapper.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkGrey,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('FSB', style: AppFontFamily.heading),

              SizedBox(height: 10),

              Text('FOOTBALL SCOREBOARD', style: AppFontFamily.scdheading),

              SizedBox(height: 30),

              CommonTextfield(
                txt: 'NAME',
                controller: nameController,
                obsecureTxt: false,
              ),

              SizedBox(height: 21),

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
                        final user = await authService.registerEmail(
                          nameController.text.trim(),
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        );

                        if (user != null) {
                          final newUser = UserModel(
                            uid: user.uid,
                            name: nameController.text.trim(),
                            email: user.email,
                          );

                          await userController.createUser(newUser);
                        }

                        Fluttertoast.showToast(
                          msg: 'Registration Success',
                          textColor: AppColor.darkGrey,
                        );

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => AuthWrapper()),
                        );
                      } catch (e) {
                        Fluttertoast.showToast(msg: e.toString());
                      }
                    },
                    txt: 'Register',
                  );
                },
              ),

              SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?', style: AppFontFamily.txt),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text('Login', style: AppFontFamily.rgtbtn),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
