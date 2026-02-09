import 'package:flutter/material.dart';
import 'package:football_scoreboard/controller/main_screen_controller.dart';
import 'package:football_scoreboard/view/home/home_screen.dart';
import 'package:football_scoreboard/view/leagues/leagues_screen.dart';
import 'package:football_scoreboard/view/profile/profile_screen.dart';
import 'package:provider/provider.dart';

import './bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> pages =  [
    HomeScreen(),
    LeaguesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MainScreenController>(
        builder: (context, value, child) =>
            IndexedStack(
              index: value.currentIndex,
              children: pages,
            ),
      ),
      bottomNavigationBar: Consumer<MainScreenController>(
        builder: (context, value, child) =>
            BottomNavBar(
              currentIndex: value.currentIndex,
              onTap: value.changeIndex,
            ),
      ),
    );
  }
}