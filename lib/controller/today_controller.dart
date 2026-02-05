import 'package:flutter/foundation.dart';
import 'package:football_scoreboard/model/today_model.dart';
import 'package:football_scoreboard/service/today_service.dart';

class TodayController with ChangeNotifier {
  final TodayService todayService = TodayService();

  DateTime selectedDate = DateTime.now();

  void changeDate(DateTime date) {
    selectedDate = DateTime(date.year,date.month,date.day);
    notifyListeners();
  }

  Stream<List<TodayModel>> get todayMatches {
    return todayService.getTodayMatch(selectedDate);
  }
}