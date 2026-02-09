import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:football_scoreboard/controller/league_controller.dart';
import 'package:football_scoreboard/controller/main_screen_controller.dart';
import 'package:football_scoreboard/controller/today_controller.dart';
import 'package:football_scoreboard/controller/upcoming_controller.dart';
import 'package:football_scoreboard/controller/user_controller.dart';
import 'package:football_scoreboard/view/home/widget/main_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserController()),
    ChangeNotifierProvider(create: (_) => MainScreenController()),
    ChangeNotifierProvider(create: (_) => TodayController()),
    ChangeNotifierProvider(create: (_) => UpcomingController()),
    ChangeNotifierProvider(create: (_) => LeagueController()),
  ], child: MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}