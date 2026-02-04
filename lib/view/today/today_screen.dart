import 'package:flutter/material.dart';
import 'package:football_scoreboard/constant/app_color.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkGrey,

      

      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 70),
        child: FloatingActionButton(
          splashColor: AppColor.shaded,
          backgroundColor: AppColor.black70,
          foregroundColor: AppColor.accentGreen,
          onPressed: (){},child: Icon(Icons.add,size: 30,),),
      ),
    );
  }
}