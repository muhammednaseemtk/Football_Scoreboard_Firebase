import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:football_scoreboard/constant/app_color.dart';

class CommonDatePicker extends StatelessWidget {
  const CommonDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: DatePicker(
        DateTime.now().subtract(Duration(days: 3)),
        initialSelectedDate: DateTime.now(),
        selectionColor: AppColor.accentGreen,
        selectedTextColor: AppColor.white,
        width: 90,
        height: 100,
        dateTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColor.white,
        ),
        dayTextStyle: TextStyle(fontSize: 12, color: AppColor.shaded),
        monthTextStyle: TextStyle(fontSize: 12, color: AppColor.shaded),
      ),
    );
  }
}
