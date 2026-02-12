import 'package:flutter/material.dart';
import 'package:football_scoreboard/constant/app_color.dart';
import 'package:football_scoreboard/controller/today_controller.dart';
import 'package:football_scoreboard/controller/upcoming_controller.dart';
import 'package:football_scoreboard/view/today/widget/today_card.dart';
import 'package:football_scoreboard/view/upcoming/add_upcoming.dart';
import 'package:football_scoreboard/view/upcoming/widget/upcoming_card.dart';
import 'package:provider/provider.dart';

class UpcomingScreen extends StatelessWidget {
  const UpcomingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkGrey,

      body: Consumer<UpcomingController>(
        builder: (context, controller, child) {
          return StreamBuilder(
            stream: controller.upcomingMaches,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(color: AppColor.accentGreen),
                );
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                  child: Text(
                    "No matches for upcoming",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }

              final matches = snapshot.data!;

              return ListView.builder(
                itemCount: matches.length,
                itemBuilder: (context, index) {
                  return UpcomingCard(model: matches[index]);
                },
              );
            },
          );
        },
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
        child: FloatingActionButton(
          heroTag: 'Add Upcoming Match',
          backgroundColor: AppColor.accentGreen,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AddUpcoming()),
            );
          },
          child: Icon(Icons.add, size: 30, color: AppColor.white),
        ),
      ),
    );
  }
}
