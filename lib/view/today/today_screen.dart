import 'package:flutter/material.dart';
import 'package:football_scoreboard/constant/app_color.dart';
import 'package:football_scoreboard/view/today/add_today.dart';
import 'package:football_scoreboard/view/today/widget/today_card.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkGrey,

      body: Column(
        children: [
          TodayCard(),
        ],
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
        child: FloatingActionButton(
          heroTag: null,
          backgroundColor: AppColor.accentGreen,
          foregroundColor: AppColor.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddToday()),
            );
          },
          child: Icon(Icons.add, size: 30),
        ),
      ),
    );
  }
}
