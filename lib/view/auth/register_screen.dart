import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:football_scoreboard/common/common_button.dart';
import 'package:football_scoreboard/common/common_textfield.dart';
import 'package:football_scoreboard/constant/app_color.dart';
import 'package:football_scoreboard/constant/app_font_family.dart';
import 'package:football_scoreboard/service/auth_service.dart';
import 'package:football_scoreboard/view/auth/login_screen.dart';
import 'package:football_scoreboard/view/home/home_screen.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

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
                controller: _usernameController,
                obsecureTxt: false,
              ),
              SizedBox(height: 21),
              CommonTextfield(
                txt: 'EMAIL',
                controller: _emailController,
                obsecureTxt: false,
              ),
              SizedBox(height: 20),
              CommonTextfield(
                txt: 'PASSWORD',
                controller: _passwordController,
                obsecureTxt: true,
              ),
              SizedBox(height: 90),
              CommonButton(
                onPressed: () async {
                  final authService = AuthService();

                  try {
                    await authService.rgtEmail(
                      _emailController.text.trim(),
                      _passwordController.text.trim(),
                    );

                    Fluttertoast.showToast(msg: 'Registration Success',textColor: AppColor.darkGrey);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  } catch (e) {
                    Fluttertoast.showToast(msg: e.toString());
                  }
                },
                txt: 'Register',
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
