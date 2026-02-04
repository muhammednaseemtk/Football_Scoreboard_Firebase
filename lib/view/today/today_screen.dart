import 'package:flutter/material.dart';
import 'package:football_scoreboard/constant/app_color.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkGrey,

      body: Column(
        children: [],
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28,vertical: 20),
        child: FloatingActionButton(
          splashColor: AppColor.shaded,
          backgroundColor: AppColor.black70,
          foregroundColor: AppColor.accentGreen,
          onPressed: (){},child: Icon(Icons.add,size: 30,),),
      ),
    );
  }
}