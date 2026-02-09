import 'package:flutter/material.dart';
import 'package:football_scoreboard/model/league_model.dart';
import 'package:football_scoreboard/model/team_model.dart';
import 'package:football_scoreboard/service/league_service.dart';

class LeagueController with ChangeNotifier {
  final LeagueService leagueService = LeagueService();

  TeamModel? selectedTeam;

  void setSelecTeam(TeamModel team) {
    selectedTeam = team;
    notifyListeners();
  }

  void clearSelectedTeam() {
    selectedTeam = null;
    notifyListeners();
  }

  Future<List<LeagueModel>> get leagueMaches {
    return leagueService.getLeague();
  }

  Future<void> addLeague(LeagueModel model) async {
    await leagueService.addLeague(model);
    clearSelectedTeam();
    notifyListeners();
  }

  Future<void> deleteLeague(String id) async {
    await leagueService.deleteLeague(id);
    notifyListeners();
  }
}
