import 'package:flutter/material.dart';
import 'package:football_scoreboard/model/today_model.dart';
import 'package:football_scoreboard/service/today_service.dart';

class TodayController with ChangeNotifier {
  final TodayService todayService = TodayService();

  Future<List<TodayModel>> get todayMaches {
    return todayService.getTodayMatch();
  }

  Future<void> addMatch(TodayModel model) async {
    await todayService.addTodayMatch(model);
    notifyListeners();
  }

  Future<void> deleteMatch(String id) async {
    await todayService.deleteTodayMatch(id);
    notifyListeners();
  }
}