import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:football_scoreboard/constant/app_color.dart';
import 'package:football_scoreboard/constant/app_font_family.dart';
import 'package:football_scoreboard/controller/today_controller.dart';
import 'package:football_scoreboard/controller/upcoming_controller.dart';
import 'package:football_scoreboard/model/upcoming_model.dart';
import 'package:provider/provider.dart';

class UpcomingCard extends StatelessWidget {
  final UpcomingModel model;

  const UpcomingCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),

      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.shaded, width: 1),
          borderRadius: BorderRadius.circular(24),
          color: AppColor.black20,
        ),

        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'MATCHDAY',
                  style: TextStyle(
                    color: AppColor.shaded,
                    fontSize: 12,
                    letterSpacing: 1.2,
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.shaded,
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Text('Upcoming', style: AppFontFamily.name),
                ),

                Consumer<UpcomingController>(
                  builder: (context, controller, child) {
                    return IconButton(
                      onPressed: () {
                        if (model.id != null) {
                          controller.deleteUpcomingMatch(model.id!);
                        }
                      },
                      icon: Icon(
                        EneftyIcons.close_outline,
                        color: AppColor.accentGreen,
                      ),
                    );
                  },
                ),
              ],
            ),

            SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 34,
                      backgroundColor: AppColor.accentGreen,
                      child: Icon(Icons.sports_soccer_sharp,color: AppColor.white,),
                    ),

                    SizedBox(height: 12),

                    Text(model.teamA ?? '', style: AppFontFamily.name),
                  ],
                ),

                Column(
                  children: [
                    Text(model.time ?? '', style: AppFontFamily.txt2),

                    SizedBox(height: 6),

                    Text(
                      "KICKOFF",
                      style: TextStyle(
                        color: AppColor.shaded,
                        fontSize: 12,
                        letterSpacing: 1.4,
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [
                    CircleAvatar(
                      radius: 34,
                      backgroundColor: AppColor.accentGreen,
                      child: Icon(Icons.sports_soccer_sharp,color: AppColor.white,),
                    ),

                    SizedBox(height: 12),

                    Text(model.teamB ?? '', style: AppFontFamily.name),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
