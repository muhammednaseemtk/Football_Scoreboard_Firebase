import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:football_scoreboard/constant/app_color.dart';
import 'package:football_scoreboard/constant/app_font_family.dart';
import 'package:football_scoreboard/view/splash/auth_wrapper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_loading_indicator/new_loading_indicator.dart';

class SplahScreen extends StatefulWidget {
  const SplahScreen({super.key});

  @override
  State<SplahScreen> createState() => _SplahScreenState();
}

class _SplahScreenState extends State<SplahScreen> {
  @override
  void initState() {
    super.initState();
    goLogin();
  }

  Future<void> goLogin() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => AuthWrapper()),
    );
  }

  final List<String> images = [
    'asset/image/messi.png',
    'asset/image/neymar.jpg',
    'asset/image/ronaldo.jpg',
    'asset/image/maradona.jpg',
    'asset/image/ronaldinho.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          CarouselSlider(
            items: images.map((image) {
              return Image.asset(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
              );
            }).toList(),
            options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 2),
            ),
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColor.black20, AppColor.black70],
              ),
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: 80),

                    Text('FSB', style: AppFontFamily.heading),

                    SizedBox(height: 15),

                    Text(
                      'FOOTBALL SCOREBOARD',
                      style: GoogleFonts.playpenSans(
                        fontSize: 19,
                        color: AppColor.white,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Loading....',
                      style: GoogleFonts.montserrat(
                        color: AppColor.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(
                      height: 110,
                      child: LoadingIndicator(
                        indicatorType: Indicator.ballClipRotatePulse,
                        colors: [AppColor.accentGreen, AppColor.white],
                      ),
                    ),

                    SizedBox(height: 60),
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
