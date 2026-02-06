import 'package:flutter/material.dart';
import 'package:football_scoreboard/model/upcoming_model.dart';
import 'package:football_scoreboard/service/upcoming_service.dart';

class UpcomingController with ChangeNotifier {
  final UpcomingService upcomingService = UpcomingService();

  Future<List<UpcomingModel>> get upcomingMaches {
    return upcomingService.getUpcomingMatch();
  }

  Future<void> addUpcomingMatch(UpcomingModel model) async {
    await upcomingService.addUpcomingMatch(model);
    notifyListeners();
  }

  Future<void> deleteUpcomingMatch(String id) async {
    await upcomingService.deleteUpcomgMatch(id);
    notifyListeners();
  }
}