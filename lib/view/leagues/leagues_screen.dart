import 'package:flutter/material.dart';
import 'package:football_scoreboard/constant/app_color.dart';

class LeaguesScreen extends StatelessWidget {
  const LeaguesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkGrey,

      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28,vertical: 25),
        child: FloatingActionButton(
          splashColor: AppColor.shaded,
          backgroundColor: AppColor.black70,
          foregroundColor: AppColor.accentGreen,
          onPressed: (){},child: Icon(Icons.add,size: 30,),),
      ),
    );
  }
}