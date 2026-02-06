import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:football_scoreboard/model/today_model.dart';

class TodayService {
  final FirebaseFirestore today = FirebaseFirestore.instance;

  Future<List<TodayModel>> getTodayMatch() async {
    final snapshot = await today.collection('todayMatches').get();

    return snapshot.docs.map((doc) {
      return TodayModel.fromMap(doc.data(),doc.id);
    }).toList();
  }

  Future<void> addTodayMatch(TodayModel model) async {
    await today.collection('todayMatches').add(model.toMap());
  }

  Future<void> deleteTodayMatch(String id) async {
    await today.collection('todayMatches').doc(id).delete();
  }
}