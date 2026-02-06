import 'package:flutter/material.dart';
import 'package:football_scoreboard/constant/app_color.dart';
import 'package:football_scoreboard/controller/today_controller.dart';
import 'package:football_scoreboard/view/today/add_today.dart';
import 'package:football_scoreboard/view/today/widget/today_card.dart';
import 'package:provider/provider.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkGrey,

      body: Consumer<TodayController>(
        builder: (context, controller, child) {
          return FutureBuilder(
            future: controller.todayMaches,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(color: AppColor.accentGreen),
                );
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                  child: Text(
                    "No matches today",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }

              final matches = snapshot.data!;

              return ListView.builder(
                itemCount: matches.length,
                itemBuilder: (context, index) {
                  return TodayCard(model: matches[index]);
                },
              );
            },
          );
        },
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
        child: FloatingActionButton(
          heroTag: 'Add Today Match',
          backgroundColor: AppColor.accentGreen,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AddToday()),
            );
          },
          child: Icon(Icons.add, size: 30, color: AppColor.white),
        ),
      ),
    );
  }
}
