import 'package:flutter/material.dart';
import 'package:football_scoreboard/common/common_date_picker.dart';
import 'package:football_scoreboard/constant/app_color.dart';
import 'package:football_scoreboard/view/upcoming/add_upcoming.dart';

class UpcomingScreen extends StatelessWidget {
  const UpcomingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkGrey,

      body: Column(
        children: [
          CommonDatePicker(),
          Column(children: [
            ],
          ),
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
              MaterialPageRoute(builder: (context) => AddUpcoming()),
            );
          },
          child: Icon(Icons.add, size: 30),
        ),
      ),
    );
  }
}
