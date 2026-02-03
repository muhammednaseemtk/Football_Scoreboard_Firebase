import 'package:enefty_icons/enefty_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:football_scoreboard/constant/app_color.dart';
import 'package:football_scoreboard/constant/app_font_family.dart';
import 'package:football_scoreboard/view/home/widget/custom_drawer.dart';
import 'package:football_scoreboard/view/leagues/leagues_screen.dart';
import 'package:football_scoreboard/view/today/today_screen.dart';
import 'package:football_scoreboard/view/upcoming/upcoming_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final user = FirebaseAuth.instance.currentUser;

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkGrey,

      drawer: CustomDrawer(),

      appBar: AppBar(
        backgroundColor: AppColor.darkGrey,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: Scaffold.of(context).openDrawer,
            icon: Icon(EneftyIcons.user_outline, color: AppColor.accentGreen),
          ),
        ),

        title: Text(
          user?.displayName ?? 'Football Fan',
          style: AppFontFamily.name,
        ),

        actions: [
          Row(
            children: [
              Icon(Icons.sports_soccer_outlined, color: AppColor.accentGreen),

              SizedBox(width: 10),

              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_none_outlined,
                  color: AppColor.accentGreen,
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
      
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: Text('Football Live Scores', style: AppFontFamily.txt1),
          ),
      
          Text('POWERED BY FIREBASE', style: AppFontFamily.txt),
      
          SizedBox(height: 15),
      
          TabBar(
            controller: tabController,
            indicatorColor: AppColor.accentGreen,
            labelColor: AppColor.accentGreen,
            unselectedLabelColor: AppColor.shaded,
            tabs: const [
              Tab(text: 'Today'),
              Tab(text: 'Upcoming'),
              Tab(text: 'Leagues'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                TodayScreen(),
                UpcomingScreen(),
                LeaguesScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
