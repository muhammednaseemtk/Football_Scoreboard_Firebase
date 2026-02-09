import 'package:flutter/material.dart';
import 'package:football_scoreboard/model/team_logo_model.dart';
import 'package:football_scoreboard/model/today_model.dart';
import 'package:football_scoreboard/service/today_service.dart';

class TodayController with ChangeNotifier {
  final TodayService todayService = TodayService();

  TeamALogoModel? selectedTeamA;
  TeamBLogoModel? selectedTeamB;


  void setTeamA(TeamALogoModel teamA) {
    selectedTeamA = teamA;
    notifyListeners();
  }

  void clearSelectedTeamA() {
    selectedTeamA = null;
    notifyListeners();
  }

  void setTeamB(TeamBLogoModel teamB) {
    selectedTeamB = teamB;
    notifyListeners();
  }

  void clearSelectedTeamB() {
    selectedTeamB = null;
    notifyListeners();
  }

  Future<List<TodayModel>> get todayMaches {
    return todayService.getTodayMatch();
  }

  Future<void> addTodayMatch(TodayModel model) async {
    await todayService.addTodayMatch(model);
    clearSelectedTeamA();
    clearSelectedTeamB();
    notifyListeners();
  }

  Future<void> deleteTodayMatch(String id) async {
    await todayService.deleteTodayMatch(id);
    notifyListeners();
  }
}