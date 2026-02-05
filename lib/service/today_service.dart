import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:football_scoreboard/model/today_model.dart';

class TodayService {
  final FirebaseFirestore todayMatch = FirebaseFirestore.instance;

  Stream<List<TodayModel>> getTodayMatch(DateTime date) {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(Duration(days: 1));

    return todayMatch
        .collection('matches')
        .where('date', isLessThan: Timestamp.fromDate(end))
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return TodayModel.fromMap(doc.data(), doc.id);
          }).toList();
        });
  }
}
