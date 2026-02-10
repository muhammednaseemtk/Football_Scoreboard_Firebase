import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:football_scoreboard/constant/app_color.dart';

class ProProfileAvatar extends StatelessWidget {
  final String name;
  final String subtitle;
  final ImageProvider image;
  final VoidCallback? onEditTap;

  const ProProfileAvatar({
    super.key,
    required this.name,
    required this.subtitle,
    required this.image,
    this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 20,),

        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [

            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppColor.accentGreen,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.accentGreen,
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),

            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(6),
              child: CircleAvatar(
                child: Icon(EneftyIcons.user_outline,color: AppColor.white,size: 55,),
                backgroundColor: Colors.transparent,
              ),
            ),
          ],
        ),

         SizedBox(height: 18),

        Text(
          name.toUpperCase(),
          style:  TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.4,
          ),
        ),

         SizedBox(height: 6),

        Text(
          subtitle.toUpperCase(),
          style: TextStyle(
            color: AppColor.accentGreen,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }
}
