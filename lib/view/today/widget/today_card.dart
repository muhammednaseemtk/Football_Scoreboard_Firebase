import 'package:flutter/material.dart';
import 'package:football_scoreboard/constant/app_color.dart';

class TodayCard extends StatelessWidget {
  const TodayCard({super.key});

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
                  child: Text(
                    'Today',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
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
                      backgroundColor: Colors.grey.shade800,
                    ),

                    SizedBox(height: 12),

                    Text(
                      'FCB',
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [
                    Text(
                      "20:30",
                      style: TextStyle(
                        color: AppColor.accentGreen,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

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
                      backgroundColor: AppColor.shaded,
                    ),

                    SizedBox(height: 12),

                    Text(
                      "Liverpool",
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
