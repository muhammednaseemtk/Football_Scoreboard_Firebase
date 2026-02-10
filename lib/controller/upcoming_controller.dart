import 'package:flutter/material.dart';
import 'package:football_scoreboard/model/team_logo_model.dart';
import 'package:football_scoreboard/model/upcoming_model.dart';
import 'package:football_scoreboard/service/upcoming_service.dart';

class UpcomingController with ChangeNotifier {
  final UpcomingService upcomingService = UpcomingService();

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

  Future<List<UpcomingModel>> get upcomingMaches {
    return upcomingService.getUpcomingMatch();
  }

  Future<void> addUpcomingMatch(UpcomingModel model) async {
    await upcomingService.addUpcomingMatch(model);
    clearSelectedTeamA();
    clearSelectedTeamB();
  }

  Future<void> deleteUpcomingMatch(String id) async {
    await upcomingService.deleteUpcomgMatch(id);
    notifyListeners();
  }
}
