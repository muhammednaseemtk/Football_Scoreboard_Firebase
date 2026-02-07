import 'package:flutter/material.dart';
import 'package:football_scoreboard/constant/app_color.dart';
import 'package:football_scoreboard/constant/app_font_family.dart';

class LeaguesScreen extends StatelessWidget {
  const LeaguesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkGrey,

      appBar: AppBar(
        backgroundColor: AppColor.darkGrey,
        foregroundColor: AppColor.white,
        title: Text('League', style: AppFontFamily.txt1),
        centerTitle: true,
      ),

      body: Column(children: [
        ],
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
        child: FloatingActionButton(
          backgroundColor: AppColor.accentGreen,
          foregroundColor: AppColor.white,
          onPressed: () {},
          child: Icon(Icons.add, size: 30),
        ),
      ),
    );
  }
}
