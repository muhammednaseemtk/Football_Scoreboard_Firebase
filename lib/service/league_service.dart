import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:football_scoreboard/model/league_model.dart';

class LeagueService {
  final FirebaseFirestore league = FirebaseFirestore.instance;

  Future<List<LeagueModel>> getLeague() async {
    final snapshot = await league.collection('leagues').get();

    return snapshot.docs.map((doc) {
      return LeagueModel.fromMap(doc.data(),doc.id);
    }).toList();
  }

  Future<void> addLeague(LeagueModel model) async {
    await league.collection('leagues').add(model.toMap());
  }

  Future<void> deleteLeague(String id) async {
    await league.collection('leagues').doc(id).delete();
  }
}